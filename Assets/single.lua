-- test for hierarchical ray-tracers.
-- Thomas Pflaum 1996

gold = gr.material({0.9, 0.8, 0.4}, {0.8, 0.8, 0.4}, 25)
grass = gr.material({0.1, 0.7, 0.1}, {0.0, 0.0, 0.0}, 0)
blue = gr.material({0.7, 0.6, 1}, {0.5, 0.4, 0.8}, 25)

scene = gr.node('scene')
scene:rotate('X', 23)
scene:translate(0, 0, -5)

-- cylinder
cylinder = gr.sphere('cylinder')
scene:add_child(cylinder)
cylinder:translate(0.0, 0.0, 0.0)
cylinder:rotate('Y', -23)
cylinder:scale(1.0, 1.0, 1.0)
cylinder:set_material(blue)

-- The lights
l1 = gr.light({200,200,400}, {0.8, 0.8, 0.8}, {1, 0, 0})
l2 = gr.light({0, 5, -20}, {0.4, 0.4, 0.8}, {1, 0, 0})

gr.render(scene, 'single.png', 512, 512, 
	  {0, 0, 0,}, {0, 0, -1}, {0, 1, 0}, 50,
	  {0.4, 0.4, 0.4}, {l1, l2})
