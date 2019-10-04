// ==========
// Background:  We want to follow users so that some of them will follow us back.
// Problem:     We can only follow a certain number of users per day (max 950 - usually fewer)
// Solution:    Weed out the users that are least likely to follow us back.
// Result:      We will be left with users that are reasonably likely to follow us back.

// ==========
// Practical Matters:
// This will create or overwrite a sheet named after the current date like "July 3 2016"
// 

// ==========
// Criteria:  Which users pass the test?
// Rules: < 3 days since last tweet
// Rules: >= 0.9 followers to friends
// Rules: <= 1.1 followers to friends

function mayTheBestFollowersWin() {
  // Make the original sheet active again
  var activeSpreadsheet = SpreadsheetApp.getActiveSpreadsheet();
  activeSpreadsheet.setActiveSheet(activeSpreadsheet.getSheetByName("Follower List Prior to Processing"));

  // Input: This is the sheet to read from
  var inputSheet = SpreadsheetApp.getActiveSheet(); // originalSheet *****
  var inputSheetRows = inputSheet.getLastRow();     // How many rows in sheet
  var inputSheetName = inputSheet.getName();
  
  // Output: This is the sheet to write to
  var outputSheetName = (new Date()).toLocaleDateString();  //uniqueName
  // Create the new sheet (if it already exists then delete it)
  var outputSheet = activeSpreadsheet.getSheetByName(outputSheetName);  // bestFollowersSheet *****
  if (outputSheet != null) { activeSpreadsheet.deleteSheet(outputSheet); }
  outputSheet = SpreadsheetApp.getActiveSpreadsheet().insertSheet(outputSheetName); 
  
  var cRow = 1; // currentRow - keep track of what line we should be writing to right now
  var ScreenName, Followers, FriendsWith, FFRatio, DateOfLastTweet, TodaysDate, TimeSinceLastTweet;
  
  // For every row of the input sheet *****
  for (var i=2; i<=inputSheetRows; i+=1) {
    // Extract and Calculate the data we need
    ScreenName = inputSheet.getRange(i,1).getValue();
    Followers = inputSheet.getRange(i,6).getValue();
    FriendsWith = inputSheet.getRange(i,7).getValue();
    FFRatio = Followers/FriendsWith;
    DateOfLastTweet = inputSheet.getRange(i,13).getValue();                                     // #TODO: When the spreadsheet format changes these will too
    TodaysDate = getCurrentTimeInDays();
    TimeSinceLastTweet = TodaysDate-DateOfLastTweet;
    
    // Does this user meet our strict criteria
    if (0.9 < FFRatio < 1.1) {
      if (TimeSinceLastTweet < 1.1) {
        Logger.log("%s: Date: %s TimeSince: %s", ScreenName, DateOfLastTweet, TimeSinceLastTweet);
    
        // If criteria are met
        //     Write the data out to the output sheet
        var myDestination = outputSheet.getRange(cRow,1);
        myDestination.setValue(ScreenName);
        myDestination = outputSheet.getRange(cRow,2);
        myDestination.setValue(FFRatio);
        myDestination = outputSheet.getRange(cRow,3);
        myDestination.setValue(DateOfLastTweet);
        myDestination = outputSheet.getRange(cRow,4);
        myDestination.setValue(TimeSinceLastTweet);
        
        //     Increment the line
        cRow++;
      }
    }
  }
  
  function getCurrentTimeInDays(){
    
    var myDestination = outputSheet.getRange(cRow,5);
    myDestination.setValue("=TODAY()");
    var magicNumber = 25568; // Not particularly proud of this but I'm giving up trying to convert between excel numeric dates and javascript numeric dates.  *should* be SO SIMPLE!?!
    var adjustment = -1.4; // actually I pulled all of this a day earlier so I'm giving them some slack 
                                                                                               // #TODO:  zeroize the adjustment the next time I run this because the dates will be fresh then
    return new Date().getTime()/1000/60/60/24 + magicNumber + adjustment;
  }
}