if (place_meeting(x, y, obj_Gorilla)) {
	instance_destroy();
	//(other);
}

if (x < view_xview[0] - 32 || x > view_xview[0] + view_wview[0] + 32 ||
    y < view_yview[0] - 32 || y > view_yview[0] + view_hview[0] + 32) {
    instance_destroy();
}