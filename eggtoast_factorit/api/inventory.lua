inv = {
    open=0,
    invsquarepos={
        {x=55,y=55},
        {x=90,y=55},
        {x=125,y=55},
        {x=160,y=55},
        {x=195,y=55},
        {x=230,y=55},
        {x=265,y=55},
        {x=300,y=55},
        {x=55,y=90},
        {x=90,y=90},
        {x=125,y=90},
        {x=160,y=90},
        {x=195,y=90},
        {x=230,y=90},
        {x=265,y=90},
        {x=300,y=90},
        {x=55,y=125},
        {x=90,y=125},
        {x=125,y=125},
        {x=160,y=125},
        {x=195,y=125},
        {x=230,y=125},
        {x=265,y=125},
        {x=300,y=125},
        {x=55,y=160},
        {x=90,y=160},
        {x=125,y=160},
        {x=160,y=160},
        {x=195,y=160},
        {x=230,y=160},
        {x=265,y=160},
        {x=300,y=160},
        {x=55,y=200},
        {x=90,y=200},
        {x=125,y=200},
        {x=160,y=200},
        {x=195,y=200},
        {x=230,y=200},
        {x=265,y=200},
        {x=300,y=200},
        {x=335,y=200},
        {x=335,y=160}
    },
    sys = function ()
        local mx, my = love.mouse.getPosition()
        inv.getlanding()
        if love.mouse.isDown(1) then
        else
            if drawinvitem==nil then
            else
                inv.getlanding()
                if hvrinv==nil then
                else
                    if hvrinv==42 then
                        plr.inventory[drawinvitem].id=nil
                    else
                    --hvrinvdetect
                        --frominv
                        dii=plr.inventory[drawinvitem]
                        hi=plr.inventory[hvrinv]
                        table.insert(plr.inventory,drawinvitem,hi)
                        table.remove(plr.inventory,drawinvitem+1)
                        table.insert(plr.inventory,hvrinv,dii)
                        table.remove(plr.inventory,hvrinv+1)
                    end
                end
            if drawinvitem==nil then
            else
                plr.inventory[drawinvitem].drag=0
            end
            dii=nil
            hi=nil
            hvrinv=nil
            drawinvitem=nil
        end
end
    end,
    getlanding = function ()
        local mx, my = love.mouse.getPosition()
        insqp =inv.invsquarepos
        for i = 1,#inv.invsquarepos do
            if ((mx - insqp[i].x) > 0) and ((mx - insqp[i].x) <= 25) and ((my - insqp[i].y) > 0) and ((my - insqp[i].y) <= 25) then        
                plr.inventory[i].hover=0
                hvrinv=i
            else
                plr.inventory[i].hover=1
            end
            end
    end,
    draw = function ()
        if inv.open==1 then
            local mx, my = love.mouse.getPosition()
            insqp =inv.invsquarepos
            for i = 1,#inv.invsquarepos do
                if ((mx - insqp[i].x) > 0) and ((mx - insqp[i].x) <= 25) and ((my - insqp[i].y) > 0) and ((my - insqp[i].y) <= 25) then        
                    plr.inventory[i].hover=0
                    if plr.inventory[i].id==nil then
                    else
                    if love.mouse.isDown(1) and drawinvitem==nil and drawhotitem==nil then
                        if i == 42 then else
                        plr.inventory[i].drag=1
                        end
                    else
                        plr.inventory[i].drag=0
                    end
                end
                else
                    plr.inventory[i].hover=1
                end
                end
            gr.draw.square(50,50,320,400,"fill",0,0,0)
            for i = 1, #inv.invsquarepos do
                gr.draw.square(inv.invsquarepos[i].x,inv.invsquarepos[i].y,30,30,"fill",plr.inventory[i].hover,plr.inventory[i].hover,plr.inventory[i].hover)
                if plr.inventory[i].id == nil then
                else
                    love.graphics.draw(gr.texture.gettex(plr.inventory[i].id),inv.invsquarepos[i].x,inv.invsquarepos[i].y,0,0.065,0.065)
                end
                if plr.inventory[i].drag == 1 then
                    drawinvitem=i
                end
            end
            
        end
        if drawinvitem==nil then
        else
            mx,my=love.mouse.getPosition()
            love.graphics.draw(gr.texture.gettex(plr.inventory[drawinvitem].id),mx,my,0,0.065,0.065)
        end
        love.graphics.setColor(0,0,0)
    end
}