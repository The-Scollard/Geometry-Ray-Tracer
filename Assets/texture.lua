gold = gr.material({0.9, 0.8, 0.4}, {0.8, 0.8, 0.4}, 25)
grass = gr.material({0.1, 0.7, 0.1}, {0.0, 0.0, 0.0}, 0)
blue = gr.material({0.7, 0.6, 1}, {0.098, 0.098, 0.439}, 0)
grey = gr.material({0.5, 0.5, 0.5}, {0.0, 0.0, 0.0}, 0)

scene = gr.node('scene')
scene:rotate('X', 5)
scene:translate(0, 0, 0)

-- cylinder
tex_cube = gr.cube('tex_cube')
scene:add_child(tex_cube)
tex_cube:scale(10, 1, 10)
tex_cube:translate(-5, -2, -10)
tex_cube:set_texture("grass1.png")
tex_cube:set_material(grey)

tex_sphere = gr.sphere('tex_sphere')
scene:add_child(tex_sphere)
tex_sphere:set_texture("moon.png")
tex_sphere:rotate('Y', 45)
tex_sphere:translate(5, 5, -20)
tex_sphere:set_material(blue)

tex_cyl = gr.cylinder('tex_cyl')
scene:add_child(tex_cyl)
tex_cyl:set_texture("cokecan.png")
tex_cyl:scale(0.75, 1, 1)
tex_cyl:rotate('X', 90)
tex_cyl:translate(0, 0, -5)
tex_cyl:set_material(grey)

-- The lights
l1 = gr.light({5,10,10}, {0.8, 0.8, 0.8}, {1, 0, 0})
l2 = gr.light({0, 5, -20}, {0.4, 0.4, 0.8}, {1, 0, 0})

gr.render(scene, 'texture.png', 1024, 1024, 
	  {0, 0, 0,}, {0, 0, -1}, {0, 1, 0}, 50,
	  {0.2, 0.2, 0.2}, {l1})
