if (is_dead && flash_timer > 0) {
    if ((flash_timer div 5) mod 2 == 0) {
        image_blend = c_red;
    } else {
        image_blend = c_white;
    }

} else if (damage_effect_timer > 0) {
    var t = damage_effect_timer / damage_effect_duration;
    var r = 255;
    var g = lerp(0, 255, t);
    var b = lerp(0, 255, t);
    image_blend = make_color_rgb(r, g, b);

} else if (is_stunned) {
    var t = 1 - stun_effect_intensity;
    var r = lerp(0, 255, t);
    var g = 255;
    var b = 255;
    image_blend = make_color_rgb(r, g, b);

} else {
    image_blend = c_white;
}

draw_self();
draw_set_color(c_white);
