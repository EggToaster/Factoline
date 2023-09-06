local devicepreset = {
    pc={
        console = false,
        dualscreen = false,
        padonly = false,
        noclick = false,
        device = "PC",
        padbutton = {--xbox/nx/dualsense, no steering wheel here
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
        detail = "personal computer"
    },
    threeds={--threeds because table doesnt allow numbers
        console = true,
        dualscreen = true,
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
        detail = "nx"
    }
}
return devicepreset