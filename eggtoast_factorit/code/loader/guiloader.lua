guiload = {
    list = {},list2 = {},
    theme = {}, tl2 = {},
    loadgui = function ()
        guiload.list,guiload.list2,guiload.theme,guiload.tl2 = {},{},{},{}
        guiload.list2 = love.filesystem.getDirectoryItems("/guis/")
        for _, v in pairs(guiload.list2) do
            table.insert(guiload.list,require("guis."..string.gsub(v,".lua","")))
        end
        guiload.tl2 = love.filesystem.getDirectoryItems("/guithemes/")
        for _, v in pairs(guiload.tl2) do
            table.insert(guiload.theme,require("guithemes."..string.gsub(v,".lua","")))
        end
    end,
    hotswap = function ()guiload.loadgui();end,
    get = function (getthis)
        return guiload.list[table.indexof(guiload.list2,getthis..".lua")]      
    end,
    gettheme = function(getthis)
        return guiload.theme[table.indexof(guiload.tl2,getthis..".lua")]
    end
}