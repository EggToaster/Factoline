texture = {
    gettex = function (txname)
        local txname = txname or nil
        if txname==nil then
            return(texture.empty)
        end
        local temp = texture.tex[indexOf(texture.texnames,txname)]
        return((temp==nil and texture.empty or temp))
    end,
    tex={},texnames={},empty = nil,
    loadtex = function ()
        local names  = love.filesystem.getDirectoryItems("/res/")
        texture.empty = love.graphics.newImage("res/nil.png")
        for i = 1,#names do
            local name = names[i]
            table.insert(texture.tex,love.graphics.newImage("/res/"..name))
        end
        local tmp= {}
        for i = 1,#names do
            tmp[i] = string.gsub(names[i],"%..*","")
        end
        texture.texnames=tmp
    end,
}