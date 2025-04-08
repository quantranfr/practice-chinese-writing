const supabaseUrl = 'https://nozrmjribdlzawdgxqxu.supabase.co'
const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5venJtanJpYmRsemF3ZGd4cXh1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzY3ODk5MTIsImV4cCI6MjA1MjM2NTkxMn0.GHHlx6_nAz7O7M8MwxqaWRqbQq1-D46BibBCFbc_cKs'

class WordList {

  constructor(category) {
    this.category = category;
    this.words = []; // [{ character: "你", pinyin: "nǐ", hv: "ni", canton: "nei5" },...]
    this.skippedWords = [];
    this.notSeenWords = [];
    this.needPracticeWords = [];
    this.currentWord = undefined;
    this.writer = new Array(5).fill(undefined); // 5 HanziWriter object;
    this.quizWords = [];
    this.loadWords();
  }

  async loadWords() {
    const url = `${supabaseUrl}/rest/v1/rpc/get_vocab_by_category`;

    const headers = {
      'apikey': supabaseKey,
      'Authorization': 'Bearer ' + supabaseKey,
      'Content-Type': 'application/json'
    };

    const category = this.category;

    const body = JSON.stringify({ category });

    const response = await fetch(url, {
      method: 'POST',
      headers,
      body
    });

    const data = await response.json();

    // Parse JSON data
    for (var i = 0; i < data.length; i++) {
      this.words.push({
        character: data[i].simplified,
        pinyin: data[i].pinyin,
        hv: data[i].hanviet,
        canton: data[i].cantonese,
        english: data[i].english,
        wohok_link: data[i].wohok_link
      });
    }
    this.loadLocalStorage();
    this.updateUI();
  }

  loadLocalStorage() {
    this.skippedWords = JSON.parse(localStorage.getItem(`${this.category} skipped`)) || [];
    this.needPracticeWords = JSON.parse(localStorage.getItem(`${this.category} needPractice`)) || [];

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
  
  reviewEasy() {
    this.setCurrentWord(this.getRandomWord(this.skippedWords));
    this.updateUI();
  }

  setHard() {
    this.popWord(this.notSeenWords, this.currentWord);
    this.popWord(this.skippedWords, this.currentWord);
    this.pushWord(this.needPracticeWords, this.currentWord);
    this.updateStorage();
    this.updateUI();
  }

  setEasy() {
    this.popWord(this.notSeenWords, this.currentWord);
    this.popWord(this.needPracticeWords, this.currentWord);
    this.pushWord(this.skippedWords, this.currentWord);
    this.updateStorage();
    this.updateUI();
  }

  nextWord() {
    this.setCurrentWord(this.getRandomWord(this.notSeenWords));
    this.updateUI();
  }

  reset() {
    this.skippedWords = [];
    this.needPracticeWords = [];
    this.notSeenWords = this.words.slice();
    this.setCurrentWord(undefined);
    this.updateStorage();
    this.updateUI();
  }

  updateUI() {
    if (!this.words.length) {
      $("#nextButton").html(`<i class="fas fa-play"></i>`).prop("disabled", true);
      $("#resetButton").prop("disabled", true);
      $("#reviewHardButton").html(`<i class="fas fa-sync-alt"></i>`).prop("disabled", true);
      $("#addHardButton").html(`<i class="fas fa-plus"></i> Hard`).prop("disabled", true);
      $("#addEasyButton").html(`<i class="fas fa-plus"></i> Easy`).prop("disabled", true);
      $("#reviewEasyButton").html(`<i class="fas fa-sync-alt"></i>`).prop("disabled", true);
    } else {
      $("#resetButton").prop("disabled", this.words.length == this.notSeenWords.length);
      $("#nextButton").prop("disabled", this.notSeenWords.length == 0);
      $("#nextButton").html(`<i class="fas fa-play"></i> ${this.notSeenWords.length}`);
      $("#reviewHardButton").prop("disabled", this.needPracticeWords.length == 0);
      $("#reviewHardButton").html(`<i class="fas fa-sync-alt"></i> ${this.needPracticeWords.length}`);
      $("#reviewEasyButton").prop("disabled", this.skippedWords.length == 0);
      $("#reviewEasyButton").html(`<i class="fas fa-sync-alt"></i> ${this.skippedWords.length}`);
    }
    $("#addHardButton, #addEasyButton, #quizButton, #checkButton").prop("disabled", !this.currentWord);
    if (this.currentWord) {
      $("#spelling").text(`${this.currentWord.pinyin}`);
    } else {
      $("#spelling").text("");
      $("#clearButton").trigger("click");
    }
    $("#character").text("");
    this.unwrite();
  }

  showDetails() {
    if (this.currentWord) {
      const cantonese = this.currentWord.canton
        ? `<br>Cantonese: ${this.currentWord.canton}`
        : '';

      const hanviet = this.currentWord.hv
        ? `<br>Hán Việt: ${this.currentWord.hv}`
        : '';

      const english = this.currentWord.english
        .map(e => `${e.part_of_speech}: ${e.meaning}`)
        .join('<br>');

      /*
      const wohokLink = this.currentWord.wohok_link
        ? `<a href="${this.currentWord.wohok_link}" target="_blank">Show usage</a>`
        : '';
        */

      const content = [
        '<strong style="color: #666;">Other pronunciations</strong>',
        cantonese,
        hanviet,
        '<br><br><strong style="color: #666;">Definition</strong><br>',
        english
      ].join('');

      $('#detailsModalBody').html(content); // Set the content of the modal body
      $('#detailsModal').modal('show'); // Show the modal
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

  quiz() {
    // quit if no current word
    if (!this.currentWord) {
      return
    }
    
    // select 4 random words of the same length as the current word
    const words = this.words.filter((word) => word.character.length === this.currentWord.character.length);
    this.quizWords = [];
    this.quizWords.push(this.currentWord);
    while (this.quizWords.length < 4 && words.length > 0) {
      let word = this.popRandomWord(words);
      if (word && !this.quizWords.some(qWord => qWord.character === word.character)) {
        this.quizWords.push(word);
      }
    }

    this.quizWords.sort(() => Math.random() - 0.5);
    const quizOptions = this.quizWords.map((word, i) => {
      return `<button class="btn btn-outline-primary btn-block quiz-option" data-index="${i}" style="font-size: 1.5rem;">${word.character}</button>`;
    }).join('');
    $('#quizSpelling').text(this.currentWord.pinyin);
    $('#quizOptions').html(quizOptions);
    $('#quizFeedback').html('');
    $('#quizModal').modal('show');
  }

  checkAnswer(index) {
    const word = this.quizWords[index];
    if (word.character === this.currentWord.character) {
      $('#quizFeedback').html(`<p class="text-success">Correct!</p>`);
      this.setEasy();
    } else {
      $('#quizFeedback').html(`<p class="text-danger">Wrong! The correct answer is ${this.currentWord.character}</p>`);
      this.setHard();
    }
  }

  check() {
    if (this.currentWord) {
      $("#character").text(this.currentWord.character);
      Array.from(this.currentWord.character).forEach((char, i) => {
        this.write(i, char);
      });
    }
  }

  updateStorage() {
    localStorage.setItem(`${this.category} skipped`, JSON.stringify(this.skippedWords));
    localStorage.setItem(`${this.category} needPractice`, JSON.stringify(this.needPracticeWords));
  }
}

$(document).ready(function () {
  var wordList = null;
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

  $("#selectCategory").change(function () {
    if (wordList) {
      wordList.words = [];
      wordList.currentWord = null;
      wordList.updateUI();
    }
    var category = $(this).val();
    if (category != "") {
      wordList = new WordList(category);
      wordList.updateUI();
    }
  });

  $("#selectCategory").trigger('change');

  $("#reviewHardButton").click(function () {
    wordList.review();
    wordList.setHard();
    $("#addHardButton").prop("disabled", true);
    clearDrawing();
  });
  
  $("#addHardButton").click(function () {
    if (wordList) { wordList.setHard(); }
    $(this).prop('disabled', true);
    $("#addEasyButton").prop('disabled', false);
  });

  $("#addEasyButton").click(function () {
    if (wordList) { wordList.setEasy(); }
    $(this).prop('disabled', true);
    $("#addHardButton").prop('disabled', false);
  });
  
  $("#reviewEasyButton").click(function () {
    wordList.reviewEasy();
    wordList.setEasy();
    $("#addEasyButton").prop("disabled", true);
    clearDrawing();
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

  $("#detailsButton").click(function () {
    wordList.showDetails();
  });

  $("#quizButton").click(function() {
    wordList.quiz();
  });

  $("#quizNextButton").click(function() {
    $("#nextButton").trigger("click");
    wordList.quiz();
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

  $(document).on("click", ".quiz-option", function () {
    var index = $(this).data("index");
    wordList.checkAnswer(index);
  });

  var year = new Date().getFullYear();
  $("#currentYear").text(year);
});
