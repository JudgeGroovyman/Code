function SplitAllWordsIntoOneLongRow() {
  
  var inputSheet  = SpreadsheetApp.getActiveSpreadsheet().getSheetByName("Document With Words to Count");
  var outputSheet = SpreadsheetApp.getActiveSpreadsheet().getSheetByName("Every Word");
  
  var wordList = [], wordList2D = [], wordCounts = [], wordCounts2D = [];
  linesRange = inputSheet.getRange("A:A");
  wordList = getAllWordsInRange(linesRange);
  wordCounts = getWordCounts(wordList);
  wordCounts2D = convertAssociativeArrayToTwoDimensional(wordCounts);
  wordList2D = pushArrayAsSecondDimension(wordList,wordList2D);
  
  Logger.log(wordCounts2D);
  outputSheet.getRange(1,1,wordCounts2D.length,2).setValues(wordCounts2D);
  outputSheet.getRange(1,1,wordCounts2D.length,2).sort({column: 2, ascending: false});
}

function getAllWordsInRange(inputRange){
  var allWordsInRange = [], wordsInLine = [{}], curLine = "";
  var myLines = inputRange.getValues();
  
  for (var row = 0; row < myLines.length; row++) {
    if (myLines[row] != '') {
      wordsInLine = myLines[row][0].replace(/[.,\/#!$%\^&\*;:{}="'?\-_`~()]/g,"").split(" ");
      allWordsInRange.push.apply(allWordsInRange, wordsInLine);
    }
  }
  return allWordsInRange;
}

function getWordCounts(wordList){
  var wordCountAssociativeArray = [], curWord = "";
  for (var i = 0; i<wordList.length; i++){
    curWord = wordList[i];
    if (curWord.equals("Some") || curWord.equals("some")) {wordCountAssociativeArray[curWord] = 0;}
    else if (wordCountAssociativeArray[curWord] == undefined) {wordCountAssociativeArray[curWord] = 1;} 
    else { wordCountAssociativeArray[curWord] = wordCountAssociativeArray[curWord]+1;}
  }
  return wordCountAssociativeArray;
}

function convertAssociativeArrayToTwoDimensional(associativeArray){
  var output2DArray = [], curKey = 0, rowArray = [];
  var inputKeys = Object.keys(associativeArray);
  for (var i = 0; i < inputKeys.length; i++){
    curKey = inputKeys[i];

    rowArray = [];
    rowArray[0] = curKey;    Logger.log(curKey);
    rowArray[1] = associativeArray[curKey];     Logger.log(associativeArray[curKey]);
    
    output2DArray[i] = rowArray;
  }
  Logger.log(output2DArray);
  return output2DArray;
}

function pushArrayAsSecondDimension(pushThisArray, intoThisArray){
  for (var element=0; element < pushThisArray.length; element++){
    intoThisArray.push([pushThisArray[element]]);
  }
  return intoThisArray;
}