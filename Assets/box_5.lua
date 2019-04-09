gold = gr.material({0.9, 0.8, 0.4}, {0.8, 0.8, 0.4}, 25)
grass = gr.material({0.1, 0.7, 0.1}, {0.0, 0.0, 0.0}, 25)
shiny = gr.material({0.1, 0.7, 0.1}, {0.4, 0.4, 0.4}, 25)
shiny_m = gr.material({0.1, 0.7, 0.1}, {0.4, 0.4, 0.4}, 256)
blue = gr.material({0.7, 0.6, 1}, {0.5, 0.4, 0.8}, 25)
brown = gr.material({0.823, 0.705, 0.459}, {0.0, 0.0, 0.0}, 25)
black = gr.material({0.2, 0.2, 0.2}, {0.7, 0.7, 0.7}, 25)
light_red = gr.material({0.941, 0.502, 0.502}, {0.9, 0.4, 0.4}, 25)
red = gr.material({1.0, 0.1, 0.1}, {0.5, 0.7, 0.5}, 25)
rich_blue = gr.material({0.1, 0.1, 1.0}, {0.5, 0.7, 0.5}, 25)
yellow = gr.material({1.0, 1.0, 0.1}, {0.5, 0.7, 0.5}, 25)
green = gr.material({0.1, 1.0, 0.1}, {0.5, 0.7, 0.5}, 25)
clear = gr.material({0.3, 0.3, 0.3}, {0.3, 0.3, 0.3}, 1250)

scene = gr.node('scene')
scene:translate(0, 0, -10)

candy = gr.node('candy')
candy:translate(0, 0, 0)

can1 = gr.sphere('can1')
candy:add_child(can1)
can1:set_material(red)

can2 = gr.sphere('can2')
candy:add_child(can2)
can2:translate(2, 0, 0)
can2:set_material(rich_blue)

can3 = gr.sphere('can3')
candy:add_child(can3)
can3:translate(0, -2, 0)
can3:set_material(green)

can4 = gr.sphere('can4')
candy:add_child(can4)
can4:translate(2, -2, 0)
can4:set_material(gold)

can5 = gr.sphere('can5')
candy:add_child(can5)
can5:translate(1, -1, 1)
can5:set_material(blue)

c1 = gr.node('c1')
scene:add_child(c1)
c1:translate(0, 0, 0)
c1:add_child(candy)


-- The lights
l1 = gr.light({200,200,400}, {0.8, 0.8, 0.8}, {1, 0, 0})
l2 = gr.light({0, 5, -20}, {0.4, 0.4, 0.8}, {1, 0, 0})

gr.render(scene, 'box_5.png', 512, 512, 
	  {0, 0, 0,}, {0, 0, -1}, {0, 1, 0}, 50,
	  {0.4, 0.4, 0.4}, {l1, l2})
