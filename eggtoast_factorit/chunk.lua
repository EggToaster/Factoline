chunk = {
    getChunk = function (x,y)
        
    end,
    makeChunk = function (data,sx,sy)
        
    end,
    sortData = function (data,type)
        type = type or "randomorder"
    end,
    easyMake = function (data,sx,sy,type)
        type = type or "randomorder"
        local data = chunk.sortData(data,type)
    end
}