-- test for hierarchical ray-tracers.
-- Thomas Pflaum 1996

gold = gr.material({0.9, 0.8, 0.4}, {0.8, 0.8, 0.4}, 25)
grass = gr.material({0.1, 0.7, 0.1}, {0.0, 0.0, 0.0}, 0)
blue = gr.material({0.7, 0.6, 1}, {0.5, 0.4, 0.8}, 25)
brown = gr.material({0.823, 0.705, 0.459}, {0.8, 0.7, 0.4}, 25)
light_red = gr.material({0.941, 0.502, 0.502}, {0.9, 0.4, 0.4}, 25)

brown:set_refraction(0.5, 1.5)
brown:make_translucent()

scene = gr.node('scene')
scene:rotate('Y', 1)
scene:translate(0, 0, -3)

-- cone
lens = gr.cube('lens')
scene:add_child(lens)
lens:translate(-0.5, -0.5, 0)
lens:scale(2, 2, 0.05)
lens:set_material(brown)

sphere = gr.cube('sphere')
scene:add_child(sphere)
sphere:set_material(blue)
sphere:translate(-0.5, -0.5, -1.05)

-- The lights
l1 = gr.light({200,200,400}, {0.8, 0.8, 0.8}, {1, 0, 0})
l2 = gr.light({0, 5, -20}, {0.4, 0.4, 0.8}, {1, 0, 0})

gr.render(scene, 'translucent.png', 512, 512, 
	  {0, 0, 0,}, {0, 0, -1}, {0, 1, 0}, 50,
	  {0.4, 0.4, 0.4}, {l1, l2})
