guiload = {
    list = {},
    loadgui = function ()
        guiload.list2 = love.filesystem.getDirectoryItems("/guimap/")
        for i=1,#guiload.list2 do
            tmp=require("/guimap/"..string.gsub(guiload.list2[i],".lua",""))
            table.insert(guiload.list,tmp)
        end
    end,
    hotswap=function ()
        print("hotswapping gui")
        guiload.list={}
        gui.tempguinow=nil
        guiload.loadgui()
        print("hotswapped gui")
    end,
    get=function (getthis)
        return(guiload.list[indexOf(guiload.list2,getthis..".lua")])        
    end
}