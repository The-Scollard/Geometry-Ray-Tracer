-- A scene to demonstrate Depth of Field.

red = gr.material({1.0, 0.1, 0.1}, {0.5, 0.7, 0.5}, 25)
blue = gr.material({0.1, 0.1, 1.0}, {0.5, 0.7, 0.5}, 25)
yellow = gr.material({1.0, 1.0, 0.1}, {0.5, 0.7, 0.5}, 25)

scene_root = gr.node('root')

s1 = gr.nh_sphere('s1', {0, 0, -10}, 2)
scene_root:add_child(s1)
s1:set_material(yellow)

s4 = gr.nh_sphere('s4', {-200, 50, -600}, 100)
scene_root:add_child(s4)
s4:set_material(red)

s5 = gr.nh_sphere('s5', {200, 50, -600}, 100)
scene_root:add_child(s5)
s5:set_material(blue)

white_light = gr.light({100.0, 150.0, 400.0}, {0.9, 0.9, 0.9}, {1.001, 0, 0})
magenta_light = gr.light({400.0, 100.0, 150.0}, {0.7, 0.0, 0.7}, {1, 0, 0})

gr.render(scene_root, 'dof.png', 512, 512,
	  {0, 0, 0}, {0, 0, -1}, {0, 1, 0}, 50,
	  {0.3, 0.3, 0.3}, {white_light})
