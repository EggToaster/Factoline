local this ={
    button = {
        {color={0,0,0},bg={1,1,1,1},text="#title.playbutton",pos={250,350},size={500,150},txc={0,0,0},txs={1.5,1.5},slide=false,action=function ()
            makegame()
        end},
        {color={0,0,0},bg={1,1,1,1},text="#title.settingsbutton",pos={250,525},size={500,150},txc={0,0,0},txs={1.5,1.5},slide=false,action=function ()
            stng=true
            stngtab = "general"
        end},
    },
    text = {
        {color={1,1,1},text="?factorylogo",pos={{"centerdx",-350},-0},size={0.7,0.7},slide=false},
    },
    stencil = {}
}
return this