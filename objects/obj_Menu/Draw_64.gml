draw_set_font(fnt_cybr);
	
for (var i = 0; i < array_length(menu); i++) {
	
	var _color = c_white;
	var _height = string_height("I") * 2.7
	var _size = fnt_cybr;
	
	if (i == current) {
		_color = c_yellow;
		_size = fnt_cybr_Size;
	}
	
	draw_set_color(_color)
	draw_set_font(_size)
	draw_text(380, 190 + _height * i, menu[i].text);
	draw_set_color (-1);
}
