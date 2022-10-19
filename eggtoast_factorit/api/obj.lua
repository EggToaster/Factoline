require("machine.crafttable")
require("machine.crafter")
require("machine.mecharm")
require("machine.chest")
require("machine.miner")
obj={
    drawobjgui = function ()
        for i = 1 , #obj.list do
        if obj.list[i].id=="craftbench" then
            if obj.list[i].nbt.craftopen==true then
            craftbench.draw(i)
        end
    end
    if obj.list[i].id=="crafterplcd" then
        if obj.list[i].nbt.craftopen==true then
            crafter.draw(i)
        end
    end
    if obj.list[i].id=="mecharmplcd" then
        if obj.list[i].nbt.craftopen==true then
            mecharm.draw(i)
        end
    end
    if obj.list[i].id=="chestplcd" then
        if obj.list[i].nbt.craftopen==true then
            chest.draw(i)
        end
    end
    end
    end,
    draw = function ()
        for i = 1 , #obj.list do
           -- if obj.list[i].x < dividewidth+plr.x then
              --  if obj.list[i].x > plr.x-dividewidth then
                --    if obj.list[i].y < divideheight+plr.y then
                  --      if obj.list[i].y > plr.y-divideheight then
                  local this = obj.list[i]
                  local cx,cy = cam:cameraCoords(this.x,this.y)
                  local dx,dy = love.graphics.getDimensions()
                  if cx>=-1000 and cx<=dx+1000 and cy >= -1000 and cy <= dy+1000 then
                  if table.contains(obj.sizemapid,obj.list[i].id) then
                            love.graphics.draw(gr.texture.gettex(obj.list[i].id),obj.list[i].x,obj.list[i].y,0,obj.sizemap[indexOf(obj.sizemapid,obj.list[i].id)],obj.sizemap[indexOf(obj.sizemapid,obj.list[i].id)])
                  else
                    love.graphics.draw(gr.texture.gettex(obj.list[i].id),obj.list[i].x,obj.list[i].y,0,0.4,0.4)
                  end
                            if obj.list[i].id=="tree" then
                                if obj.list[i].nbt.health<=2 then
                                    love.graphics.setColor(0,0,0)
                                    love.graphics.print(tostring(obj.list[i].nbt.health).." hp",obj.list[i].x,obj.list[i].y+13)
                                    love.graphics.setColor(1,1,1)
                                end
                            end
                        end
                   --     end
                --    end
            --    end
        --    end
        end
    end,
    destroy=function (i)
        if obj.list[i].id == "craftbench" then
            plr.craftopen=false
        end
        item.give({id=obj.list[i].after,hover=1,drag=0})
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
    list={}, -- old 1 new 2000
    genworld = function ()
        loadphase2="Inserting Ore"
        loadgraphics()
        for i = 1,5000 do
            obj.gen.genore("ironore")
            obj.gen.genore("copperore")
        end
        loadphase2="Planting Tree"
        loadgraphics()
        for i = 1,3000 do
            obj.gen.make("tree",math.random(0,mapx),math.random(0,mapy),nil,{health=3})
        end
    end,
    getsize = function (i)
        if table.contains(obj.sizemapid,obj.list[i].id) then
            return obj.sizemap[indexOf(obj.sizemapid,obj.list[i].id)]
        end
        return 0.4
    end,
    gen={
        genore = function (id)
            ids=id
            xc=math.random(0,mapx)
            yc=math.random(0,mapy)
            obj.gen.make(ids,xc,yc,nil,{})
        end,
        make = function (id,x,y,after,nbt)
            ids=id
            xc=x
            yc=y
            --[[if table.contains(obj.sizemapid,id) then
                size=obj.sizemap[indexOf(obj.sizemaipd,id)]
            else 
                size=0.4
            end]]--
            table.insert(obj.list,{id=ids,x=xc,y=yc,after=after,nbt=nbt})
        end,
        del = function (i)
            table.remove(obj.list,i)
        end
    },
    sizemap={
        0.2,
        0.2
    },
    sizemapid={
        "mecharmplcd",
        "chestplcd"
    },
    placeable={
        "miner",
        "crafter",
        "mecharm",
        "chest"
    },
    --container={
    --    "miner",
     --   "crafter",
    --    "mecharm",
    --    "chest"
    --},
    --containertype={
    --    2,
    --    3,
    --    1,
    --    4,
    --},
    plctag = {
        nature = {
            "tree",
            "ironore",
            "copperore"
        },
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
        }
    },
    placeablenbt={
        {inv={{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil}},timer=60,ore=nil},
        {inv={{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil}},invslt2={id=nil},timer=120,recipe=nil,craftopen=false},
        {inv={id=nil},timer=15,machine1=nil,machine2=nil,},
        {inv={{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil}}}
    },
    tick=function (dt)
        for i = 1 , #obj.list do
            local thisistempjustforbugfix = false
            if i < #obj.list+1 then
            objwidth, objheight = gr.texture.gettex(obj.list[i].id):getDimensions()
            objwidth = objwidth/4
            objheight=objheight/4
            if plr.x > obj.list[i].x and plr.y > obj.list[i].y and plr.x < obj.list[i].x+objwidth and plr.y < obj.list[i].y+objheight then
                if obj.list[i].id=="craftbench" then
                    crtouch=true
                    thisistempjustforbugfix = true
                end
                if obj.list[i].id=="craftbench" then
                    craftbench.tick(i)
                end
                if love.keyboard.isDown("n") then
                    if obj.list[i].after == nil then else
                    obj.destroy(i)
                    break
                    end
                end
                if love.keyboard.isDown("space") then
                    if spcobj then
                        if obj.list[i].id=="chestplcd" then
                            chest.toggleopen(i)
                            inv.open=1
                            print("building.chest.opened")
                        end
                        if obj.list[i].id=="craftbench" then
                            craftbench.toggleopen(i)
                            inv.open=1
                            print("building.craftbench.opened")
                        end
                        if obj.list[i].id=="crafterplcd" then
                            crafter.toggleopen(i)
                            inv.open=1
                            print("machine.crafter.opened")
                        end
                        if obj.list[i].id=="mecharmplcd" then
                            mecharm.toggleopen(i)
                            inv.open=1
                            print("machine.mecharm.opened")
                        end
                        if obj.list[i].id=="ironore" then
                            if grabbing.id=="miningpick" then
                                if keyspacepress==0 then
                                    love.audio.stop(sfx.get("orehit"))
                                   love.audio.play(sfx.get("orehit"))
                                   item.give({id="ironore"})
                                end
                            end
                        end
                        if obj.list[i].id=="copperore" then
                            if grabbing.id=="miningpick" then
                                if keyspacepress==0 then
                                    love.audio.stop(sfx.get("orehit"))
                                   love.audio.play(sfx.get("orehit"))
                                   item.give({id="copperore"})
                                end
                            end
                        end
                        if obj.list[i].id=="tree" then
                            if grabbing.id=="axe" then
                                if keyspacepress==0 then
                                    obj.list[i].nbt.health=obj.list[i].nbt.health-1
                                    love.audio.stop(sfx.get("woodhit"))
                                    love.audio.play(sfx.get("woodhit"))
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
        if obj.list[i].id=="craftbench" then
            if thisistempjustforbugfix == false then
                crtouch=false
            end
        end
        if obj.list[i].id=="crafterplcd" then
            crafter.tick(i)
        end
        if obj.list[i].id=="mecharmplcd" then
            mecharm.tick(i)
        end
        thisistempjustforbugfix = false
    end
    end
}