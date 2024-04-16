local this ={
text = {
    {tag={},color={0,0,0},text="#title.settingsbutton",pos={150,-25},size={1.25,1.25},slide=false},
    {tag={"stencil"},color={0,0,0},text="#title.fullscreen",pos={0,125},size={1.25,1.25},slide=true},
    {tag={"stencil"},color={0,0,0},text="#stng.mute",pos={0,225},size={1.25,1.25},slide=true},
    {tag={"stencil"},color={0,0,0},text="#title.lang",pos={0,325},size={1.25,1.25},slide=true},
    {tag={},text="#stng.general",pos={0,75},color={1,1,1},size={0.75,0.75},slide=false}
},
button = {
    {tag={},hitbox={0,0,150,75},color={0,0,0},bg={1,1,1,0},text="#title.back",pos={0,0},size={150,75},txc={0,0,0},txs={1,1},slide=false,action=function ()
        gui.script.resetSlider()
        stng=false
    end},
    {tag={"stenciloptionclick"},hitbox={725,151,220,75},color={1,1,1,0},txs={0.4,0.4},bg={1,1,1,0},txc={1,1,1},text=function()
        if conf.fullscreen then
        return "?slideron"
        end
        return "?slider"
        end,pos={725,85},size={220,75},slide=true,action=function ()
        conf.fullscreen=not conf.fullscreen
        love.window.setFullscreen(conf.fullscreen,"desktop")
        misc.filer.write("cfg.json",json.encode(conf),true)
    end},
    {tag={"stenciloptionclick"},hitbox={725,246,220,75},color={1,1,1,0},txs={0.4,0.4},bg={1,1,1,0},txc={1,1,1},text=function()
        if conf.mute then
        return "?slideron"
        end
        return "?slider"
        end,pos={725,185},size={220,75},slide=true,action=function ()
        conf.mute=not conf.mute
        love.audio.setVolume((conf.mute and 0 or 1))
        misc.filer.write("cfg.json",json.encode(conf),true)
    end},
    {tag={"stenciloptionclick"},hitbox={725,350,220,75},color={0,0,0},txs={1,1},bg={1,1,1},txc={0,0,0},text="#stng.change",pos={725,350},size={220,75},slide=true,action=function ()
        if indexOf(table.keylist(lang.list),lang.currentlang) == #table.keylist(lang.list) then
            conf.lang = table.keylist(lang.list)[1]
        else
            conf.lang = table.keylist(lang.list)[indexOf(table.keylist(lang.list),lang.currentlang)+1]
        end
        print(conf.lang)
        lang.set(conf.lang)
        misc.filer.write("cfg.json",json.encode(conf),true)
    end},
    {tag={},color={0,0,0},bg={1,1,1},hitbox={180,75,180,75},text="#stng.video",pos={180,75},size={180,75},txc={0,0,0},txs={0.75,0.75},slide=false,action=function ()
        stngtab="video"
        gui.script.resetSlider()
    end}
},
rect = {
    {tag={},color={0,0,0},bg={0,0,0},pos={0,74},size={{"dx",0},3}},
    {tag={},color={0,0,0},bg={0,0,0},pos={0,149},size={{"dx",0},3},slide=false},
    {tag={"stencil"},color={0,0,0},bg={0,0,0},pos={0,237},size={{"dx",0},3},slide=true},
    {tag={"stencil"},color={0,0,0},bg={0,0,0},pos={0,337},size={{"dx",0},3},slide=true},
    {tag={"stencil"},color={0,0,0},bg={0,0,0},pos={0,437},size={{"dx",0},3},slide=true}
},
recttxt = {
    {tag={},color={1,1,1},bg={0,0,0},text="#stng.general",pos={0,75},size={180,75},txc={1,1,1},txs={0.75,0.75},slide=false}
},
slider = {
    {tag={},color={0,0,0},bg={.75,.75,.75},pos={950,250},len=450,wid=25,pc={0,0,0},pbg={.5,.5,.5}}
},
stencil = {
    try = function ()
        local sttag = gui.script.stencilTag
        if sttag == "stencil" then
            local dx,dy = love.graphics.getDimensions()
            love.graphics.rectangle("fill",0,150,dx,dy)
        else
            if sttag == "stenciloptionclick" then
                local dx,dy = love.graphics.getDimensions()
                love.graphics.rectangle("fill",0,150,dx,dy)
            end
        end
    end,
    stenciltag={"stencil","stenciloptionclick"}
}
}
return this