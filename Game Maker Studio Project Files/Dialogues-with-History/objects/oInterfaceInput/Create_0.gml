// Inherit the parent event
event_inherited();

#region CUSTOMIZEABLE VARIABLES
text = "" // text displayed and to be edited
label = ""; // the label put on the left of the input text
labelOffset = 5; //the amount in pixels that the label get offset from the input text
textMaxCharacters = 1000; //limit the amout of characters
inside_margins = 12.5
width = 500 - (inside_margins*2);
height = 230;
enabled = true;

targetScript = noone;
targetScriptArgs[0] = noone;

guiSprite = sprInputText;
guiSpriteFocus = sprInputText;
depth = 0; //always above panels

fontType = global.language_font;
fontScale = 1;
fontColor = c_yellow;
textOffset = 10;

selectionOffset = 10;

selectAllOnClick = false;

#endregion