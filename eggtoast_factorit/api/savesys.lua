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
    end
}