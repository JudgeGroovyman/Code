function SplitInto50() {
  var sheet = SpreadsheetApp.getActiveSheet();
  var numRows = sheet.getLastRow()-1;     // How many rows in sheet
  var outputColumn = 2
  for (var i=2; i<numRows; i+=50) {
    var firstSetOf50 = sheet.getRange(i, 1, 50).getValues();
    var myDestination = sheet.getRange(1,outputColumn++,50);
    myDestination.setValues(firstSetOf50); 
  }
}
