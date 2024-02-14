#macro game_name "Dialogues-with-History"
#macro file_name "commands.json"

function write_command_to_json(_command, _parameters="None")
{	
	show_debug_message("Writing command: " + _command)
	show_debug_message("Writing parameters: " + _parameters)

	var json_map = ds_map_create();
	ds_map_add(json_map, "command", _command);
	ds_map_add(json_map, "parameters", _parameters);

	var json_string = json_encode(json_map);
	ds_map_destroy(json_map);
	
	var localAppDataPath = environment_get_variable("LOCALAPPDATA");
	var fullPath = localAppDataPath + "\\" + game_name + "\\" + file_name;

	// Ensure the directory exists
	var dirPath = localAppDataPath + "\\" + game_name;
	if (!directory_exists(dirPath)) {
	    directory_create(dirPath);
	}

	// Open the file for writing
	var file = file_text_open_write(fullPath);
	if (file != -1) {
	    file_text_write_string(file, json_string); // Example JSON content
	    file_text_close(file);
	} else {
	    show_debug_message("Failed to open file for writing.");
	}
}

function read_response_from_json()
{
    var localAppDataPath = environment_get_variable("LOCALAPPDATA");
    var fullPath = localAppDataPath + "\\" + game_name + "\\" + "response.json";

    // Check if the directory exists, in case the file might not be present
    var dirPath = localAppDataPath + "\\" + game_name;
    if (!directory_exists(dirPath)) {
        show_debug_message("Directory does not exist: " + dirPath);
        return;
    }
	
	if !file_exists(fullPath)
		return false

    var file = file_text_open_read(fullPath);
    var json_string = "";
    if (file != -1) {
        json_string = file_text_read_all(file);
        file_text_readln(file);  // Move the file pointer to the next line in case of multi-line JSON
        file_text_close(file);
		file_delete(fullPath)
    } else {
        show_debug_message("Failed to open file for reading: " + fullPath);
        return;
    }

    var response_map = json_decode(json_string);

    if (ds_exists(response_map, ds_type_map)) {
        var response = ds_map_find_value(response_map, "response");
        // Process the response as needed
        show_debug_message(response);

        ds_map_destroy(response_map);
		
		return response
    } else {
        // Handle error if JSON is not properly formatted
        show_debug_message("Error reading or parsing JSON response.");
    }
}
