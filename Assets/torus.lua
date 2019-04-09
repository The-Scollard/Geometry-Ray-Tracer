-- test for hierarchical ray-tracers.
-- Thomas Pflaum 1996

gold = gr.material({0.9, 0.8, 0.4}, {0.8, 0.8, 0.4}, 25)
grass = gr.material({0.1, 0.7, 0.1}, {0.0, 0.0, 0.0}, 0)
blue = gr.material({0.7, 0.6, 1}, {0.5, 0.4, 0.8}, 25)
brown = gr.material({0.823, 0.705, 0.459}, {0.8, 0.7, 0.4}, 25)
light_red = gr.material({0.941, 0.502, 0.502}, {0.9, 0.4, 0.4}, 25)

scene = gr.node('scene')
scene:rotate('X', 0)
scene:translate(0, 0, -10)

-- torus
torus = gr.torus('cone')
scene:add_child(torus)
torus:translate(0, 0, 0)
torus:rotate('Y', 0)
torus:set_material(brown)

-- The lights
l1 = gr.light({200,200,400}, {0.8, 0.8, 0.8}, {1, 0, 0})
l2 = gr.light({0, 5, -20}, {0.4, 0.4, 0.8}, {1, 0, 0})

gr.render(scene, 'torus.png', 1024, 1024, 
	  {0, 0, 0,}, {0, 0, -1}, {0, 1, 0}, 50,
	  {0.4, 0.4, 0.4}, {l1, l2})
