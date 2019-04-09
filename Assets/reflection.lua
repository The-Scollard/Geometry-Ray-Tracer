-- A simple scene with some miscellaneous geometry.

grey = gr.material({0.5, 0.5, 0.5}, {0.5, 0.5, 0.5}, 25)
letter = gr.material({1.0, 0.7, 0.1}, {0.5, 0.7, 0.5}, 10)
red = gr.material({1.0, 0.2, 0.2}, {0.2, 0.2, 0.2}, 10)
white = gr.material({0.7, 0.7, 0.7}, {0.7, 0.7, 0.7}, 10)
mirror = gr.material({0.5, 0.5, 0.5}, {0.5, 0.5, 0.5}, 25)

red:set_reflection(0.2)
mirror:set_reflection(0.5)

scene = gr.node('root')
scene:translate(0.0, -10, -35)
scene:rotate('X', 12)
scene:rotate('Y', -30)
scene:translate(-10, 0, 0)

room = gr.node('room')
scene:add_child(room)

-- the floor
plane = gr.mesh( 'plane', 'plane.obj' )
room:add_child(plane)
plane:set_material(grey)
plane:scale(10, 10, 50)

l_wall = gr.mesh( 'l_wall', 'plane.obj' )
room:add_child(l_wall)
l_wall:set_material(red)
l_wall:scale(15, 10, 50)
l_wall:rotate('Z', -90)
l_wall:translate(-10, 15, 0)

r_wall = gr.mesh( 'r_wall', 'plane.obj' )
r_wall:set_material(grey)
r_wall:scale(10, 10, 20)
r_wall:rotate('Z', -90)
r_wall:translate(10, 10, 0)

b_wall = gr.mesh( 'b_wall', 'plane.obj' )
room:add_child(b_wall)
b_wall:set_material(grey)
b_wall:scale(10, 10, 15)
b_wall:rotate('X', 90)
b_wall:translate(0, 15, -30)

f_wall = gr.mesh( 'f_wall', 'plane.obj' )
room:add_child(f_wall)
f_wall:set_material(white)
f_wall:scale(10, 10, 15)
f_wall:rotate('X', -90)
f_wall:translate(0, 15, 35)

s = gr.sphere('s')
scene:add_child(s)
s:set_material(mirror)
s:scale(5, 5, 5)
s:translate(2.5, 5, 8)

white_light = gr.light({10.0, 10.0, 10.0}, {0.9, 0.9, 0.9}, {1, 0, 0})

gr.render(scene, 'reflection.png', 1024, 1024,
	  {0, 0, 0}, {0, 0, -1}, {0, 1, 0}, 50,
	  {0.3, 0.3, 0.3}, {white_light})
