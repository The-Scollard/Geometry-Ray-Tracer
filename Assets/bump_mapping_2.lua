-- A simple scene with some miscellaneous geometry.

grey = gr.material({0.5, 0.5, 0.5}, {0.5, 0.5, 0.5}, 25)
letter = gr.material({1.0, 0.7, 0.1}, {0.5, 0.7, 0.5}, 10)
red = gr.material({1.0, 0.2, 0.2}, {0.2, 0.2, 0.2}, 25)
green = gr.material({0.2, 1.0, 0.2}, {0.1, 0.9, 0.1}, 25)
white = gr.material({0.2, 0.2, 1.0}, {0.7, 0.7, 0.7}, 10)
orange = gr.material({1.0, 0.6, 0.1}, {0.5, 0.7, 0.5}, 25)
yellow = gr.material({1.0, 1.0, 0.2}, {0.9, 0.9, 0.1}, 25)
light_blue = gr.material({0.4, 0.7, 1.0}, {0.3, 0.6, 0.9}, 25)

scene = gr.node('root')
scene:translate(0.0, -10, -40)
scene:rotate('X', 10)

-- the floor
plane = gr.mesh( 'plane', 'plane.obj' )
scene:add_child(plane)
plane:set_material(yellow)
plane:scale(10, 10, 30)

l_wall = gr.mesh( 'l_wall', 'plane.obj' )
scene:add_child(l_wall)
l_wall:set_material(red)
l_wall:scale(10, 10, 30)
l_wall:rotate('Z', -90)
l_wall:translate(-10, 10, 0)

r_wall = gr.mesh( 'r_wall', 'plane.obj' )
scene:add_child(r_wall)
r_wall:set_material(green)
r_wall:scale(10, 10, 30)
r_wall:rotate('Z', 90)
r_wall:translate(10, 10, 0)

b_wall = gr.mesh( 'b_wall', 'plane.obj' )
scene:add_child(b_wall)
b_wall:set_material(white)
b_wall:scale(10, 10, 10)
b_wall:rotate('X', 90)
b_wall:translate(0, 10, 0)

s = gr.sphere('s')
scene:add_child(s)
s:set_normal("concrete_Normal.png")
s:scale(5, 5, 5)
s:translate(-3, 5, 10)
s:set_material(grey)


white_light = gr.light({0.0, 100.0, 40.0}, {0.4, 0.4, 0.4}, {1, 0, 0})
l2 = gr.light({-10.0, 20.0, -5.0}, {0.6, 0.6, 0.6}, {1, 0, 0})

gr.render(scene, 'bump_mapping_l.png', 1024, 1024,
	  {0, 0, 0}, {0, 0, -1}, {0, 1, 0}, 50,
	  {0.3, 0.3, 0.3}, {l2})
