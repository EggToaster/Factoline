--[[love.graphics.setColor(1,1,1)
love.graphics.draw(titleimg,0,0)
love.graphics.rectangle("fill",250,525,500,150)
love.graphics.rectangle("fill",250,350,500,150)
love.graphics.setColor(0,0,0)
love.graphics.rectangle("line",250,525,500,150)
love.graphics.rectangle("line",250,350,500,150)
love.graphics.setColor(0,0,0)
love.graphics.print(lang.gettxt("title.playbutton"),275,375,0,2.5,2.5)
love.graphics.print(lang.gettxt("title.saveselect1")..tostring(saveselecter)..lang.gettxt("title.saveselect2"),0,0,0,0.5,0.5)
love.graphics.setColor(0,0,0)
love.graphics.print(lang.gettxt("title.settingsbutton"),275,550,0,2.5,2.5)]]
local this ={
    button = {
        {color={0,0,0},bg={1,1,1,1},text="#title.playbutton",pos={250,350},size={500,150},txc={0,0,0},txs={2.95,2.95},slide=false,action=function ()
            makegame()
        end},
        {color={0,0,0},bg={1,1,1,1},text="#title.settingsbutton",pos={250,525},size={500,150},txc={0,0,0},txs={2.95,2.95},slide=false,action=function ()
            stng=true
            stngtab = "general"
        end},
    },
    text = {
        {color={1,1,1},text="?factoryicn",pos={0,-0},size={1.03,1.03},slide=false},
    },
    stencil = {}
}
return this