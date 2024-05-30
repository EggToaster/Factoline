mouse = {
    l = false, r = true,_t=false,
    getPos = function ()
        return mouse.pos[1],mouse.pos[2]
    end,
    tick = function (dt)
        if mouse.device=="stick" then
            mouse.l = (joysticks:getGamepadAxis("triggerright")~=0)
            mouse.r = (joysticks:getGamepadAxis("triggerleft")~=0)
            mouse.pos[1] = mouse.pos[1] + (joysticks:getGamepadAxis("rightx")*dt*250)
            mouse.pos[2] = mouse.pos[2] + (joysticks:getGamepadAxis("righty")*dt*250)
            if mouse.ison() or mouse.ison(2) then
                if not mouse._t then
                    mouse._t = true
                    if mouse.ison() then
                        mouse.event(1)
                    else
                        mouse.event(2)
                    end
                end
            else
                mouse._t = false
            end
        else
            mouse.l =love.mouse.isDown(1)
            mouse.r =love.mouse.isDown(2)
            mouse.pos[1],mouse.pos[2]=love.mouse.getPosition()
        end
    end,
    draw = function ()
        local x, y = mouse.getPos()
        if mouse.device=="stick" then
            love.graphics.setColor(1,1,1)
            love.graphics.polygon("fill",x,y, x,y+25,x+10,y+25, x,y)
            love.graphics.setColor(0,0,0)
            love.graphics.line(x,y, x,y+25,x+10,y+25, x,y)
            love.graphics.setColor(1,1,1)
        end
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
    device="mouse",
    pos ={250,250}
}