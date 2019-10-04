// This script takes the spreadsheet as it is output by the google keyword planner
//      Then splits the keywords into 3 groups: Small, Medium, High
//      It overwrites the first three columns to do so
function KeywordTShirtSizes() {
  var sheet = SpreadsheetApp.getActiveSheet();
  var numRows = sheet.getLastRow()-1;     // How many rows in sheet
  
  // Where to output Small Keywords
  var sRow = 1;
  var sCol = 1;
  // Where to output Medium Keywords
  var mRow = 1;
  var mCol = 3;
  // Where to output Large Keywords
  var lRow = 1;
  var lCol = 5;
  
  var myDestination = 0; 
  var myRow = 0; 
  var myCol = 0; 
  
  // Data starts on row 7
  for (var i=7; i<numRows; i++) {
    myRow = 0;
    myCol = 0;
    
    // Get the keyword on this row (Col 10)
    var keyword = sheet.getRange(i, 10).getValue();
    // Get the volume on this row (Col 13)
    var volume = sheet.getRange(i, 13).getValue();

    // Small
    if (volume > 50) {
      if (volume < 150) {
        myRow = sRow++;
        myCol = sCol;
        

      // Output the Keywords
      myDestination = sheet.getRange(myRow,myCol);
      myDestination.setValue(keyword); 
      
      // Output the Volume
      myDestination = sheet.getRange(myRow,myCol+1);
      myDestination.setValue(volume); 
      }
    }
    
    // Medium
    if (volume > 150) {
      if (volume < 500) {
        myRow = mRow++;
        myCol = mCol;
        
        
      // Output the Keywords
      myDestination = sheet.getRange(myRow,myCol);
      myDestination.setValue(keyword); 
      
      // Output the Volume
      myDestination = sheet.getRange(myRow,myCol+1);
      myDestination.setValue(volume); 
      }
    }
    
    // Large
    if (volume > 500) {
      if (volume < 800) {
        myRow = lRow++;
        myCol = lCol;
        
        
      // Output the Keywords
      myDestination = sheet.getRange(myRow,myCol);
      myDestination.setValue(keyword); 
      
      // Output the Volume
      myDestination = sheet.getRange(myRow,myCol+1);
      myDestination.setValue(volume); 
      }
    }
    
  }
}
