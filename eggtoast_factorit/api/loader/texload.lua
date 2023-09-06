texture = {
    empty = nil,
    gettex = function (texstrg)
        local texstrg = texstrg or nil
        if texstrg==nil then
            return(texture.empty)
        end
        return(texture.texture[indexOf(texture.texture2,texstrg..".png")])
    end,
    texture={},
    load = function ()
        texture.texture2 = love.filesystem.getDirectoryItems("/res/")
    end,
    parse = function ()
        texture.empty = love.graphics.newImage("res/nil.png")
        for i=1,#texture.texture2 do
            local fn = texture.texture2[i]
            table.insert(texture.texture,love.graphics.newImage("/res/"..texture.texture2[i]))
        end
    end
}