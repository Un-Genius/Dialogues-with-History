var new_text = read_response_from_json()

if new_text != false
{
	text = new_text;
	alarm[0] = 1;
}

alarm[1] = 60;