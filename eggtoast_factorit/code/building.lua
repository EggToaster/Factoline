local building = {
    --TODO: finish this
    --[[
        Creates a new building data.
        A table with key "id" with string value is required for argument.
        ID can be "base.<id>" if inside buildings directory, or "<mod id>.<id>" if inside mod/<mod id>.
        You could also specify building name with key name, value string.
        # is required at first character of name unless you will use language file.
        Texture is a path to .png file from directory with building.lua file
    ]]
    new = function (tbl)
        result = {}
        result.id = tbl.id or log.fatal("BuildingLib","Unspecified ID for building")
        result.name = tbl.name or result.id
        result.texture = tbl.texture or "#nil"
        if 
    end
}