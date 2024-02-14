/// @description EXECUTE SCRIPT

show_debug_message("Text Sent: " + text);

write_command_to_json("new_input", text)

text = "";

/*
path (required)
	The absolute path to whatever you are trying to run - an executable, a text file, a .url, etc.
	If you are not sure how to get the true path to your file, have the game copy it to save directory (game_save_id).
args (optional)
	Command-line arguments to pass. Non-executables will generally ignore these.
	If omitted, defaults to "".
action (optional)
	What to do with the file, as per lpOperation in MSDN.
	If omitted, defaults to "open".
showCmd (optional)
	One or other magic number (such as 6 for SW_MINIMIZE) from the same MSDN page.
	If omitted, defaults to 5 (SW_SHOW).
*/
// execute_shell_simple()