if (keyboard_check_pressed(vk_down)){
	current++
}

if (keyboard_check_pressed(vk_up)) {
	current--
}

current = clamp(current, 0, array_length(menu) - 1);

if (keyboard_check_pressed(vk_enter)) {
	menu[current]._function();
}
