lang ={ --TODO: rewrite this
    lang={},
    currentlang="enus",
    gettxt = function (txtid)
        local tmp = string.split(txtid,".")
        local tbl = lang.lang
        for i = 1,#tmp do
            tbl = tbl[tmp[i]] or nil
            if tbl == nil then
                break
            end
        end
        if nullcheck(tbl) and type(tbl) == "string" then
            return tbl
        else
            tmp = string.split(txtid,".")
            tbl = lang.list.enus
            for i = 1,#tmp do
                tbl = tbl[tmp[i]] or nil
                if tbl == nil then
                    break
                end
            end
            if nullcheck(tbl) and type(tbl) == "string" then
                return tbl
            end
        end
        return "error"
    end,
    set = function (ln)
        if table.haskey(lang.list,ln) then
            lang.lang = lang.list[ln]
            lang.currentlang = ln
            log.d("LangSys","Language changed to "..lang.currentlang)
        end
    end,
    list={}
}
require("language.en-us")
require("language.ja-jp")