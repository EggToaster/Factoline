mouse = {
    l = false, r = true,_t=false,
    getPos = function ()
        return mouse.pos[1],mouse.pos[2]
    end,
    tick = function (dt)
        mouse.l =love.mouse.isDown(1)
        mouse.r =love.mouse.isDown(2)
        mouse.pos[1],mouse.pos[2]=love.mouse.getPosition()
    end,
    event = function (b)
        local x = mouse.pos[1]
        local y = mouse.pos[2]
        inv.mouseclick(x,y,b)
        gui.action(x,y,b)
        if b == 1 then
            if x > 295 and x <= 295+25 and y > 170 and y <= 170+25 then
                for i = 1,#plr.inventory do
                    if plr.inventory[i].id=="ironore" then
                        plr.inventory[i].id="crafttable"
                        sfx.use("woodcut")
                        break
                    end
                end
            end
        end
    end,
    mouseevent = function (b)
        mouse.event(b)
    end,
    ison = function (b)
        local b = b or 1
        if b == 1 then
            return mouse.l
        elseif b == 2 then
            return mouse.r
        end
        return false
    end,
    pos ={250,250}
}