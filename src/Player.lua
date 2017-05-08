local Color = require 'lib/Color'
local Entity = require 'lib/Entity'
local Sprite = require 'lib/Sprite'
local Size = require 'lib/Size'
local Vec = require 'lib/Vec'

local Player = class('Player', 'Entity')

local WALK_ACCEL = 500
local FLOW_PRESSURE = 10
local DRAG_MIN = 20
local HORIZONTAL_DRAG = 200
local TERMINAL_VELOCITY = 400

function Player:__init()
  Player.super().__init(self)
  self.color = Color(80, 0, 0)
  self.size = Size(48, 48)
  self.gravity = 0
  self._sprite = Sprite()
  self._elapsed = 0
end

function Player:load()
  self._sprite:loadAnim('data/baby.png', 'idle', 0, 32, 4, 1)
  self._sprite:loadAnim('data/baby.png', 'walk', 4, 32, 4, 4)
  self._sprite:playAnim('idle')
end

function Player:onKeyPress(key)
end

function Player:update(dt)
  self._sprite:update(dt)
  self._elapsed = self._elapsed + dt

  if love.keyboard.isDown('right') then
    self.accel.x = WALK_ACCEL
    self._sprite:playAnim('walk')
    self._sprite.flipX = false
  elseif love.keyboard.isDown('left') then
    self.accel.x = -WALK_ACCEL
    self._sprite:playAnim('walk')
    self._sprite.flipX = true
  else
    self._sprite:playAnim('idle')
    self.accel.x = 0
    self.accel.y = 0
    self.vel.x = 0
  end
end

function Player:draw()
  self._sprite:draw(self.pos, self.size)
end

return Player
