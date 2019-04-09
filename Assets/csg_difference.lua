-- test for hierarchical ray-tracers.
-- Thomas Pflaum 1996

gold = gr.material({0.9, 0.8, 0.4}, {0.8, 0.8, 0.4}, 25)
grass = gr.material({0.1, 0.7, 0.1}, {0.0, 0.0, 0.0}, 0)
blue = gr.material({0.7, 0.6, 1}, {0.5, 0.4, 0.8}, 25)

scene = gr.node('scene')
scene:rotate('X', 23)
scene:translate(0, 0, -5)

s1 = gr.sphere('s1')
s1:translate(-0.25, 0, 0)
s1:set_material(blue)

s2 = gr.sphere('s2')
s2:translate(0.25, 0, 0)
s2:set_material(gold)

b1 = gr.cube('b1')
b1:scale(2.0, 2.0, 2.0)
b1:translate(0.0, -1.0, -1.0)
b1:set_material(gold)

d1 = gr.difference('d1')
d1:add_children(s1, b1)

s3 = gr.sphere('s3')
s3:scale(0.5, 0.5, 0.5)
s3:translate(0.0, 0.0, 0.0)
s3:set_material(grass)

-- difference
difference = gr.difference('difference')
scene:add_child(difference)
difference:rotate('Y', 0)
difference:add_children(s1, s2)

-- The lights
l1 = gr.light({200,200,400}, {0.8, 0.8, 0.8}, {1, 0, 0})
l2 = gr.light({0, 5, -20}, {0.4, 0.4, 0.8}, {1, 0, 0})

for i = 0, 24, 1 do
	gr.render(scene, 'csg_difference_' .. i .. '.png', 512, 512, 
	  {0, 0, 0,}, {0, 0, -1}, {0, 1, 0}, 50,
	  {0.4, 0.4, 0.4}, {l1, l2})
	difference:rotate('Y', -15)
end
