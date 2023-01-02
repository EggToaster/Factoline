local this ={
text = {
    {tag={},color={0,0,0},text="#title.settingsbutton",pos={150,-25},size={2.5,2.5},slide=false}
},
button = {
    {tag={},color={0,0,0},bg={1,1,1},text="#title.back",pos={0,0},size={150,75},txc={0,0,0},txs={2,2},slide=false,action=function ()
        gui.script.resetslider("settingtitle-general")
        stng=false
    end},
    --{color={0,0,0},bg={1,1,1},text="#stng.general",pos={0,75},size={180,75},txc={0,0,0},txs={1.5,1.5},action=function ()
    --    stngtab="general"
    --end}
},
rect = {
    {tag={},color={0,0,0},bg={0,0,0},pos={0,75},size={"dx",1}}
},
recttxt = {
    {tag={"stencil"},color={0,0,0},bg={1,1,1},text="#stng.general",pos={0,75},size={180,75},txc={0,0,0},txs={1.5,1.5},slide=true}
},
slider = {
    {tag={},color={0,0,0},bg={.75,.75,.75},pos={950,250},len=450,wid=25,pc={0,0,0},pbg={.5,.5,.5}}
},
stencil = {
    try = function ()
        local dx,dy = love.graphics.getDimensions()
        love.graphics.rectangle("fill",0,75,dx,dy)
    end,
    stenciltag="stencil"
}
}
return this