-- A simple scene with some miscellaneous geometry.

mat1 = gr.material({0.7, 1.0, 0.7}, {0.5, 0.7, 0.5}, 25)
mat2 = gr.material({0.5, 0.5, 0.5}, {0.5, 0.7, 0.5}, 25)
mat3 = gr.material({1.0, 0.6, 0.1}, {0.5, 0.7, 0.5}, 25)
mat4 = gr.material({1.0, 1.0, 0.1}, {0.5, 0.4, 0.8}, 25)
mat5 = gr.material({0.7, 1.0, 0.7}, {0.5, 0.7, 0.5}, 2500)

mat5:set_refraction(0.8, 1.5)

scene_root = gr.node('root')

s1 = gr.nh_sphere('s1', {0, -50, -400}, 150)
scene_root:add_child(s1)
s1:set_material(mat1)

s2 = gr.nh_sphere('s2', {0, 50, 0}, 150)
scene_root:add_child(s2)
s2:set_material(mat5)

s5 = gr.nh_sphere('s5', {0, 150, -250}, 25)
scene_root:add_child(s5)
s5:set_material(mat4)

-- A small stellated dodecahedron.

white_light = gr.light({-100.0, 150.0, 400.0}, {0.9, 0.9, 0.9}, {1, 0, 0})
magenta_light = gr.light({200.0, 200.0, 0.0}, {0.7, 0.7, 0.7}, {1, 0, 0})

gr.render(scene_root, 'refraction.png', 1024, 1024,
	  {0, 0, 800}, {0, 0, -1}, {0, 1, 0}, 50,
	  {0.3, 0.3, 0.3}, {white_light, magenta_light})
