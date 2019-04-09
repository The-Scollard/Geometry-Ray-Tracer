-- A simple scene with some miscellaneous geometry.

grey = gr.material({0.5, 0.5, 0.5}, {0.5, 0.5, 0.5}, 25)
letter = gr.material({1.0, 0.7, 0.1}, {0.5, 0.7, 0.5}, 10)

scene = gr.node('root')
scene:translate(0.0, -19, -35)
scene:rotate('X', 25)

-- the floor
plane = gr.mesh( 'plane', 'plane.obj' )
scene:add_child(plane)
plane:set_material(grey)
plane:scale(10, 10, 20)

l_wall = gr.mesh( 'l_wall', 'plane.obj' )
scene:add_child(l_wall)
l_wall:set_material(grey)
l_wall:scale(10, 10, 20)
l_wall:rotate('Z', -90)
l_wall:translate(-10, 10, 0)

r_wall = gr.mesh( 'r_wall', 'plane.obj' )
scene:add_child(r_wall)
r_wall:set_material(grey)
r_wall:scale(10, 10, 20)
r_wall:rotate('Z', 90)
r_wall:translate(10, 10, 0)

b_wall = gr.mesh( 'b_wall', 'plane.obj' )
scene:add_child(b_wall)
b_wall:set_material(grey)
b_wall:scale(10, 10, 10)
b_wall:rotate('X', 90)
b_wall:translate(0, 10, 0)

f = gr.node('f')
scene:add_child(f)
f:translate(-4, 5.0, 5)

f_vert = gr.cube('f_vert')
f:add_child(f_vert)
f_vert:set_material(letter)
f_vert:scale(2.5, 1, 10)

f_s1 = gr.cube('f_s1')
f:add_child(f_s1)
f_s1:set_material(letter)
f_s1:scale(10, 1, 2)

f_s2 = gr.cube('f_s2')
f:add_child(f_s2)
f_s2:set_material(letter)
f_s2:scale(7.5, 1, 2)
f_s2:translate(0, 0, 5)

white_light = gr.light({0.0, 100.0, 40.0}, {0.9, 0.9, 0.9}, {1, 0, 0})
white_light:set_size({25.0, 0.0, 25.0})

gr.render(scene, 'soft_shadows.png', 1024, 1024,
	  {0, 0, 0}, {0, 0, -1}, {0, 1, 0}, 50,
	  {0.3, 0.3, 0.3}, {white_light})
