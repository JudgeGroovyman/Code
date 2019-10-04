  var name = (new Date()).toLocaleDateString();
  var bFS = SpreadsheetApp.getActiveSpreadsheet().insertSheet(name); // bestFollowersSheet


or

    var activeSpreadsheet = SpreadsheetApp.getActiveSpreadsheet();
    var yourNewSheet = activeSpreadsheet.getSheetByName("Name of your new sheet");

    if (yourNewSheet != null) {
        activeSpreadsheet.deleteSheet(yourNewSheet);
    }

    yourNewSheet = activeSpreadsheet.insertSheet();
    yourNewSheet.setName("Name of your new sheet");