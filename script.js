class WordList {

  constructor(filename) {
    this.filename = filename;
    this.words = []; // [{ character: "你", pinyin: "nǐ", hv: "ni", canton: "nei5" },...]
    this.skippedWords = [];
    this.notSeenWords = [];
    this.needPracticeWords = [];
    this.currentWord = undefined;
    this.writer = new Array(5).fill(undefined); // 5 HanziWriter object;
    this.loadWords();
  }

  loadWords() {
    fetch(this.filename)
      .then((response) => response.text())
      .then((data) => {
        // Parse CSV data
        var rows = data.split("\n");
        for (var i = 1; i < rows.length; i++) {
          var columns = rows[i].split(",");
          if (columns.length < 4) continue;
          this.words.push({
            character: columns[0],
            pinyin: columns[1],
            hv: columns[2],
            canton: columns[3],
          });
        }
        this.loadLocalStorage();
        this.nextWord();
      })
      .catch((error) => {
        console.error("Error loading word list:", error);
      });
  }

  loadLocalStorage() {
    this.skippedWords = JSON.parse(localStorage.getItem(`${this.filename} skipped`)) || [];
    this.needPracticeWords = JSON.parse(localStorage.getItem(`${this.filename} needPractice`)) || [];

    const skippedCharacters = this.skippedWords.map((word) => word.character);
    const needPracticeCharacters = this.needPracticeWords.map((word) => word.character);

    // recalculate notSeenWords
    this.notSeenWords = this.words.filter(
      (word) =>
        !skippedCharacters.includes(word.character) &&
        !needPracticeCharacters.includes(word.character)
    );
  }

  getRandomWord(wordList) {
    if (wordList.length === 0) {
      return undefined;
    } else if (wordList.length === 1) {
      return wordList[0];
    } else {
      let word = this.currentWord;
      let randomIndex;
      while (word === this.currentWord) {
        randomIndex = Math.floor(Math.random() * wordList.length);
        word = wordList[randomIndex];
      }
      return word;
    }
  }

  popWord(wordList, word) {
    if (wordList.length > 0) {
      let index = wordList.indexOf(word);
      if (index >= 0) {
        wordList.splice(index, 1)[0];
      }
    }
  }

  popRandomWord(wordList) {
    if (wordList.length > 0) {
      let randomIndex = Math.floor(Math.random() * wordList.length);
      return wordList.splice(randomIndex, 1)[0];
    } else {
      return undefined;
    }
  }

  pushWord(wordList, word) {
    if (word && !wordList.includes(word)) {
      wordList.push(word);
    }
  }

  setCurrentWord(word) {
    this.currentWord = word;
  }

  review() {
    this.setCurrentWord(this.getRandomWord(this.needPracticeWords));
    this.updateUI();
  }

  setHard() {
    this.popWord(this.notSeenWords, this.currentWord);
    this.popWord(this.skippedWords, this.currentWord);
    this.pushWord(this.needPracticeWords, this.currentWord);
    this.updateStorageHard();
    this.updateUI();
  }

  setEasy() {
    this.popWord(this.notSeenWords, this.currentWord);
    this.popWord(this.needPracticeWords, this.currentWord);
    this.pushWord(this.skippedWords, this.currentWord);
    this.updateStorageEasy();
    this.updateUI();
  }

  nextWord() {
    this.setCurrentWord(this.getRandomWord(this.notSeenWords));
    this.updateUI();
  }

  reset() {
    this.currentWord = undefined;
    this.skippedWords = [];
    this.needPracticeWords = [];
    this.notSeenWords = this.words.slice();
    this.setCurrentWord(undefined);
    this.updateStorageEasy();
    this.updateStorageHard();
    this.updateUI();
  }

  updateUI() {
    $("#reviewButton, #nextButton, #resetButton").prop("disabled", false);
    $("#reviewButton").prop("disabled", this.needPracticeWords.length == 0);
    $("#hardButton").prop("disabled", !this.currentWord);
    $("#hardButton").html(`Hard (${this.needPracticeWords.length})`);
    $("#easyButton").prop("disabled", !this.currentWord);
    $("#easyButton").html(`Easy (${this.skippedWords.length})`);
    $("#nextButton").prop("disabled", this.notSeenWords.length == 0);
    $("#nextButton").html(`<i class="fas fa-play"></i> (${this.notSeenWords.length})`);
    $("#hintButton").prop("disabled", !this.currentWord);
    $("#checkButton").prop("disabled", !this.currentWord);

    if (this.currentWord) {
      $("#spelling").text(`${this.currentWord.pinyin} (Cantonese: ${this.currentWord.canton}, Hán Việt: ${this.currentWord.hv})`);
    } else {
      $("#spelling").text("");
    }
    $("#character").text("");
    this.unwrite();
  }

  hint() {
    if (this.currentWord) {
      $("#character").text(this.currentWord.character);
      setTimeout(() => { // disappear after 0.4 seconds
        $("#character").text("");
      }, 400);
    }
  }

  write(pos, character) { // writer is a HanziWriter object
    if (this.writer[pos] == undefined) {
      this.writer[pos] = HanziWriter.create('ch' + pos, character, {
        width: 60,
        height: 60,
        padding: 2,
        delayBetweenStrokes: 150,
        delayBetweenLoops: 2000,
        radicalColor: '#168F16',
      });
    } else {
      this.writer[pos].setCharacter(character);
    }
    this.writer[pos].showOutline();
    this.writer[pos].loopCharacterAnimation();
  }

  unwrite() {
    this.writer.forEach((writer) => {
      if (writer) {
        writer.hideCharacter();
        writer.hideOutline();
      }
    });
  }

  check() {
    if (this.currentWord) {
      $("#character").text(this.currentWord.character);
      Array.from(this.currentWord.character).forEach((char, i) => {
        this.write(i, char);
      });
    }
  }

  updateStorageEasy() {
    localStorage.setItem(`${this.filename} skipped`, JSON.stringify(this.skippedWords));
  }

  updateStorageHard() {
    localStorage.setItem(`${this.filename} needPractice`, JSON.stringify(this.needPracticeWords));
  }
}

$(document).ready(function () {
  var wordList;
  var canvas = document.getElementById("drawingCanvas");
  var context = canvas.getContext("2d");
  var isDrawing = false;

  function clearDrawing() {
    context.clearRect(0, 0, canvas.width, canvas.height);
  }

  function getXY(event) {
    var x, y;
    var rect = canvas.getBoundingClientRect(); // Get canvas position
    if (event.type === "touchmove") {
      x = event.touches[0].pageX - rect.left - window.scrollX;
      y = event.touches[0].pageY - rect.top - window.scrollY;
    } else {
      x = event.pageX - rect.left - window.scrollX;
      y = event.pageY - rect.top - window.scrollY;
    }
    return { x, y };
  }

  function startDrawing(event) {
    isDrawing = true;
    var { x, y } = getXY(event);
    context.beginPath();
    context.moveTo(x, y);
  }

  function draw(event) {
    event.preventDefault(); // Prevent default scrolling behavior
    if (!isDrawing) return;
    var { x, y } = getXY(event);
    context.lineTo(x, y);
    context.lineWidth = 3; // Increase the stroke width value as desired
    context.stroke();
  }

  function stopDrawing() {
    isDrawing = false;
  }

  $("#selectLevel").change(function () {
    var filename = $(this).val();
    if (filename === "") return;
    wordList = new WordList(filename);
  });

  $("#selectLevel").trigger('change');

  $("#reviewButton").click(function () {
    wordList.review();
    clearDrawing();
  });

  $("#hardButton").click(function () {
    wordList.setHard();
  });

  $("#easyButton").click(function () {
    wordList.setEasy();
  });

  $("#nextButton").click(function () {
    wordList.nextWord();
    clearDrawing();
  });

  $("#resetButton").click(function () {
    var confirmation = confirm("Your progression will be lost, are you sure?");
    if (confirmation) {
      wordList.reset();
    }
  });

  $("#clearButton").click(function () {
    clearDrawing();
  });

  $("#hintButton").click(function () {
    wordList.hint();
  });

  $("#checkButton").click(function () {
    wordList.check();
  });

  canvas.addEventListener("mousedown", startDrawing);
  canvas.addEventListener("mousemove", draw);
  canvas.addEventListener("mouseup", stopDrawing);
  canvas.addEventListener("mouseout", stopDrawing);

  canvas.addEventListener("touchstart", startDrawing);
  canvas.addEventListener("touchmove", draw);
  canvas.addEventListener("touchend", stopDrawing);
  canvas.addEventListener("touchcancel", stopDrawing);

  var year = new Date().getFullYear();
  $("#currentYear").text(year);
});
