-- test for hierarchical ray-tracers.
-- Thomas Pflaum 1996

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

shiny_m:set_reflection(0.15)
clear:set_refraction(0.8, 1.5)
clear:set_reflection(0.1)

scene = gr.node('scene')
scene:rotate('Y', 60)
scene:rotate('X', 20)
scene:translate(2, 0, -10)

-- planetarium
planet = gr.node('planet')
scene:add_child(planet)
planet:scale(0.4, 0.4, 0.4)
planet:rotate('Y', 90)
planet:translate(0, 0, -1)

-- base
cone = gr.cone('cone')
planet:add_child(cone)
cone:rotate('X', 90)
cone:translate(0, 1, 0)
cone:set_material(black)

c1 = gr.cylinder('c1')
planet:add_child(c1)
c1:scale(0.05, 0.05, 5)
c1:rotate('X', 90)
c1:translate(0, 5, 0)
c1:set_material(black)

-- moon part
m_line = gr.node('m_line')
planet:add_child(m_line)
m_line:translate(-3, 4, 0)

c2 = gr.cylinder('c2')
m_line:add_child(c2)
c2:scale(0.05, 0.05, 3)
c2:rotate('Y', 90)
c2:set_material(black)

c3 = gr.cylinder('c3')
m_line:add_child(c3)
c3:scale(0.05, 0.05, 3)
c3:rotate('X', 90)
c3:translate(-3, 3, 0)
c3:set_material(black)

-- earth
earth = gr.sphere('earth')
planet:add_child(earth)
earth:scale(2, 2, 2)
earth:translate(0, 8, 0)
earth:set_texture("earth.png")
earth:set_material(grass)

-- moon
moon = gr.sphere('moon')
m_line:add_child(moon)
moon:rotate('Y', 180)
moon:scale(0.5, 0.5, 0.5)
moon:translate(-3, 6, 0)
moon:set_texture("moon.png")
moon:set_material(grass)

-- bowl
bowl = gr.node('bowl')
scene:add_child(bowl)
bowl:rotate('Z', 90)
bowl:translate(-5, 1.5, -1)

s1 = gr.sphere('s1')
s1:translate(-0.25, 0, 0)
s1:set_material(shiny)
s1:set_texture("wood1.png")

b1 = gr.cube('b1')
b1:scale(2.0, 2.0, 2.0)
b1:translate(0.0, -1.0, -1.0)
b1:set_material(shiny)
b1:set_texture("wood1.png")

d1 = gr.difference('d1')
d1:add_children(s1, b1)

s3 = gr.sphere('s3')
s3:scale(0.75, 0.75, 0.75)
s3:translate(0.0, 0.0, 0.0)
s3:set_material(shiny)
s3:set_texture("wood1.png")

-- difference
difference = gr.difference('difference')
bowl:add_child(difference)
difference:add_children(d1, s3)

-- candy
candy = gr.node('candy')
bowl:add_child(candy)
candy:rotate('Y', 90)
candy:translate(-1, 1, 1)
candy:scale(0.25, 0.25, 0.25)

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

floor = gr.node('floor')
scene:add_child(floor)
floor:translate(-3, 0, 0)

ft = gr.node('ft')

wood = gr.cube('wood')
wood:set_material(shiny_m)
wood:set_texture("wood2.png")
wood:translate(-0.5, -0.5, 0)
wood:scale(3.01, 0.5, 3.01)
wood:translate(1.505, 0, 0)

tile1 = gr.node('tile1')
ft:add_child(tile1)
tile1:add_child(wood)

tile2 = gr.node('tile2')
ft:add_child(tile2)
tile2:add_child(wood)
tile2:translate(-3, 0, 0)

tile3 = gr.node('tile2')
ft:add_child(tile3)
tile3:add_child(wood)
tile3:translate(-3, 0, -3)

tile4 = gr.node('tile2')
ft:add_child(tile4)
tile4:add_child(wood)
tile4:translate(0, 0, -3)

ft1 = gr.node('ft1')
floor:add_child(ft1)
ft1:add_child(ft)

ft2 = gr.node('ft2')
floor:add_child(ft2)
ft2:add_child(ft)
ft2:translate(0, 0, -6)

ft3 = gr.node('ft3')
floor:add_child(ft3)
ft3:add_child(ft)
ft3:translate(6, 0, -6)

ft4 = gr.node('ft4')
floor:add_child(ft4)
ft4:add_child(ft)
ft4:translate(6, 0, 0)

ball = gr.sphere('ball')
scene:add_child(ball)
ball:scale(0.75, 0.75, 0.75)
ball:set_material(clear)
ball:translate(-3, 1.25, 1.5)


-- The lights
l1 = gr.light({-30,30,40}, {0.8, 0.8, 0.6}, {1.1, 0, 0})
l1:set_size({3.0, 0.0, 3.0})

gr.render(scene, 'final_scene.png', 512, 512, 
	  {0, 0, 0,}, {0, 0, -1}, {0, 1, 0}, 50,
	  {0.2, 0.2, 0.2}, {l1})
