local this ={
    {p={function()return getdx()/2-250;end,350},s={500,150},slide=nil,
    bg={1,1,1},b={3,0,0,0},
    t={t="#title.playbutton",c={0,0,0},s={1.5,1.5},
    p={0,0}},action=function()startgame();end},
    {p={function()return getdx()/2-250;end,525},s={500,150},slide=nil,
    bg={1,1,1},b={3,0,0,0},
    t={t="#title.settingsbutton",c={0,0,0},s={1.5,1.5},
    p={0,0}},action=function()stng=true;stngtab="general";end},
    {p={function()return getdx()/2-350;end,5},is={0.7,0.7},
    i="factorylogo"}
}
return this