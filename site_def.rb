
def get_host()
    return { 'coord' => { 'x_offset' => 0, 'y_offset' => 0, 'z_offset' => 0 }, 'u_height' => 1, 'depth' => 50, 'name' => 'blank' }
end

def get_cab()
    cab_def = {
        'coord' => { 'x_offset' => 10, 'y_offset' => 10, 'z_offset' => 0, 'x_rack_offset' => 2.25, 'y_rack_offset' => 0, 'z_rack_offset' => 2, 'orientation' => 'y' },
        'dim' => { 'width_thickness' => 0.625, 'height_thickness' => 0.625, 'width' => 24, 'depth' => 36, 'height' => 63 },
        'nodes' =>
            [
                { 'coord' => { 'x_offset' => 0, 'y_offset' => 0, 'z_offset' => 0 }, 'u_height' => 6, 'depth' => 0, 'name' => 'blank' },
                { 'coord' => { 'x_offset' => 0, 'y_offset' => 0, 'z_offset' => (6 * 1.75) }, 'u_height' => 2, 'depth' => 15, 'name' => 'foo.example.com' },
                { 'coord' => { 'x_offset' => 0, 'y_offset' => 0, 'z_offset' => (6 + 2) * 1.75  }, 'u_height' => 1, 'depth' => 19, 'name' => 'bar.example.com' },
                { 'coord' => { 'x_offset' => 0, 'y_offset' => 0, 'z_offset' => (6 + 2 + 1) * 1.75 }, 'u_height' => 2, 'depth' => 15, 'name' => 'baz.example.com' },
            ],
    }

    return cab_def
end

def get_room()
    room = {
        'coord' => { 'x_offset' => 10, 'y_offset' => 10, 'z_offset' => 0, 'height' => 0, 'depth' => 1000, 'width' => 1000 },
        'cabinet' => [
            {
                'coord' => { 'x_offset' => 20, 'y_offset' => 20, 'z_offset' => 0, 'x_rack_offset' => 2.25, 'y_rack_offset' => 0, 'z_rack_offset' => 2, 'orient' => 1 },
                'dim' => { 'width_thickness' => 0.625, 'height_thickness' => 0.625, 'width' => 24, 'depth' => 36, 'height' => 63 },
                'nodes' =>
                    [
                        { 'coord' => { 'x_offset' => 0, 'y_offset' => 0, 'z_offset' => 0 }, 'u_height' => 6, 'depth' => 19, 'name' => 'ceph01.mail.example.com' },
                        { 'coord' => { 'x_offset' => 0, 'y_offset' => 0, 'z_offset' => (6 * 1.75) }, 'u_height' => 2, 'depth' => 15, 'name' => 'foo1.example.com' },
                        { 'coord' => { 'x_offset' => 0, 'y_offset' => 0, 'z_offset' => (6 + 2) * 1.75  }, 'u_height' => 1, 'depth' => 19, 'name' => 'bar1.example.com' },
                        { 'coord' => { 'x_offset' => 0, 'y_offset' => 0, 'z_offset' => (6 + 2 + 1) * 1.75 }, 'u_height' => 2, 'depth' => 15, 'name' => 'baz1.example.com' },
                        { 'coord' => { 'x_offset' => 0, 'y_offset' => 0, 'z_offset' => (6 + 2 + 1 + 2) * 1.75 }, 'u_height' => 22, 'depth' => 0, 'name' => 'blank' },
                    ],
            }, 
            {
                'coord' => { 'x_offset' => 44, 'y_offset' => 20, 'z_offset' => 0, 'x_rack_offset' => 2.25, 'y_rack_offset'  => 0, 'z_rack_offset' => 2,  'orient' => 1 },
                'dim' => { 'width_thickness' => 0.625, 'height_thickness' => 0.625, 'width' => 24, 'depth' => 36, 'height' => 63 },
                'nodes' =>
                    [
                        { 'coord' => { 'x_offset' => 0, 'y_offset' => 0, 'z_offset' => 0 }, 'u_height' => 6, 'depth' => 19, 'name' => 'ceph02.mail.example.com' },
                        { 'coord' => { 'x_offset' => 0, 'y_offset' => 0, 'z_offset' => (6 * 1.75) }, 'u_height' => 2, 'depth' => 15, 'name' => 'foo2.example.com' },
                        { 'coord' => { 'x_offset' => 0, 'y_offset' => 0, 'z_offset' => (6 + 2) * 1.75  }, 'u_height' => 1, 'depth' => 19, 'name' => 'bar2.example.com' },
                        { 'coord' => { 'x_offset' => 0, 'y_offset' => 0, 'z_offset' => (6 + 2 + 1) * 1.75 }, 'u_height' => 2, 'depth' => 15, 'name' => 'baz2.example.com' },
                        { 'coord' => { 'x_offset' => 0, 'y_offset' => 0, 'z_offset' => (6 + 2 + 1 + 2) * 1.75 }, 'u_height' => 22, 'depth' => 0, 'name' => 'blank' },
                    ],
            },
            {
                'coord' => { 'x_offset' => 66, 'y_offset' => 20, 'z_offset' => 0, 'x_rack_offset' => 2.25, 'y_rack_offset'  => 0, 'z_rack_offset' => 2, 'orient' => 1 },
                'dim' => { 'width_thickness' => 0.625, 'height_thickness' => 0.625, 'width' => 24, 'depth' => 36, 'height' => 63 },
                'nodes' =>
                    [
                        { 'coord' => { 'x_offset' => 0, 'y_offset' => 0, 'z_offset' => 0 }, 'u_height' => 6, 'depth' => 19, 'name' => 'ceph02.mail.example.com' },
                        { 'coord' => { 'x_offset' => 0, 'y_offset' => 0, 'z_offset' => (6 * 1.75) }, 'u_height' => 2, 'depth' => 15, 'name' => 'foo2.example.com' },
                        { 'coord' => { 'x_offset' => 0, 'y_offset' => 0, 'z_offset' => (6 + 2) * 1.75  }, 'u_height' => 1, 'depth' => 19, 'name' => 'bar2.example.com' },
                        { 'coord' => { 'x_offset' => 0, 'y_offset' => 0, 'z_offset' => (6 + 2 + 1) * 1.75 }, 'u_height' => 2, 'depth' => 15, 'name' => 'baz2.example.com' },
                        { 'coord' => { 'x_offset' => 0, 'y_offset' => 0, 'z_offset' => (6 + 2 + 1 + 2) * 1.75 }, 'u_height' => 22, 'depth' => 0, 'name' => 'blank' },
                    ],
            },
            {
                'coord' => { 'x_offset' => 88, 'y_offset' => 20, 'z_offset' => 0, 'x_rack_offset' => 2.25, 'y_rack_offset'  => 0, 'z_rack_offset' => 2, 'orient' => 1 },
                'dim' => { 'width_thickness' => 0.625, 'height_thickness' => 0.625, 'width' => 24, 'depth' => 36, 'height' => 63 },
                'nodes' =>
                    [
                        { 'coord' => { 'x_offset' => 0, 'y_offset' => 0, 'z_offset' => 0 }, 'u_height' => 6, 'depth' => 19, 'name' => 'ceph02.mail.example.com' },
                        { 'coord' => { 'x_offset' => 0, 'y_offset' => 0, 'z_offset' => (6 * 1.75) }, 'u_height' => 2, 'depth' => 15, 'name' => 'foo2.example.com' },
                        { 'coord' => { 'x_offset' => 0, 'y_offset' => 0, 'z_offset' => (6 + 2) * 1.75  }, 'u_height' => 1, 'depth' => 19, 'name' => 'bar2.example.com' },
                        { 'coord' => { 'x_offset' => 0, 'y_offset' => 0, 'z_offset' => (6 + 2 + 1) * 1.75 }, 'u_height' => 2, 'depth' => 15, 'name' => 'baz2.example.com' },
                        { 'coord' => { 'x_offset' => 0, 'y_offset' => 0, 'z_offset' => (6 + 2 + 1 + 2) * 1.75 }, 'u_height' => 22, 'depth' => 0, 'name' => 'blank' },
                    ],
            },
            {
                'coord' => { 'x_offset' => 20, 'y_offset' => 20 + 2*36 + 30, 'z_offset' => 0, 'x_rack_offset' => 2.25, 'y_rack_offset' => 0, 'z_rack_offset' => 2, 'orient' => -1 },
                'dim' => { 'width_thickness' => 0.625, 'height_thickness' => 0.625, 'width' => 24, 'depth' => 36, 'height' => 63 },
                'nodes' =>
                    [
                        { 'coord' => { 'x_offset' => 0, 'y_offset' => 0, 'z_offset' => 0 }, 'u_height' => 6, 'depth' => 19, 'name' => 'ceph01.mail.example.com' },
                        { 'coord' => { 'x_offset' => 0, 'y_offset' => 0, 'z_offset' => (6 * 1.75) }, 'u_height' => 2, 'depth' => 15, 'name' => 'foo1.example.com' },
                        { 'coord' => { 'x_offset' => 0, 'y_offset' => 0, 'z_offset' => (6 + 2) * 1.75  }, 'u_height' => 1, 'depth' => 19, 'name' => 'bar1.example.com' },
                        { 'coord' => { 'x_offset' => 0, 'y_offset' => 0, 'z_offset' => (6 + 2 + 1) * 1.75 }, 'u_height' => 2, 'depth' => 15, 'name' => 'baz1.example.com' },
                        { 'coord' => { 'x_offset' => 0, 'y_offset' => 0, 'z_offset' => (6 + 2 + 1 + 2) * 1.75 }, 'u_height' => 22, 'depth' => 0, 'name' => 'blank' },
                    ],
            }, 
            {
                'coord' => { 'x_offset' => 44, 'y_offset' => 20 + 2*36 + 30, 'z_offset' => 0, 'x_rack_offset' => 2.25, 'y_rack_offset' => 0, 'z_rack_offset' => 2, 'orient' => -1 },
                'dim' => { 'width_thickness' => 0.625, 'height_thickness' => 0.625, 'width' => 24, 'depth' => 36, 'height' => 63 },
                'nodes' =>
                    [
                        { 'coord' => { 'x_offset' => 0, 'y_offset' => 0, 'z_offset' => 0 }, 'u_height' => 6, 'depth' => 19, 'name' => 'ceph01.mail.example.com' },
                        { 'coord' => { 'x_offset' => 0, 'y_offset' => 0, 'z_offset' => (6 * 1.75) }, 'u_height' => 2, 'depth' => 15, 'name' => 'foo1.example.com' },
                        { 'coord' => { 'x_offset' => 0, 'y_offset' => 0, 'z_offset' => (6 + 2) * 1.75  }, 'u_height' => 1, 'depth' => 19, 'name' => 'bar1.example.com' },
                        { 'coord' => { 'x_offset' => 0, 'y_offset' => 0, 'z_offset' => (6 + 2 + 1) * 1.75 }, 'u_height' => 2, 'depth' => 15, 'name' => 'baz1.example.com' },
                        { 'coord' => { 'x_offset' => 0, 'y_offset' => 0, 'z_offset' => (6 + 2 + 1 + 2) * 1.75 }, 'u_height' => 22, 'depth' => 0, 'name' => 'blank' },
                    ],
            }, 
            {
                'coord' => { 'x_offset' => 66, 'y_offset' => 20 + 2*36 + 30, 'z_offset' => 0, 'x_rack_offset' => 2.25, 'y_rack_offset' => 0, 'z_rack_offset' => 2, 'orient' => -1 },
                'dim' => { 'width_thickness' => 0.625, 'height_thickness' => 0.625, 'width' => 24, 'depth' => 36, 'height' => 63 },
                'nodes' =>
                    [
                        { 'coord' => { 'x_offset' => 0, 'y_offset' => 0, 'z_offset' => 0 }, 'u_height' => 6, 'depth' => 19, 'name' => 'ceph01.mail.example.com' },
                        { 'coord' => { 'x_offset' => 0, 'y_offset' => 0, 'z_offset' => (6 * 1.75) }, 'u_height' => 2, 'depth' => 15, 'name' => 'foo1.example.com' },
                        { 'coord' => { 'x_offset' => 0, 'y_offset' => 0, 'z_offset' => (6 + 2) * 1.75  }, 'u_height' => 1, 'depth' => 19, 'name' => 'bar1.example.com' },
                        { 'coord' => { 'x_offset' => 0, 'y_offset' => 0, 'z_offset' => (6 + 2 + 1) * 1.75 }, 'u_height' => 2, 'depth' => 15, 'name' => 'baz1.example.com' },
                        { 'coord' => { 'x_offset' => 0, 'y_offset' => 0, 'z_offset' => (6 + 2 + 1 + 2) * 1.75 }, 'u_height' => 22, 'depth' => 0, 'name' => 'blank' },
                    ],
            }, 
            {
                'coord' => { 'x_offset' => 88, 'y_offset' => 20 + 2*36 + 30, 'z_offset' => 0, 'x_rack_offset' => 2.25, 'y_rack_offset' => 0, 'z_rack_offset' => 2, 'orient' => -1 },
                'dim' => { 'width_thickness' => 0.625, 'height_thickness' => 0.625, 'width' => 24, 'depth' => 36, 'height' => 63 },
                'nodes' =>
                    [
                        { 'coord' => { 'x_offset' => 0, 'y_offset' => 0, 'z_offset' => 0 }, 'u_height' => 6, 'depth' => 19, 'name' => 'ceph01.mail.example.com' },
                        { 'coord' => { 'x_offset' => 0, 'y_offset' => 0, 'z_offset' => (6 * 1.75) }, 'u_height' => 2, 'depth' => 15, 'name' => 'foo1.example.com' },
                        { 'coord' => { 'x_offset' => 0, 'y_offset' => 0, 'z_offset' => (6 + 2) * 1.75  }, 'u_height' => 1, 'depth' => 19, 'name' => 'bar1.example.com' },
                        { 'coord' => { 'x_offset' => 0, 'y_offset' => 0, 'z_offset' => (6 + 2 + 1) * 1.75 }, 'u_height' => 2, 'depth' => 15, 'name' => 'baz1.example.com' },
                        { 'coord' => { 'x_offset' => 0, 'y_offset' => 0, 'z_offset' => (6 + 2 + 1 + 2) * 1.75 }, 'u_height' => 22, 'depth' => 0, 'name' => 'blank' },
                    ],
            }, 
        ]
    }
    return room
end

def get_nodes()
    result = {
        'room' =>
            [
                { 'loc_room' => 1, 'depth' => 300, 'width' => 500 },
                { 'loc_room' => 2, 'depth' => 300, 'width' => 500 },
                { 'loc_room' => 3, 'depth' => 300, 'width' => 500 },
            ],
        'cabinet' =>
            [
                { 'loc_room' => 1, 'loc_shelf' => 1, 'u_height' => 2, 'depth' => 15, 'name' => 'cab-1' },
                { 'loc_room' => 1, 'loc_shelf' => 1, 'u_height' => 1, 'depth' => 19, 'name' => 'cab-2' },
                { 'loc_room' => 1, 'loc_shelf' => 1, 'u_height' => 2, 'depth' => 15, 'name' => 'cab-3' },
            ],
        'host' =>
            [
                { 'loc_room' => 1, 'loc_shelf' => 1, 'loc_rack' => 1, 'u_height' => 2, 'depth' => 15, 'name' => 'foo.example.com' },
                { 'loc_room' => 1, 'loc_shelf' => 1, 'loc_rack' => 3, 'u_height' => 1, 'depth' => 19, 'name' => 'bar.example.com' },
                { 'loc_room' => 1, 'loc_shelf' => 1, 'loc_rack' => 4, 'u_height' => 2, 'depth' => 15, 'name' => 'baz.example.com' },
            ],
    }

    return result
end


