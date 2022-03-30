sfx = {
    list = {},
    loadsound = function ()
        sfx.sound2 = love.filesystem.getDirectoryItems("/sfx/")
        for i=1,#sfx.sound2 do
            loadphase2="/sfx/"..sfx.sound2[i]
            tmp=love.audio.newSource("/sfx/"..sfx.sound2[i],"static")
            table.insert(sfx.list,tmp)
            loadgraphics()
        end
    end,
    get=function (getthis)
        return(sfx.list[indexOf(sfx.sound2,getthis..".mp3")])        
    end
}