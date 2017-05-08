-- Global definitions for use everywhere
require 'lib'

local Scene = require 'lib/Scene'
local Player = require 'Player'
local Vec = require 'lib/Vec'

local scene = Scene()
local player = Player(200, 100)
player.pos = Vec(200, 100)

function love.load()
	scene:insert(player)
	scene:load()
  love.graphics.setBackgroundColor(95, 205, 228)
end

local active = true

function love.keypressed(key)
  player:onKeyPress(key)
end

function love.update(dt)
  if not active then
    return
  end
  dt = math.min(0.01666667, dt)
	scene:update(dt)
end

function love.draw()
  scene:draw(dt)
end

function love.focus(focused)
  active = focused
end
