class WordList {
  constructor(filename) {
    this.filename = filename;
    this.words = []; // [{ character: "你", pinyin: "nǐ", hv: "ni", canton: "nei5" },...]
    this.skippedWords = []; // ["你", "我",...]
    this.currentIndex = undefined;
    this.loadWords();
    this.loadSkippedWords();
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
        this.updateUI();
        this.nextWord();
      })
      .catch((error) => {
        console.error("Error loading word list:", error);
      });
  }

  loadSkippedWords() {
    this.skippedWords = JSON.parse(localStorage.getItem(this.filename)) || [];
    this.updateUI();
  }

  getRandomWordIndex() {
    return Math.floor(Math.random() * this.words.length);
  }

  hasWords() {
    return this.words.length > this.skippedWords.length;
  }

  isSkipped(word) {
    return this.skippedWords.includes(word.character);
  }

  nextWord() {
    let newIndex;
    let word;

    while (this.hasWords()) {
      newIndex = this.getRandomWordIndex();
      word = this.words[newIndex];
      if (this.isSkipped(word)) continue;
      this.currentIndex = newIndex;
      break;
    }

    this.updateUI();
  }

  skipWord() {
    let word = this.getCurrentWord();
    if (word) {
      this.skippedWords.push(word.character);
      this.updateStorage();
      this.nextWord();
    }
  }

  resetSkipped() {
    this.skippedWords = [];
    this.updateStorage();
    this.updateUI();
  }

  getCurrentWord() {
    // if current index is defined, return the word, otherwise return undefined
    return this.currentIndex != undefined
      ? this.words[this.currentIndex]
      : undefined;
  }

  resetSkippedWords() {
    this.skippedWords = [];
    this.updateStorage();
  }

  updateUI() {
    $("#nextButton, #resetSkipButton").prop("disabled", false);
    $("#skipButton").prop("disabled", this.words.length == this.skippedWords.length);
    $("#nbSkipped").text(this.skippedWords.length);

    let word = this.getCurrentWord();
    if (word) {
      $("#spelling").text(word.pinyin + " (" + word.canton + ")");
    }
    $("#character").text("");
    $("#hv").text("");
  }

  check() {
    let word = this.getCurrentWord();
    if (word) {
      $("#character").text(word.character);
      $("#hv").text(" (" + word.hv + ")");
    }
  }

  updateStorage() {
    localStorage.setItem(this.filename, JSON.stringify(this.skippedWords));
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

  function startDrawing(event) {
    isDrawing = true;
    var x, y;
    if (event.type === "touchstart") {
      x = event.touches[0].pageX - canvas.offsetLeft;
      y = event.touches[0].pageY - canvas.offsetTop;
    } else {
      x = event.pageX - canvas.offsetLeft;
      y = event.pageY - canvas.offsetTop;
    }
    context.beginPath();
    context.moveTo(x, y);
  }

  function draw(event) {
    event.preventDefault(); // Prevent default scrolling behavior
    if (!isDrawing) return;
    var x, y;
    if (event.type === "touchmove") {
      x = event.touches[0].pageX - canvas.offsetLeft;
      y = event.touches[0].pageY - canvas.offsetTop;
    } else {
      x = event.pageX - canvas.offsetLeft;
      y = event.pageY - canvas.offsetTop;
    }
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

  $("#nextButton").click(function () {
    wordList.nextWord();
    clearDrawing();
  });

  // put word into skippedWords array and save to local storage
  $("#skipButton").click(function () {
    wordList.skipWord();
    clearDrawing();
  });

  $("#resetSkipButton").click(function () {
    wordList.resetSkipped();
  });

  $("#clearButton").click(function () {
    clearDrawing();
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

