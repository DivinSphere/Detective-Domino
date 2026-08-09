if (tempo > 0) {
    var _cx = camera_get_view_x(view_camera[0]);
    var _cy = camera_get_view_y(view_camera[0]);
    
    
    camera_set_view_pos(view_camera[0], 
                        _cx + random_range(-forca, forca), 
                        _cy + random_range(-forca, forca));
    tempo--;
} else {
    
    instance_destroy();
}