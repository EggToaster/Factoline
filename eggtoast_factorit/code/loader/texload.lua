texture = {
    gettex = function (txname)
        txname = txname or "nil"
        local temp = texture.tex[indexOf(texture.texnames,txname)]
        temp = (temp==nil and texture.tex[indexOf(texture.texnames,string.gsub(txname,"plcd",""))] or temp)
        return((temp==nil and texture.empty or temp))
    end,
    tex={},texnames={},empty = nil,res = "/res/tex/",
    loadtex = function ()
        local names  = love.filesystem.getDirectoryItems(texture.res)
        texture.empty = love.graphics.newImage(texture.res.."nil.png")
        for i = 1,#names do
            local name = names[i]
            table.insert(texture.tex,love.graphics.newImage(texture.res..name))
        end
        local tmp= {}
        for i = 1,#names do
            tmp[i] = string.gsub(names[i],"%..*","")
        end
        texture.texnames=tmp
    end,
}