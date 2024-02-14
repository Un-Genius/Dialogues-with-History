/// @function break_text_into_lines(text, maxWidth)
/// @description Breaks a single string into multiple lines based on the maximum width.
/// @param {string} text - The text to break into lines.
/// @param {real} maxWidth - The maximum width of a line in pixels.
/// @returns {string} - The modified text with newline characters inserted.
function break_text_into_lines(text, maxWidth) {
    var result = ""; // The final text with line breaks
    var line = ""; // The current line being constructed
    var words = string_split(text, " "); // Split the text into words

    // Iterate through each word in the text
    for (var i = 0; i < array_length(words); i++) {
        var word = words[i];
        // Check if adding the next word exceeds the maxWidth
        if (string_width(line + word) <= maxWidth || line == "") {
            // Add the word to the current line
            line += word + " ";
        } else {
            // Finish the current line and start a new one with the current word
            result += string_trim(line) + "\n"; // Remove trailing space and add a newline
            line = word + " "; // Start a new line with the current word
        }
    }
    // Add the last line to the result
    result += string_trim(line); // Remove trailing space
    return result;
}

/// @function break_text_into_lines_extra(text, maxWidth)
/// @description Breaks a single string into multiple lines based on the maximum width.
/// @param {string} text - The text to break into lines.
/// @param {real} maxWidth - The maximum width of a line in pixels.
/// @returns {string} - The modified text with newline characters inserted.
function break_text_into_lines_extra(text, maxWidth) {
    var result = ""; // The final text with line breaks
    var line = ""; // The current line being constructed
    var words = string_split(text, " "); // Split the text into words

    // Iterate through each word in the text
    for (var i = 0; i < array_length(words); i++) {
        var word = words[i];
        // Check if adding the next word exceeds the maxWidth
        if (string_width(line + word) <= maxWidth || line == "") {
            // Add the word to the current line
            line += word + " ";
        } else {
            // Finish the current line and start a new one with the current word
            result += string_trim(line) + "\n"; // Remove trailing space and add a newline
            line = word + " "; // Start a new line with the current word
        }
    }
    // Add the last line to the result
    result += line; // Remove trailing space
    return result;
}

/// @function width_from_last_newline(text)
/// @description Calculates the width of the substring from the last newline character to the end of the given text.
/// @param {string} text - The text to measure.
/// @returns {real} - The width of the substring in pixels.
function width_from_last_newline(text) {
    // Find the position of the last newline character
    var lastNewlinePos = string_last_pos(text, "\n");
    
    // If there's no newline in the text, measure the whole string
    if (lastNewlinePos == 0) {
        return string_width(text);
    }
    
    // Extract the substring from the last newline to the end
    var substring = string_copy(text, lastNewlinePos + 1, string_length(text) - lastNewlinePos);
    
    // Return the width of the substring
    return string_width(substring);
}