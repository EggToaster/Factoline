gr.texture = {
    empty = nil,
    gettex = function (texstrg)
        local texstrg = texstrg or nil
        if texstrg==nil then
            return(gr.texture.empty)
        end
        return(gr.texture.texture[indexOf(gr.texture.texture2,texstrg..".png")])
    end,
    texture={},
    load = function ()
        gr.texture.texture2 = love.filesystem.getDirectoryItems("/res/")
    end,
    parse = function ()
        gr.texture.empty = love.graphics.newImage("res/nil.png")
        for i=1,#gr.texture.texture2 do
            local fn = gr.texture.texture2[i]
            table.insert(gr.texture.texture,love.graphics.newImage("/res/"..gr.texture.texture2[i]))
        end
    end
}