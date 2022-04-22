require("language.en-us")
require("language.ja-jp")
lang ={
    lang={},
    langindex=nil,
    langdefault=enuslang.lang,
    currentlang="enus",
    langcycle={"enus","jajp"},
    gettxt = function (txtid)
        if lang.langindex==nil then
            if table.contains(lang.langindexdefault,txtid) then
                return lang.langdefault[indexOf(lang.langindexdefault,txtid)]
            else
                return "invaid text"
            end
        else
        if table.contains(lang.langindex,txtid) then
            return lang.lang[indexOf(lang.langindex,txtid)]
        end
    end
        return "invaid text"
    end,
    reset = function ()
        lang.lang={}
        lang.langindex={}
    end,
    langindexdefault={
        "item.crafttable.name",
        "title.playbutton",
        "title.settingsbutton",
        "title.fullscreen",
        "title.back",
        "title.fullscreentogglewarn",
        "title.lang"
    }
}
if conf.lang == "jajp" then
    jajplang.setlang()
    lang.currentlang="jajp"
else
    enuslang.setlang()
    lang.currentlang="enus"
end