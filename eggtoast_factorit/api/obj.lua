require("machine.crafttable")
require("machine.crafter")
require("machine.mecharm")
require("machine.chest")
require("machine.miner")
obj={
    customdraw=function (objct)
        if table.contains(obj.sizemapid,objct.id) then
            love.graphics.draw(gr.texture.gettex(objct.id),objct.x,objct.y,0,obj.sizemap[indexOf(obj.sizemapid,objct.id)]/2,obj.sizemap[indexOf(obj.sizemapid,objct.id)]/2)
        else
            love.graphics.draw(gr.texture.gettex(objct.id),objct.x,objct.y,0,0.4/2,0.4/2)
        end
    end,
    guilist = {
        "craftbench","craftbench",
        "crafterplcd","crafter",
        "mecharmplcd","mecharm",
        "chestplcd","chest"
    },
    drawobjgui = function ()
        for i = 1,#obj.list do
            if table.contains(obj.guilist,obj.list[i].id) then
                if obj.list[i].nbt.craftopen==true then
                    _G[obj.guilist[indexOf(obj.guilist,obj.list[i].id)+1]].draw(i)
                end
            end
        end
    end,
    draw = function ()
        for i = 1 , #obj.list do
            local this = obj.list[i]
            local cx,cy = cam:cameraCoords(this.x,this.y)
            local dx,dy = love.graphics.getDimensions()
            if cx>=-1000 and cx<=dx+1000 and cy >= -1000 and cy <= dy+1000 then
                local sm = 0.4
                if table.contains(obj.sizemapid,this.id) then
                    sm = obj.sizemap[indexOf(obj.sizemapid,this.id)]
                end
                love.graphics.draw(gr.texture.gettex(this.id),this.x,this.y,0,sm,sm)
                if this.id=="tree" then
                    if this.nbt.health<=2 then
                        love.graphics.setColor(1,0,0)
                        love.graphics.rectangle("fill",this.x+5,this.y+5,175,15)
                        love.graphics.setColor(0,1,0)
                        love.graphics.rectangle("fill",this.x+5,this.y+5,5+(this.nbt.health*58),15)
                        love.graphics.setColor(0,0,0)
                        love.graphics.rectangle("line",this.x+5,this.y+5,175,15)
                        love.graphics.line(this.x+68,this.y+5,this.x+68,this.y+20,this.x+127,this.y+20,this.x+127,this.y+5)
                        love.graphics.print(tostring(this.nbt.health).." hp",this.x+75,this.y+1,0,0.5)
                        love.graphics.setColor(1,1,1)
                    end
                end
            end
        end
    end,
    destroy=function (i)
        if obj.list[i].id == "craftbench" then
            plr.craftopen=false
            obj.list[i].nbt.craftopen=false
        end
        item.give({id=obj.list[i].after})
        table.remove(obj.list,i)
        for ia = 1,#obj.list do
            if obj.list[ia].name=="mecharmplcd" then
                if obj.list[ia].machine1==i then
                    obj.list[ia].machine1=0
                end
                if obj.list[ia].machine2==i then
                    obj.list[ia].machine2=0
                end
            end
        end
    end,
    list={},
    genworld = function ()
        for i = 1,5000 do
            obj.make("ironore")
            obj.make("copperore")
        end
        for i = 1,3000 do
            obj.make("tree",math.random(0,mapx),math.random(0,mapy),{health=3},nil)
        end
    end,
    getsize = function (i)
        if table.contains(obj.sizemapid,obj.list[i].id) then
            return obj.sizemap[indexOf(obj.sizemapid,obj.list[i].id)]
        end
        return 0.4
    end,
    make = function (id,x,y,nbt,after)
        local x = x or math.random(0,mapx)
        local y = y or math.random(0,mapy)
        local nbt = nbt or {}
        local after = after or nil
        table.insert(obj.list,{id=id,x=x,y=y,after=after,nbt=nbt})
        return #obj.list
    end,
    sizemap={
        0.2,
        0.2
    },
    sizemapid={
        "mecharmplcd",
        "chestplcd"
    },
    placeable={
        --can be placed with interact key
        "miner",
        "crafter",
        "mecharm",
        "chest",
        "crafttable"
    },
    plctag = {

        -- behavior related stuff

        withgui = {
            "craftbench",
            "crafterplcd",
            "mecharmplcd",
            "chestplcd"
        },
        guiname = {
            "craftbench",
            "crafter",
            "mecharm",
            "chest",
        },
        withtick = {
            "crafterplcd",
            "mecharmplcd",
            "chestplcd"
        },
        -- interface related stuff

        inv= {
            "minerplcd",
            "chestplcd",
            "crafterplcd",
            "crafttable",
            "mecharmplcd"
        },
        hasslot={
            "minerplcd",
            "crafterplcd",
            "mecharmplcd",
            "chestplcd"
        },
        hasslot2={
            "crafterplcd"
        },
        slot1bothio={
            "chestplcd"
        },
        
        --type related stuff

        nature = {
            "tree",
            "ironore",
            "copperore"
        }
    },
    placeablenbt={
        {inv={{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil}},timer=60,ore=nil},
        {inv={{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil}},invslt2={id=nil},timer=120,recipe=nil,craftopen=false},
        {inv={id=nil},timer=30,machine1=nil,machine2=nil,},
        {inv={{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil}}},
        {craftopen=false}
    },
    tick=function (dt)
        for i = 1 , #obj.list do
            objwidth, objheight = gr.texture.gettex(obj.list[i].id):getDimensions()
            objwidth = objwidth/4
            objheight = objheight/4
            if table.contains(obj.plctag.withtick,obj.list[i].id) then
                _G[string.gsub(obj.list[i].id,"plcd","")].tick(i)
            end
            local mx,my = mouse.getPos()
            local ox,oy = cam:cameraCoords(obj.list[i].x,obj.list[i].y)
            if mx > ox and my > oy and mx < ox+objwidth*1.3 and my < oy+objheight*1.3 then
                local isdownspace = false
                if joymode then
                    isdownspace = joysticks:isGamepadDown("dpleft")
                else
                    isdownspace = love.keyboard.isDown("n")
                end
                if isdownspace then
                    if obj.list[i].after == nil then else
                        obj.destroy(i)
                        break
                    end
                end
                if mouse.ison(1) then
                    if spcobj then
                        if table.contains(obj.plctag.withgui,obj.list[i].id) then
                            _G[obj.plctag.guiname[indexOf(obj.plctag.withgui,obj.list[i].id)]].toggleopen(i)
                            inv.open=1
                        end
                        if obj.list[i].id=="ironore" then
                            if grabbing.id=="miningpick" then
                                if keyspacepress==0 then
                                    misc.sfx.play("orehit")
                                    item.give({id="ironore"})
                                end
                            end
                        end
                        if obj.list[i].id=="copperore" then
                            if grabbing.id=="miningpick" then
                                if keyspacepress==0 then
                                    misc.sfx.play("orehit")
                                    item.give({id="copperore"})
                                end
                            end
                        end
                        if obj.list[i].id=="tree" then
                            if grabbing.id=="axe" then
                                if keyspacepress==0 then
                                    obj.list[i].nbt.health=obj.list[i].nbt.health-1
                                    misc.sfx.play("woodhit")
                                    if obj.list[i].nbt.health==0 then
                                        item.give({id="woodlog"})
                                        obj.destroy(i)
                                        break
                                    end
                                end
                            end
                        end
                    spcobj=false
                    end
                else
                    spcobj=true
                end
            end
        end
    end
}