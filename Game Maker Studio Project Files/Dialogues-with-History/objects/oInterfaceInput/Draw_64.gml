if( sprite_index != -1 ){
	draw_sprite_stretched_ext(	sprite_index, 0, 
								buttonLeft, buttonTop, buttonRight-buttonLeft, buttonBottom-buttonTop, 
								image_blend, image_alpha );
}

#region DRAW TEXT

var textX = 0;
var textY = 0;

var _stringHeight = string_height("M");
    
if(origin == "CENTER"){
    textX = buttonX;
    textY = buttonY;
}else{
    textX = buttonX + textOffset;
    textY = buttonY + 15;
}
    
//DISPLAY CURSOR
var displayText = string_insert("|", text, cursorPosition);
if( !onFocus ){
    displayText = text;
}

//DRAW LABEL
draw_set_font_ext( fontType, fontColor, fa_right, fa_middle, 1 );
draw_text_outline( buttonX - labelOffset, textY, label, -1, 1000, c_black, fontScale );

if(origin == "CENTER"){
	draw_set_font_ext(fontType, fontColor, fa_center, fa_middle, 1);
}else{
	draw_set_font_ext(fontType, fontColor, fa_left, fa_top, 1);
}
	
var maxWidth = width - (inside_margins*2);
displayText = break_text_into_lines(displayText, maxWidth);

draw_text_outline(textX, textY, displayText, -1, 1000, c_black, fontScale);
    
#region DRAW MARKED AREA    
if( onFocus && cursorSelectPosition != -1){
    draw_set_colour(c_ltgray);
    draw_set_alpha(0.3);
        
    var wx1 = textX + (fontScale * string_width(string_hash_to_newline(string_copy(text, 0, cursorSelectPosition-1))));
    var selectWidth = 0;
    var subString = "";
    if( cursorPosition > cursorSelectPosition ){
        subString = string_copy(text, cursorSelectPosition, cursorPosition-cursorSelectPosition);
        selectWidth = (fontScale * string_width(string_hash_to_newline(subString)));
    }else{
        wx1 += string_width(string_hash_to_newline("|"));
        subString = string_copy(text, cursorPosition, cursorSelectPosition-cursorPosition);
        selectWidth = -(fontScale * string_width(string_hash_to_newline(subString)));
    }
    var wx2 = wx1 + selectWidth;
        
    var wy1 = buttonTop + selectionOffset;
    var wy2 = buttonBottom - selectionOffset;
    draw_rectangle(wx1, wy1, wx2, wy2, false);
        
    draw_set_alpha(1);
}
#endregion


#endregion