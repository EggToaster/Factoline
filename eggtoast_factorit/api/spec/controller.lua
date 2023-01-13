local upd = false
local dwd = false
controller = {
    tick = function(delta)
        if joymode then
            controller.padtick(delta)
        else
            controller.keytick(delta)
        end
    end,
    keytick = function (dt)
        spd=100
        if love.keyboard.isDown("lshift") then
            if spdrun == 1 then
                spd = 300
            end
            if spdrun == 2 then
                spd = 500
            end
            if spdrun == 3 then
                spd = 750
            end
            if spdrun == 4 then
                spd = 1000
            end
            if spdrun==5 then
                spd= 1500
            end
        end
        if love.keyboard.isDown("w") then
            plr.y=plr.y-dt*spd
        end
        if love.keyboard.isDown("a") then
            plr.x=plr.x-dt*spd
            plr.rot="left"
        end
        if love.keyboard.isDown("s") then
            plr.y=plr.y+dt*spd
        end
        if love.keyboard.isDown("d") then
            plr.x=plr.x+dt*spd
            plr.rot="right"
        end
        if love.keyboard.isDown("space")then
            plr.handrot=1
            keyspacepress=1
        else
            plr.handrot=0
            keyspacepress=0
        end
    end,
    padtick = function (dt)
        local y = 0
        if buttonis("dpup",0) and (not upd) then
            y = y + 1
            upd = true
        else
            if not buttonis("dpup",0) then
            upd = false
            end
        end
        if buttonis("dpdown",0) and (not dwd) then
            y = y - 1
            dwd = true
        else
            if not buttonis("dpdown",0) then
            dwd = false
            end
        end
        if title then
            if y <= 0 then
                saveselecter =saveselecter-1
            else
                saveselecter=saveselecter+1
            end
            if saveselecter<=0 then
                saveselecter=1
            end
        else
            if crafteruse then
                crafter.wheel(y)
            else
            if plr.craftopen then 
                craftbench.wheel(y)
            else
        if y < 0 then
            plr.hotselect=plr.hotselect+1
            if plr.hotselect>9 then
                plr.hotselect=1
            end
        elseif y > 0 then
            plr.hotselect= plr.hotselect-1
            if plr.hotselect<1 then
                plr.hotselect=9
            end
        end
    end
    end
    end
        if joysticks:isGamepadDown("y") then
            if spdrun == 1 then
                spd = 300
            end
            if spdrun == 2 then
                spd = 500
            end
            if spdrun == 3 then
                spd = 750
            end
            if spdrun == 4 then
                spd = 1000
            end
            if spdrun==5 then
                spd= 1500
            end
        end
        yesspd = (spd-yesspd)/3+yesspd
        plr.y=plr.y+((dt*yesspd)*joysticks:getGamepadAxis("lefty"))
        plr.x=plr.x+((dt*yesspd)*joysticks:getGamepadAxis("leftx"))
        if joysticks:getGamepadAxis("leftx") > 0 then
            plr.rot="right"
        else
            plr.rot="left"
        end
        if joysticks:isGamepadDown("a")then
            plr.handrot=1
            keyspacepress=1
        else
            plr.handrot=0
            keyspacepress=0
        end
        end
}
function gamekey(key)
    if love.keyboard.isDown("c") then
        spdrun = spdrun + 1
        if spdrun==6 then
            spdrun=1
        end
    end
    if key == "=" then
		donut.toggle()
	end
    if love.keyboard.isDown("escape") then
        if love.keyboard.isDown("l") then
            misc.save.savegame()
            title=true
        else
            plr.craftopen=false
            crafteruse=false
            plr.craftopeni=nil
            plr.craftopen=false
            for i = 1,#obj.list do
                if table.haskey(obj.list[i].nbt,"craftopen") then
                    if obj.list[i].nbt.craftopen==true then
                        obj.list[i].nbt.craftopen=false
                    end
                end
            end
            inv.open = 0
        end
    end
    for i = 1,9 do
        if love.keyboard.isDown(tostring(i)) then
            plr.hotselect=i
        end
    end
end
function gamepad(button)
    if buttonis("x",button) then
        if inv.open==1 then
            inv.open=0
            plr.craftopen=false
            plr.craftopeni=0
            crafteruse=false
            for i = 1,#obj.list do
                if table.haskey(obj.list[i].nbt,"craftopen") then
                    if obj.list[i].nbt.craftopen==true then
                        obj.list[i].nbt.craftopen=false
                    end
                end
            end
        else
            inv.open=1
        end
    end
    if  buttonis("back",button) then
        spdrun = spdrun + 1
        if spdrun==6 then
            spdrun=1
        end
    end
    if buttonis("start",button) then
        misc.save.savegame()
        title=true
    end
    if buttonis("rightshoulder",button) then
        plr.hotselect= plr.hotselect+1
        if plr.hotselect>9 then
            plr.hotselect=1
        end
    end
    if buttonis("leftshoulder",button) then
        plr.hotselect= plr.hotselect-1
        if plr.hotselect<1 then
            plr.hotselect=9
        end
    end
    if buttonis("b",button) then
        plr.craftopen=false
        crafteruse=false
        plr.craftopeni=nil
        print("craftoff")
        plr.craftopen=false
        for i = 1,#obj.list do
            if table.haskey(obj.list[i].nbt,"craftopen") then
                if obj.list[i].nbt.craftopen==true then
                    obj.list[i].nbt.craftopen=false
                end
            end
        end
        inv.open = 0
    end
end