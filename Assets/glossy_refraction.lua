-- A simple scene with some miscellaneous geometry.

mat1 = gr.material({0.7, 1.0, 0.7}, {0.5, 0.7, 0.5}, 25)
mat2 = gr.material({0.5, 0.5, 0.5}, {0.5, 0.7, 0.5}, 25)
orange = gr.material({1.0, 0.6, 0.1}, {0.5, 0.7, 0.5}, 25)
mat4 = gr.material({1.0, 1.0, 0.1}, {0.5, 0.4, 0.8}, 25)
mat5 = gr.material({0.7, 1.0, 0.7}, {0.5, 0.7, 0.5}, 2500)
red = gr.material({1.0, 0.1, 0.1}, {0.5, 0.7, 0.5}, 25)
blue = gr.material({0.1, 0.1, 1.0}, {0.5, 0.7, 0.5}, 25)
yellow = gr.material({1.0, 1.0, 0.1}, {0.5, 0.7, 0.5}, 25)

mat5:set_refraction(0.8, 1.5)

scene = gr.node('root')
scene:translate(0, -3, -10)
scene:rotate('X', 10)

s = gr.sphere('s')
scene:add_child(s)
s:scale(2, 2, 2)
s:translate(0, 1, 0)
s:set_material(mat5)

s1 = gr.sphere('s1')
scene:add_child(s1)
s1:set_material(orange)
s1:scale(2, 2, 2)
s1:translate(0, 0, -10)

-- the floor
plane = gr.mesh( 'plane', 'plane.obj' )
scene:add_child(plane)
plane:set_material(mat2)
plane:scale(10, 5, 5)
plane:translate(0, -1, 0)

b1 = gr.cube('b1')
scene:add_child(b1)
b1:scale(2, 1, 1)
b1:translate(1, -1, -4)
b1:set_material(blue)

b2 = gr.cube('b1')
scene:add_child(b2)
b2:scale(2, 1, 1)
b2:translate(-3, -1, -4)
b2:set_material(red)

white_light = gr.light({-100.0, 150.0, 400.0}, {0.9, 0.9, 0.9}, {1, 0, 0})
l2 = gr.light({200.0, 200.0, 0.0}, {0.5, 0.5, 0.5}, {1, 0, 0})
magenta_light = gr.light({200.0, 200.0, 0.0}, {0.7, 0.7, 0.7}, {1, 0, 0})

gr.render(scene, 'glossy_refraction.png', 1024, 1024,
	  {0, 0, 0}, {0, 0, -1}, {0, 1, 0}, 50,
	  {0.3, 0.3, 0.3}, {white_light, magenta_light, l2})
