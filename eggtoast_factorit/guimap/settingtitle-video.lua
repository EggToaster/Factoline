local this ={
text = {
    {tag={},color={0,0,0},text="#title.settingsbutton",pos={150,-25},size={2.5,2.5},slide=false},
    {tag={"stencil"},color={0,0,0},text="VSync",pos={0,125},size={2.5,2.5},slide=true},
    {tag={"stencil"},color={0,0,0},text="#stng.alwmax",pos={0,225},size={2.5,2.5},slide=true}
},
button = {
    {tag={},hitbox={0,0,150,75},color={0,0,0},bg={1,1,1,0},text="#title.back",pos={0,0},size={150,75},txc={0,0,0},txs={2,2},slide=false,action=function ()
        gui.script.resetSlider()
        stng=false
    end},
    {tag={"stenciloptionclick"},hitbox={725,150,125,75},color={1,1,1,0},txs={0.4,0.4},bg={1,1,1,0},txc={1,1,1},text=function()
        if conf.vsync then
        return "?slideron"
        end
        return "?slider"
        end,pos={725,85},size={125,75},slide=true,action=function ()
        conf.vsync=not conf.vsync
        love.window.setVSync(conf.vsync and 1 or 0)
        misc.filer.write("cfg.json",json.encode(conf),true)
    end},
    {tag={"stenciloptionclick"},hitbox={725,245,125,75},color={1,1,1,0},txs={0.4,0.4},bg={1,1,1,0},txc={1,1,1},text=function()
        if conf.alwmax then
        return "?slideron"
        end
        return "?slider"
        end,pos={725,185},size={125,75},slide=true,action=function ()
        conf.alwmax=not conf.alwmax
        if conf.alwmax then
            love.window.maximize()
        end
        misc.filer.write("cfg.json",json.encode(conf),true)
    end},
    {tag={},color={0,0,0},bg={1,1,1},hitbox={0,75,180,75},text="#stng.general",pos={0,75},size={180,75},txc={0,0,0},txs={1.5,1.5},slide=false,action=function ()
        stngtab="general"
        gui.script.resetSlider()
    end}
},
rect = {
    {tag={},color={0,0,0},bg={0,0,0},pos={0,74},size={{"dx",-0},3}},
    {tag={},color={0,0,0},bg={0,0,0},pos={0,149},size={{"dx",0},3},slide=false},
    {tag={"stencil"},color={0,0,0},bg={0,0,0},pos={0,237},size={{"dx",0},3},slide=true},
    {tag={"stencil"},color={0,0,0},bg={0,0,0},pos={0,337},size={{"dx",0},3},slide=true},
},
recttxt = {
    {tag={},color={1,1,1},bg={0,0,0},text="#stng.video",pos={180,75},size={180,75},txc={0,0,0},txs={1.5,1.5},slide=false}
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