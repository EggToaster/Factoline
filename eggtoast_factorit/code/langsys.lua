lang ={
    lang={},
    langindex=nil,
    currentlang="enus",
    gettxt = function (txtid)
        return lang.lang[indexOf(lang.langindex,txtid)] or lang.list.enus.lang[indexOf(lang.list.enus.langindex,txtid)] or "error"
    end,
    reset = function ()
        lang.lang={}
        lang.langindex={}
    end,
    set = function (langs)
        if table.haskey(lang.list,langs) then
            lang.reset()
            lang.lang = lang.list[langs].lang
            lang.langindex = lang.list[langs].langindex
            lang.currentlang = langs
            print("[lang]Set Lang to "..lang.currentlang)
        end
    end,
    list={}
}
require("language.en-us")
require("language.ja-jp")