texture = {
    gettex = function (txname)
        local tmp = texture.tex[table.indexof(texture.texnames,txname)]
        return (nullcheck(tmp) and tmp or texture.empty)
    end,
    tex={},texnames={},empty = nil,res = "/res/tex/",
    loadtex = function ()
        local names  = love.filesystem.getDirectoryItems(texture.res)
        texture.empty = love.graphics.newImage(texture.res.."nil.png")
        for _, name in pairs(names) do
            table.insert(texture.tex,love.graphics.newImage(texture.res..name))
        end
        local tmp = {}
        for _, v in pairs(names) do
            local a = string.gsub(v,"%..*","")
            table.insert(tmp, a)
        end
        texture.texnames=tmp
    end,
}