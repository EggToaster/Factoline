local this ={
text = {
    {color={0,0,0},text="#title.settingsbutton",pos={150,-20},size={2.5,2.5},slide=false}
},
button = {
    {color={0,0,0},bg={1,1,1},text="#title.back",pos={0,0},size={150,75},txc={0,0,0},txs={2,2},slide=false,action=function ()
        stng=false
    end},
    --{color={0,0,0},bg={1,1,1},text="#stng.general",pos={0,75},size={180,75},txc={0,0,0},txs={1.5,1.5},action=function ()
    --    stngtab="general"
    --end}
},
recttxt = {
    {color={0,0,0},bg={1,1,1},text="#stng.general",pos={0,75},size={180,75},txc={0,0,0},txs={1.5,1.5},slide=false}
},
slider = {
    {color={0,0,0},bg={.75,.75,.75},pos={950,250},len=450,wid=25,pc={0,0,0},pbg={.5,.5,.5}}
}
}
--table.insert(guiload.list,this)
return this