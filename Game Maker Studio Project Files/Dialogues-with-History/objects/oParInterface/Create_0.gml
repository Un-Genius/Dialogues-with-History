/// @description Insert description here
// You can write your code in this editor







// Inherit the parent event
event_inherited();

///CREATE BUTTONS & PANEL
var _ww = display_get_width();
var _hh = display_get_height();

var _outside_margins = 25
var _inside_margins = 12.5

x = _ww - 500 - _outside_margins;
y = _outside_margins;

width = 500;
height = _hh - (_outside_margins*2);

var _btn_width = width - (_inside_margins*2);
var _btn_height = 100;
var _btn_offset = 5;

var _inst = noone;

_inst = instance_create(x + _inside_margins, y + height - _inside_margins - 230 - 40, objGUILabel)
_inst.text = "Input Text";
instance_create(x + _inside_margins, y + height - _inside_margins - 230, oInterfaceInput)
instance_create(x + _inside_margins, y + height - _inside_margins - 700, oTextOutput)

//_wy += _btn_height + _btn_offset;
//gui_create_button(_wx, _wy, _btn_width, _btn_height, "Host Match\nWIP", func_room_goto, roomMenuHost);

//_wy += _btn_height + _btn_offset;
//var _btn = instance_create(_wx, _wy, oParMenuOptions);
//_btn.width = _btn_width;
//_btn.height = _btn_height;

//gui_create_button(_wx, _hh - (_offset*3*2) - (_offset*4), _btn_width, _btn_height, "Quit", func_game_end);