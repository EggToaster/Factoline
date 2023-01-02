lang ={
    lang={},
    langindex=nil,
    currentlang="enus",
    langcycle={"enus","jajp"},
    gettxt = function (txtid)
        return lang.lang[indexOf(lang.langindex,txtid)]
    end,
    reset = function ()
        lang.lang=lang.list["enus"].lang
        lang.langindex=lang.list["enus"].langindex
    end,
    set = function (langs)
        if table.contains(lang.langcycle,langs) then
            lang.reset()
            local tmp = lang.list[langs]
            for i = 1,#tmp do
                if table.contains(lang.langindex,tmp.langindex[i]) then
                    lang.lang[indexOf(lang.langindex,tmp.langindex[i])]=tmp.lang[indexOf(lang.langindex,tmp.langindex[i])]
                end
            end
        end
    end,
    list={}
}
require("language.en-us")
require("language.ja-jp")
lang.set(conf.lang)