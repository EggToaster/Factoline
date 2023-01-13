misc = {
    save={
        savegame = function ()
            if love.filesystem.getInfo("savegame/save"..tostring(saveselecter)..".fsg")==nil then
                love.filesystem.newFile("savegame/save"..tostring(saveselecter)..".fsg")
            end
                tosave = {
                    obj = obj.list,
                    plr = {inv = plr.inventory,posx = plr.x,posy = plr.y}
                }
                love.filesystem.write("savegame/save"..tostring(saveselecter)..".fsg",misc.filer.zip(json.encode(tosave)))
        end,
        load = function (file)
            local file = json.decode(misc.filer.unzip(file))
            obj.list=file.obj
            plr.inventory = file.plr.inv
            plr.x = file.plr.posx
            plr.y = file.plr.posy
        end
    },
    filer={
        read = function (name,trymake)
            trymake = trymake or true
            local info = love.filesystem.getInfo(name,"file")
            if info==nil then
                if trymake then
                    love.filesystem.newFile(name)
                else
                    return nil
                end
            end
            local l,r = love.filesystem.read(name)
            return l
        end,
        write = function (name,data,trymake)
            trymake = trymake or true
            local info = love.filesystem.getInfo(name,"file")
            if info==nil then
                if trymake then
                    love.filesystem.newFile(name)
                end
            else
                love.filesystem.write(name,data)
            end
        end,
        zip = function(data)
            return love.data.compress("string","lz4",data)
        end,
        unzip = function(data)
            return love.data.decompress("string","lz4",data)
        end
    },
    sfx = {
        play = function (name,onlyonce)
            local onlyonce = onlyonce or true
            if onlyonce then
                love.audio.stop(sfx.get(name))
            end
            love.audio.play(sfx.get(name))
        end
    }
}