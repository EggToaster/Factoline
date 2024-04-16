sfx = {
    list = {},
    loadsound = function ()
        sfx.list2 = love.filesystem.getDirectoryItems("/res/sound/")
        for i=1,#sfx.list2 do
            tmp=love.audio.newSource("/res/sound/"..sfx.list2[i],"static")
            table.insert(sfx.list,tmp)
        end
    end,
    use = function (getthis)
        if table.contains(sfx.list2,getthis..".mp3") then
            love.audio.play(sfx.list[indexOf(sfx.list2,getthis..".mp3")])
        end
    end,
    get=function (getthis)
        return(sfx.list[indexOf(sfx.list2,getthis..".mp3")])
    end
}