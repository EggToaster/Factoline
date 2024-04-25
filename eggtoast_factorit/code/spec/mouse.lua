local meow
local meow2 = false
local meow3 = false
mouse = {
    getPos = function ()
        return mouse.pos[1],mouse.pos[2]
    end,
    tick = function (dt)
        local x = mouse.pos[1]
        local y = mouse.pos[2]
        if mouse.device=="stick" then
            if meow2 then
                mouse.pos[1] = mouse.pos[1] + (joysticks:getGamepadAxis("rightx")*dt*250)
                mouse.pos[2] = mouse.pos[2] + (joysticks:getGamepadAxis("righty")*dt*250)
            else
                local dx,dy=love.graphics.getDimensions()
                mouse.pos[1] = (joysticks:getGamepadAxis("rightx")*150)+(dx/2)
                mouse.pos[2] = (joysticks:getGamepadAxis("righty")*150)+(dy/2)
            end
            if mouse.ison(1) or mouse.ison(2) then
            if not meow then
                meow=true
                if mouse.ison(1) then
                mouse.event(1)
                else
                    mouse.event(2)
                end
            end
        else
            meow = false
        end
        if joysticks:isGamepadDown("rightstick") then
            if not meow3 then
                meow2 = not meow2
                meow3 = true
            end
        else
            meow3=false
        end
        end
        if mouse.device=="mouse" then
            mouse.pos[1],mouse.pos[2]=love.mouse.getPosition()
        end
    end,
    draw = function ()
        local x = mouse.pos[1]
        local y = mouse.pos[2]
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
        if mouse.device == "stick" then
            if b == 1 then
                if joysticks:getGamepadAxis("triggerright")==0 then
                    return false
                else
                    return true
                end
            else 
            if b == 2 then
                if joysticks:getGamepadAxis("triggerleft")==0 then
                    return false
                else
                    return true
                end
            end
        end
    else
        if mouse.device=="mouse" then
            if love.mouse.isDown(b) then
                return true
            else
                return false
            end
        end
    end
    return false
    end,
    device="mouse",
    pos ={250,250}
}