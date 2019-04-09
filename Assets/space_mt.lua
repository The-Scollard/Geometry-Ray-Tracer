-- test for hierarchical ray-tracers.
-- Thomas Pflaum 1996

gold = gr.material({0.5, 0.5, 0.5}, {0.0, 0.0, 0.0}, 0)
grass = gr.material({0.1, 0.7, 0.1}, {0.0, 0.0, 0.0}, 0)
blue = gr.material({0.7, 0.6, 1}, {0.0, 0.0, 0.0}, 0)
brown = gr.material({0.627, 0.322, 0.177}, {0.0, 0.0, 0.0}, 0)

scene = gr.node('scene')
scene:rotate('X', 23)
scene:translate(6, -2, -15)

moon = gr.cylinder('moon')
scene:add_child(moon)
moon:scale(1, 1, 0.05)
moon:rotate('Z', 90)
moon:set_material(gold)
moon:set_texture("moon.png")
moon:translate(-6, 5, -10.4)

-- sphere
poly = gr.cylinder( 'poly' )
scene:add_child(poly)
poly:scale(4, 4, 0.05)
poly:rotate('X', 90)
poly:translate(-6, 1.618034, 0)
poly:set_texture("flat_earth.png")
poly:set_material(brown)

sky = gr.cube('sky')
scene:add_child(sky)
sky:translate(-0.5, -0.5, 0)
sky:scale(60,60, 0.5)
sky:translate(-10, 0, -20)
sky:set_material(blue)
sky:set_texture("space_lf_0.png")

-- The lights
l1 = gr.light({200,200,400}, {0.5, 0.5, 0.5}, {1, 0, 0})
l2 = gr.light({0, 5, -20}, {0.4, 0.4, 0.8}, {1, 0, 0})

gr.render(scene, 'space_mt.png', 1024, 1024, 
	  {0, 0, 0,}, {0, 0, -1}, {0, 1, 0}, 50,
	  {0.1, 0.1, 0.1}, {l1})
