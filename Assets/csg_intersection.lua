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
b1:translate(0.0, -0.5, -0.5)
b1:set_material(gold)

b2 = gr.cube('b2')
b2:translate(-0.5, -0.5, -0.5)
b2:scale(1.25, 1.25, 1.25)
b2:set_material(grass)

i1 = gr.intersection('i1')
i1:add_children(s1, s2)

-- intersection
intersection = gr.intersection('intersection')
scene:add_child(intersection)
intersection:rotate('Y', 0)
intersection:add_children(i1, b2)

-- The lights
l1 = gr.light({200,200,400}, {0.8, 0.8, 0.8}, {1, 0, 0})
l2 = gr.light({0, 5, -20}, {0.4, 0.4, 0.8}, {1, 0, 0})

for i = 0, 24, 1 do
	gr.render(scene, 'csg_intersection_' .. i .. '.png', 512, 512, 
	  {0, 0, 0,}, {0, 0, -1}, {0, 1, 0}, 50,
	  {0.4, 0.4, 0.4}, {l1, l2})
	intersection:rotate('Y', -15)
end
