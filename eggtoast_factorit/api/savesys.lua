---@diagnostic disable: undefined-field
savesys={
    savegame = function ()
        if love.filesystem.getInfo("savegame/save"..tostring(saveselecter)..".fsg")==nil then
            love.filesystem.newFile("savegame/save"..tostring(saveselecter)..".fsg")
        end
            tosave = {
                obj = obj.list,
                plr = {inv = plr.inventory,posx = plr.x,posy = plr.y}
            }
            love.filesystem.write("savegame/save"..tostring(saveselecter)..".fsg",json.encode(tosave))
    end,
    load = function (file)
        toload = file
        obj.list=toload.obj
        plr.inventory = toload.plr.inv
        plr.x = toload.plr.posx
        plr.y = toload.plr.posy
        --[[local sz
        for i = 1,#obj.list do
           if keyOf(obj.list[i],size) == nil then
               if table.contains(obj.sizemapid,obj.list[i].id) then
                    sz=obj.sizemap[obj.sizemaipd.indexOf(obj.list[i].id)]
                    table.insert(obj.list[i],{size=sz})
                    print("migrate.load.obj.size")
                else 
                    sz=0.4
                    table.insert(obj.list[i],size)
                end
            end
        end]]--
    end
}