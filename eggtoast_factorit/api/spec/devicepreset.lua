local devicepreset = {
    pc={
        console = false,
        dualscreen = false,
        padonly = false,
        noclick = false,
        device = "PC",
        detail = "",
        padbutton = {
            "A","B","X","Y",
            "L","R",
            "ZL","ZR",
            "SELECT","START",
            "LSP","RSP"
        },
        specialpad = {
            "DPAD",
            "LS","RS"
        }
    },
    threds={
        console = true,
        dualscreen = true,
        dualtype = "upbig",
        padonly = true,
        noclick = true,
        device = "3DS",
        padbutton = {
            "A","B","X","Y",
            "L","R",
            "ZL","ZR",--yes this game going to be only n3ds
            "SELECT","START",
        },
        specialpad = {
            "DPAD",
            "LS","RS"
        },
        detail = "100% not nintendo licensed build tool"
    },
    dsi={--why
        console = true,
        dualscreen = true,
        dualtype="normal",
        padonly = true,
        noclick = true,
        device = "DSi",
        padbutton = {
            "A","B","X","Y",
            "L","R",
            "SELECT","START",
        },
        specialpad = {
            "DPAD"
        },
        detail = "1000% not nintendo licensed build tool"
    },
    wiiu={
        console = true,
        dualscreen = false,
        padonly = true,
        noclick = true,
        device = "WiiU",
        padbutton = {
            "A","B","X","Y",
            "L","R",
            "ZL","ZR",
            "SELECT","START",
            "LSP","RSP"
        },
        specialpad = {
            "DPAD",
            "LS","RS"
        },
        detail = "100% not nintendo licensed build tool"
    },
    switch={
        console = true,
        dualscreen = false,
        padonly = true,
        noclick = true,
        device="NS",
        padbutton = {
            "A","B","X","Y",
            "L","R",
            "ZL","ZR",
            "SELECT","START",
            "LSP","RSP"
        },
        specialpad = {
            "DPAD",
            "LS","RS"
        },
        detail = "100% not nintendo licensed build tool"
    }
}
return devicepreset