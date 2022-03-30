require("api.crafttable")
obj={
    drawobjgui = function ()
        for i = 1 , #obj.list do
        if obj.list[i].id=="craftbench" then
            if obj.list[i].nbt.craftopen==true then
            craftbench.draw(i)
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
                            love.graphics.draw(gr.texture.gettex(obj.list[i].id),obj.list[i].x,obj.list[i].y,0,0.5,0.5)
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
    end,
    list={},
    genworld = function ()
        loadphase2="Generating Ore"
        loadgraphics()
        for i = 1,15 do
        obj.gen.genore("ironore")
        end
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
            table.insert(obj.list,{id=ids,x=xc,y=yc,after=after,nbt=nbt})
        end
    },
    tick=function (dt)
        for i = 1 , #obj.list do
            if i < #obj.list+1 then
            objwidth, objheight = gr.texture.gettex(obj.list[i].id):getDimensions()
            objwidth = objwidth/2
            objheight=objheight/2
            if plr.x > obj.list[i].x and plr.y > obj.list[i].y and plr.x < obj.list[i].x+objwidth and plr.y < obj.list[i].y+objheight then
                if love.keyboard.isDown("n") then
                    if obj.list[i].after == nil then else
                    obj.destroy(i)
                    break
                    end
                end
                if obj.list[i].id=="craftbench" then
                    craftbench.tick(i)
                else
                    crtouch=false
                    plr.craftopen=false
                end
                if love.keyboard.isDown("space") then
                    if spcobj then
                        if obj.list[i].id=="craftbench" then
                            craftbench.toggleopen(i)
                            print("toggleopen")
                        end
                    if obj.list[i].id=="ironore" then
                    if grabbing.id=="miningpick" then
                        if keyspacepress==0 then
                            love.audio.stop(sfx.get("orehit"))
                           love.audio.play(sfx.get("orehit"))
                           item.give({id="ironore",hover=0,drag=0})
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
    end
}