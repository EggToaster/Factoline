lang ={
    lang={},
    langindex=nil,
    currentlang="enus",
    langcycle={"enus","jajp"},
    gettxt = function (txtid)
        if lang.langindex==nil then
            if table.contains(lang.list["enus"].langindex,txtid) then
                return lang.list["enus"].lang[indexOf(lang.list["enus"].langindex,txtid)]
            end
        else
            if table.contains(lang.langindex,txtid) then
                return lang.lang[indexOf(lang.langindex,txtid)]
            end
        end
        return "error"
    end,
    reset = function ()
        lang.lang={}
        lang.langindex={}
    end,
    set = function (langs)
        if table.contains(lang.langcycle,langs) then
            lang.reset()
            lang.lang = lang.list[langs].lang
            lang.langindex = lang.list[langs].langindex
        end
    end,
    list={}
}
require("language.en-us")
require("language.ja-jp")
lang.set(conf.lang)