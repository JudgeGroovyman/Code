// How to use this: 
//    1. From the GUI - Create a form with just one text field that has data validation applied
//    2. From there open the script editor and paste this in as the only code
//    3. Save, Run, then switch back to the form and hit 'preview' at the top
//    4. There should be two text fields now and they should have the same data validation
//    Voila.

// Background: Googlescript for some reason has not implemented any data validation api for forms :(
//             Click the star the following google-issue to bring more attention to the problem:
//             https://code.google.com/p/google-apps-script-issues/issues/detail?id=4216

// Solution: This is NOT a solution.  This is merely a workaround for a small part of the missing APIs. 
//     I thought that while I can't add datavalidation through the API, I CAN duplicate fields through the API so ... 
//     maybe I can add datavalidation to a field manually and then copy that field.  This would let me add new fields
//     that have data validation in them as long as the specifics of the datavalidation don't need to change.


// Next Steps: Augment so the assumptions below aren't required.  
//             Consider starting a library of textfields with variously defined datavalidations
//                 This would let me choose between them in-script
//     

// Another Workaround: This seems to leverage an obscure JQuery library for validation
//      I haven't tried this but it seems more advanced though perhaps more difficult to use
//      http://morning.am/tutorials/google-forms-and-jquery-validation/

// Assumption 1: There is one currently open and active form on your account
// Assumption 2: That form has one and only one text field
// Assumption 3: That forms text field has had data validation added manually (through the GUI)
function CopyValidatedTextField() {
   var form = FormApp.getActiveForm();
   Logger.log("Form ID: " + form.getId());
   var items = form.getItems(FormApp.ItemType.TEXT);
   var stf; //SelectedTextField
   for (var i in items) {
      stf = items[i];
      Logger.log(items[i].getTitle() + ': ' + items[i].getId());
   }
   // assuming one and only one text field exists
   var newTextField = stf.duplicate();
   newTextField.setTitle("This is the copied field!!! - but does it do the same datavalidation?");
   
}
