/// @description CREATE YOUR GLOBALS AND ENUMS HERE

///LOAD SOUND ALWAYS ON
audio_group_load(AlwaysOn);

#region INI FILE
ini_open("CONFIG.INI");

var value = ini_read_real("prefs", "sound", 100);
audio_group_set_gain(AlwaysOn, value/100, 1);

value = ini_read_real("prefs", "music", 100);
musicVolume = value/100;
audio_group_set_gain(audiogroup_default, value/100, 1);
var inst = instance_create(-1000, -1000, objMusicBox);
inst.musicVolume = musicVolume;

ini_close();
#endregion

#region CREATE ESSENTIAL OBJECTS

instance_create(-1000, -1000, objMouseGui);
instance_create(-1000, -1000, objParticleEngine);
instance_create(-1000, -1000, objGamepadDetector);
instance_create(-1000, -1000, oCamera);

#endregion

#region RUN ESSENTIAL SCRIPTS

lang_initialize();
rebind_keys_initialize();

global.language_font = fntStandard;

#endregion

// Debug menu
global.debug = false;

// For when mouse is over UI or world
global.mouse_on_ui = false;

///GO TO MAIN ROOM
room_goto(roomInterface);