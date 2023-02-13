--[[
	Donut v0.1.4 - Simplified debug messages for LOVE <http://love2d.org>
	Copyright (C) by Christopher "Kasoki" Kaster 2012
	This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Lesser General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Lesser General Public License for more details.
    You should have received a copy of the GNU Lesser General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
]]--

Donut = {}

function Donut.init(x, y)
	local self = {}

	self.x = x
	self.y = y
	self.__index = 0
	self.__storage = {}
	self.__stepSize = 20
	self.__debugMode = false
	self.__color = {
		r = 0, g = 0, b = 0
	}

	function self.add(msg)
		entry = self.__index
		self.__storage[entry] = {}
		self.__storage[entry].message = msg
		self.__storage[entry].value = "asdf"
		self.__index = self.__index + 1

		return entry
	end

	function self.setColor(red, green, blue)
		self.__color.r = red
		self.__color.g = green
		self.__color.b = blue
	end

	function self.setStepSize(stepSize)
		self.__stepSize = stepSize
	end

	function self.show()
		self.__debugMode = true
	end

	function self.hide()
		self.__debugMode = false
	end

	function self.toggle()
		if self.__debugMode then
			self.__debugMode = false
		else
			self.__debugMode = true
		end
	end

	function self.update(entry, value)
		if self.__debugMode then
			self.__storage[entry].value = value
		end
	end

	function self.draw(xoffset, yoffset)
		if self.__debugMode then
			love.graphics.setColor(255, 0, 0)

			xoffset = xoffset or 0
			yoffset = yoffset or 0

			love.graphics.print("DONUT DEBUG MODE", self.x + xoffset, self.y + yoffset)

			love.graphics.setColor(
				self.__color.r,
				self.__color.g,
				self.__color.b)

			-- user defined debug messages
			msg = self.__storage
			stepSize = self.__stepSize
			i = 0

			for step = stepSize, self.__index * stepSize, stepSize do
				love.graphics.print(msg[i].message..": "..msg[i].value, self.x + xoffset, (self.y + yoffset) + step)
				i = i + 1
			end

			-- set color back to white
			love.graphics.setColor(255, 255, 255)
		end
	end

	return self
end