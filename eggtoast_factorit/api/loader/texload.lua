gr.texture = {
    gettex = function (texstrg)
        return(gr.texture.texture[indexOf(gr.texture.texture2,texstrg..".png")])
    end,
    texture={},
    load = function ()
        gr.texture.texture2 = love.filesystem.getDirectoryItems("/res/")
    end,
    parse = function ()
        for i=1,#gr.texture.texture2 do
            table.insert(gr.texture.texture,love.graphics.newImage("/res/"..gr.texture.texture2[i]))
        end
    end
}