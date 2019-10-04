function highlightText(findMe) {
    var body = DocumentApp.getActiveDocument().getBody();
    var foundElement = body.findText(findMe);

    while (foundElement != null) {
        // Get the text object from the element
        var foundText = foundElement.getElement().asText();

        // Where in the Element is the found text?
        var start = foundElement.getStartOffset();
        var end = foundElement.getEndOffsetInclusive();

        // Change the background color to yellow
        foundText.setBackgroundColor(start, end, "#FCFC00");

        // Find the next match
        foundElement = body.findText(findMe, foundElement);
    }
}