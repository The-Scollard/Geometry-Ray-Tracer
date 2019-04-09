moon = gr.material({0.76, 0.77, 0.8}, {0.1, 0.1, 0.1}, 25)
ground = gr.material({0.0, 0.47, 0.76}, {0.0, 0.0, 0.0}, 4)
orange = gr.material({1.0, 0.6, 0.1}, {0.5, 0.7, 0.5}, 25)
blue = gr.material({0.7, 0.6, 1}, {0.5, 0.4, 0.8}, 25)
red = gr. material({0.9, 0.0, 0.1}, {0.9, 0.9, 0.9}, 25)

scene = gr.node('scene')
scene:rotate('X', 45)
scene:translate(0, -300, 0)

-- the ocean
plane = gr.mesh( 'plane', 'plane.obj' )
scene:add_child(plane)
plane:set_material(ground)
plane:scale(600, 300, 300)
plane:translate(0, -30, -100)

-- dodecahedron
star_poly_1 = gr.mesh( 'poly', 'smstdodeca.obj' )
scene:add_child(star_poly_1)
star_poly_1:set_material(orange)
star_poly_1:translate(0, -120, 0)

-- scaled_dodecahedron
s_d = gr.node('s_d')
scene:add_child(s_d)
s_d:translate(450, -390, 0)

star_poly_2 = gr.mesh( 'poly', 'smstdodeca.obj' )
s_d:add_child(star_poly_2)
star_poly_2:set_material(blue)
star_poly_2:scale(2, 2, 2)

-- the sphere
sphere = gr.nh_sphere('sphere', {-500, 100, -1100}, 100)
scene:add_child(sphere)
sphere:set_material(moon)

-- the cube 
cube = gr.nh_box('c1', {0, -30, -50}, 80)
scene:add_child(cube)
cube:set_material(red)


-- The light
l1 = gr.light({-100.0, 150.0, 400.0}, {0.9, 0.9, 0.9}, {1, 0, 0})
l2 = gr.light({200.0, 350.0, 150.0}, {0.76, 0.77, 0.8}, {1, 0, 0})

gr.render(scene, 'sample.png', 512, 512, 
	  {0, 0, 900}, {0, 0, -1}, {0, 1, 0}, 50,
	  {0.2, 0.2, 0.2}, {l1, l2})
