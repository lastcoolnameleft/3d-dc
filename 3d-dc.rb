require 'sketchup.rb'
load 'site_def.rb'

SKETCHUP_CONSOLE.show
#X_ORIENT = 1
#X_ORIENT_NEG = -1
#Y_ORIENT = 2
#Y_ORIENT_NEG = -2
#Z_ORIENT = 3
#Z_ORIENT_NEG = -3

def clear_all()
    entities = Sketchup.active_model.entities
    entities.clear!
    end

def log(value)
  SKETCHUP_CONSOLE.write("#{value}\n")
  nil
end

def build_room(room, x_start, y_start, z_start)
    x_start += room['coord']['x_offset']
    y_start += room['coord']['y_offset']
    z_start += room['coord']['z_offset']
    entities = Sketchup.active_model.entities
    
    #  Floor
    pt1 = [x_start, y_start, z_start]
    pt2 = [x_start + room['coord']['width'], y_start, z_start]
    pt3 = [x_start + room['coord']['width'], y_start + room['coord']['depth'], z_start]
    pt4 = [x_start, y_start + room['coord']['depth'], z_start]
    new_face = entities.add_face pt1, pt2, pt3, pt4
    
    room['cabinet'].each do | cabinet | 
        build_cab(cabinet, x_start, y_start, z_start)
    end
end


def build_cab(cabinet, x_start, y_start, z_start)
    orient = cabinet['coord']['orient']
    x_start += cabinet['coord']['x_offset']
    y_start += cabinet['coord']['y_offset']
    z_start += cabinet['coord']['z_offset']
    entities = Sketchup.active_model.entities

    #  Draw the frame
    u_width = cabinet['dim']['u_width']
    u_height = cabinet['dim']['u_height']
    frame_h = cabinet['dim']['height']
    frame_w = cabinet['dim']['width']
    frame_d = cabinet['dim']['depth']
    frame_wt = cabinet['dim']['width_thickness']
    frame_ht = cabinet['dim']['height_thickness']

    #  Near wall
    draw_box(x_start, y_start, z_start, frame_h, frame_wt, frame_d, orient)

    #  Far wall
    x_start_far = x_start
    y_start_far = y_start
    if (orient == X_ORIENT || orient == X_ORIENT_NEG)
        x_start_far = x_start + frame_w - frame_wt
    elsif (orient == Y_ORIENT || orient == Y_ORIENT_NEG)
        y_start_far = y_start + frame_w - frame_wt
    end
    draw_box(x_start_far, y_start_far, z_start, frame_h, frame_wt, frame_d, orient)

    #  Bottom
    x_start_bottom = x_start
    y_start_bottom = y_start
    if (orient == X_ORIENT || orient == X_ORIENT_NEG)
        x_start_bottom = x_start + frame_wt
    elsif (orient == Y_ORIENT || orient == Y_ORIENT_NEG)
        y_start_bottom = y_start + frame_wt
    end
    draw_box(x_start_bottom, y_start_bottom, z_start, frame_ht, frame_w - 2 * frame_wt, frame_d, orient)

    #  Top
    x_start_top = x_start
    y_start_top = y_start
    if (orient == X_ORIENT || orient == X_ORIENT_NEG)
        x_start_top = x_start + frame_wt
    elsif (orient == Y_ORIENT || orient == Y_ORIENT_NEG)
        y_start_top = y_start + frame_wt
    end
    draw_box(x_start_top, y_start_top, z_start + frame_h - frame_ht, frame_ht, frame_w - 2 * frame_wt, frame_d, orient)

    #  Draw the nodes
    if (orient == X_ORIENT || orient == X_ORIENT_NEG)
        x_mount_start = x_start + cabinet['coord']['x_rack_offset']
        y_mount_start = y_start + cabinet['coord']['y_rack_offset']
        z_mount_start = z_start + cabinet['coord']['z_rack_offset']
    elsif (orient == Y_ORIENT || orient == Z_ORIENT_NEG)
        x_mount_start = x_start + cabinet['coord']['y_rack_offset']
        y_mount_start = y_start + cabinet['coord']['x_rack_offset']
        z_mount_start = z_start + cabinet['coord']['z_rack_offset']
    end
    cabinet['nodes'].each do | node |
        depth = node['depth']
        draw_rack_host(node, x_mount_start, y_mount_start, z_mount_start, orient)
        #z_start += height
    end
end

def draw_rack_host(host, x_start, y_start, z_start, orient)
    entities = Sketchup.active_model.entities
    u_height = 1.75
    u_width = 19.5
    height = host['u_height'] * u_height
    depth = host['depth']
    x1 = x_start + host['coord']['x_offset']
    x2 = x_start + u_width + host['coord']['x_offset']
    y = y_start + host['coord']['y_offset']
    z1 = z_start + host['coord']['z_offset']

    # Remove some from height because otherwise pushpull doesn't render as expected
    z2 = z_start + height - 0.2 + host['coord']['z_offset']

    draw_box(x_start, y_start, z_start + host['coord']['z_offset'], height, u_width, depth, orient)
    #pt1 = [x1,y,z1]
    #pt2 = [x2,y,z1]
    #pt3 = [x2,y,z2]
    #pt4 = [x1,y,z2]
    #new_face = entities.add_face pt1, pt2, pt3, pt4
    #new_face.pushpull ( -depth )

    # display node name
    coordinates = [x1+1,y-1,z1+1]
    if (orient == X_ORIENT)
        coordinates = [x1 + 1,y-5,z1+1]
    elsif (orient == X_ORIENT_NEG)
        coordinates = [x1 + u_width - 1,y+5,z1+1]
    elsif (orient == Y_ORIENT)
        coordinates = [x1+5,y-1,z1+1]
    elsif (orient == Y_ORIENT_NEG)
        coordinates = [x1-5,y-1,z1+1]
    end
    point = Geom::Point3d.new coordinates
    text = entities.add_text host['name'], point
end

def draw_box(x, y, z, height, width, depth, orient)
    #log ("x=#{x},y=#{y},z=#{z},h=#{height},w=#{width},d=#{depth},o=#{orient}")
    entities = Sketchup.active_model.entities
    pts = [ [x,y,z], [x,y,z], [x,y,z], [x,y,z] ]

    if (orient == X_ORIENT)
        pts[3][0] += width
        pts[2][0] += width
        pts[2][2] += height
        pts[1][2] += height
    elsif (orient == X_ORIENT_NEG)
        pts[1][0] += width
        pts[2][0] += width
        pts[2][2] += height
        pts[3][2] += height
    elsif (orient == Y_ORIENT)
        pts[1][1] += width
        pts[2][1] += width
        pts[2][2] += height
        pts[3][2] += height
    elsif (orient == Y_ORIENT_NEG)
        pts[3][1] += width
        pts[2][1] += width
        pts[2][2] += height
        pts[1][2] += height
    end 
    #log ("pts=#{pts}")
    new_face = entities.add_face pts[0], pts[1], pts[2], pts[3]
    new_face.pushpull depth, true 

end

def write_text()
    clear_all
    entities=Sketchup.active_model.active_entities
    pts = [[10, 10, 10], [20, 10, 10], [20, 10, 20], [10, 10, 20]]
    face = entities.add_face pts[0], pts[1], pts[2], pts[3]
    model=Sketchup.active_model
    definitions=model.definitions
    component=definitions.add("~2DTextTmf[3D]#1")
    definitions.unique_name("~2DTextTmf[3D]#1")
    ents = component.entities
    pt=Geom::Point3d.new(0,0,1.mm)
    t=Geom::Transformation.new(pt)
    g=ents.add_group()
    font = 'Arial'
    height = 5
    text='TMF'
    bold=false
    italic=false
    filled=true
    align=1
    g.entities.add_3d_text(text,align,font,bold,italic,height,1.mm,0,filled,0)
    #g.move!(t); g.explode
    #edges=[];ents.each{|e|edges<<e if e.class==Sketchup::Edge}
    #faces=[];ents.each{|e|faces<<e if e.class==Sketchup::Face}
    component.behavior.always_face_camera=false
    component.behavior.is2d=true
    component.behavior.snapto=0
    #ents.each{|e|e.casts_shadows=false; e.receives_shadows=false}
    tr=Geom::Transformation.new([10, 10, 10])###
    #entities=model.active_entities

    # either
    instance=entities.add_instance(component,tr)
    #instance.glued_to=face
    
    # or
    #model.place_component(component)
    #model.commit_operation
end

def write_text2
    clear_all
    entities=Sketchup.active_model.active_entities
    pts = [[10, 10, 10], [20, 10, 10], [20, 10, 20], [10, 10, 20]]
    new_face = entities.add_face pts[0], pts[1], pts[2], pts[3]
    clface = Sketchup.active_model.active_entities.add_face pts 
    tiny_pts=[] 
    tiny_pts[0]=[0,0,0] 
    tiny_pts[1]=[20,0,0] 
    tiny_pts[2]=[20,0,20] 
    tiny_pts[3]=[0,0,20] 
    tiny_pts[4]=[0,0,0] 
    compdef=Sketchup.active_model.definitions.add "CompName" 
    orig=Geom::Point3d.new [5,4,5] 
    compdef.entities.add_text "FaceName",orig 
    compdef.entities.add_face tiny_pts 
    compdef.behavior.snapto=0 
    compdef.behavior.is2d=true
    #tp = @pts[0]+Geom::Vector3d.linear_combination(0.4,(@pts[1]-@pts[0]),0.1,(@pts[3]-@pts[0])) 
    tp=Geom::Transformation.new pts[1]
    txt=Sketchup.active_model.active_entities.add_instance compdef,Geom::Transformation.new(tp) 
    txt.glued_to=clface 

end

clear_all()
draw_box(10,10,0, 1.75, 19, 50, X_ORIENT)
#draw_rack_host(get_host(), 10, 10, 0, 'y')
#build_cab(get_cab(), 0, 0, 0, Y_ORIENT)
#build_room(get_room(), 0, 0, 0)
# latest face
# Sketchup.active_model.entities[124] 
# bottom blank plate
# Sketchup.active_model.entities[72]
