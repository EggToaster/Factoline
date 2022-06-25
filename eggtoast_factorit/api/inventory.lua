local mx,my = love.mouse.getPosition()

local mouseOn = {is=false,x=1,y=1}

local selected = {is=false,x=1,y=1}
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
        local mx,my = love.mouse.getPosition()

        mouseOn.is = false
        for y=1,5 do
          for x=1,8 do
            local drawX = (x-1)*30+60
            local drawY = (y-1)*30+85
            local mouseIsOn = mx > drawX and mx <= drawX+55 and my > drawY and my <= drawY+55
            if mouseIsOn then 
              mouseOn.is = true
              mouseOn.trash =false
              mouseOn.x,mouseOn.y = x,y
            end
          end
        end
        local drawX = (9-1)*30+60
        local drawY = (5-1)*30+85
        local mouseIsOn = mx > drawX and mx <= drawX+55 and my > drawY and my <= drawY+55
        if mouseIsOn then 
          mouseOn.is = true
          mouseOn.trash =false
          mouseOn.x,mouseOn.y = 9,5
        end
        local drawX = (9-1)*30+60
        local drawY = (6-1)*30+85
        local mouseIsOn = mx > drawX and mx <= drawX+55 and my > drawY and my <= drawY+55
        if mouseIsOn then 
          mouseOn.is = true
          mouseOn.trash =true
          mouseOn.x,mouseOn.y = 9,6
        end
    end,
    draw = function ()
      if inv.open == 1 then
      gr.draw.square(50,50,320,400,"fill",0,0,0)
        for y=1,5 do
            for x=1,8 do
              local drawX = (x-1)*30+60
              local drawY = (y-1)*30+85
              local mouseOnThis = mouseOn.is and mouseOn.x == x and mouseOn.y == y
              if mouseOnThis then
                love.graphics.setColor(200,200,200)
              else
                love.graphics.setColor(170,170,170)
              end
              if selected.is and selected.x == x and selected.y == y then
                love.graphics.setColor(0,0,0)
              end
              love.graphics.rectangle("fill",drawX,drawY,25,25)
              love.graphics.setColor(1,1,1)
            end
          end
          local mouseOnThis = mouseOn.is and mouseOn.x == 9 and mouseOn.y == 4
          if mouseOnThis then
            love.graphics.setColor(200,200,200)
          else
            love.graphics.setColor(170,170,170)
          end --        {x=335,y=160}
          local drawX = (9-1)*30+60
          local drawY = (4-1)*30+85
          love.graphics.rectangle("fill",drawX,drawY,25,25)
          love.graphics.setColor(0,0,0)
          love.graphics.rectangle("line",drawX,drawY,25,25)
          love.graphics.setColor(255,255,255)
          local mouseOnThis = mouseOn.is and mouseOn.x == 9 and mouseOn.y == 4
          if mouseOnThis then
            love.graphics.setColor(200,200,200)
          else
            love.graphics.setColor(170,170,170)
          end --        {x=335,y=160}
          local drawX = (9-1)*30+60
          local drawY = (5-1)*30+85
          if selected.is and selected.x == 9 and selected.y == 5 then
          love.graphics.setColor(0,0,0)
          end
          love.graphics.rectangle("fill",drawX,drawY,25,25)
          love.graphics.setColor(1,1,1)
          for y=1,5 do
            for x=1,8 do
              local drawX = (x-1)*30+55
              local drawY = (y-1)*30+80
              local mouseOnThis = mouseOn.is and mouseOn.x == x and mouseOn.y == y
              local item = plr.inventory[(y-1)*8+x]
             -- if selected.is and selected.x == x and selected.y == y then
              --  love.graphics.setColor(1,1,1)
             --   if item==nil then else
             --   love.graphics.draw(gr.texture.gettex(plr.inventory[y*8+x+1].id),drawX,drawY,0,0.065,0.065)
              -- -- love.graphics.setColor(1,1,1)
              ----  love.graphics.draw(gr.texture.gettex(plr.inventory[x*y].id),mx+10,my+100,0.065,0.065)
             --   end
             if item.id==nil then else
              love.graphics.setColor(1,1,1)
              love.graphics.draw(gr.texture.gettex(item.id),drawX,drawY,0,0.065,0.065)
            end
            end
          end
          local drawX = (9-1)*30+55
          local drawY = (4-1)*30+80
            love.graphics.setColor(1,1,1)
            love.graphics.draw(gr.texture.gettex("trash"),drawX,drawY,0,0.065,0.065)
          local drawX = (9-1)*30+55
          local drawY = (5-1)*30+80
          local item = plr.inventory[(5-1)*8+9]
          if item.id==nil then else
            love.graphics.setColor(1,1,1)
            love.graphics.draw(gr.texture.gettex(item.id),drawX,drawY,0,0.065,0.065)
          end
          if selected.is and mouseOn.trash==false then
            local mx,my = love.mouse.getPosition()
            love.graphics.setColor(1,1,1)
            local item = plr.inventory[(selected.y-1)*8+selected.x]
            --print("[debug]".."invselectdraw "..tostring(item.id).." "..tostring((selected.y-1)*8+selected.x))
            love.graphics.draw(gr.texture.gettex(item.id),mx,my,0,0.065,0.065)
          end
          love.graphics.setColor(1,1,1)
        end
    end,
    mouseclick = function(x,y,b)
        if b == 1 then
          if mouseOn.is then
            if not selected.is then
              if mouseOn.trash then
                --plr.inventory[(selected.y-1)*8+selected.x].id = nil
              else
                if love.keyboard.isDown("l") and plr.inventory[(mouseOn.y-1)*8+mouseOn.x].id =="ironore" then
                  plr.inventory[(mouseOn.y-1)*8+mouseOn.x].id = "crafttable"
                  print("crafted crafttable")
                  goto craftedbench
                end
                if love.keyboard.isDown("delete") then
                  if plr.inventory[(mouseOn.y-1)*8+mouseOn.x]=={} then else
                    if plr.inventory[(mouseOn.y-1)*8+mouseOn.x].id==nil then else
                  item.delete(plr.inventory[(mouseOn.y-1)*8+mouseOn.x])
                  goto craftedbench
                  end
                end
              end
                if crafteruse then
                  if plr.inventory[(mouseOn.y-1)*8+mouseOn.x].id==nil then else
                  if obj.list[plr.craftopeni].nbt.inv[1].id == nil then
                    crafttableput(1,mouseOn.x,mouseOn.y)
                  else
                    if obj.list[plr.craftopeni].nbt.inv[2].id == nil then
                      crafttableput(2,mouseOn.x,mouseOn.y)
                    else
                      if obj.list[plr.craftopeni].nbt.inv[3].id == nil then
                        crafttableput(3,mouseOn.x,mouseOn.y)
                      else
                        if obj.list[plr.craftopeni].nbt.inv[4].id == nil then
                          crafttableput(4,mouseOn.x,mouseOn.y)
                        else
                          if obj.list[plr.craftopeni].nbt.inv[5].id == nil then
                            crafttableput(5,mouseOn.x,mouseOn.y)
                          else
                            if obj.list[plr.craftopeni].nbt.inv[6].id == nil then
                              crafttableput(6,mouseOn.x,mouseOn.y)
                            else
                              if obj.list[plr.craftopeni].nbt.inv[7].id == nil then
                                crafttableput(7,mouseOn.x,mouseOn.y)
                              else
                                goto nvmcraftbench
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                  goto craftedbench
                  ::nvmcraftbench::
                end
                else
                if mecharmuse then
                    if plr.inventory[(mouseOn.y-1)*8+mouseOn.x].id==nil then else
                      if obj.list[plr.craftopeni].nbt.inv.id==nil then
                        mecharm.crafttableput(mouseOn.x,mouseOn.y)
                      end
                    end
                  end
                end
              if plr.inventory[(mouseOn.y-1)*8+mouseOn.x] ~= 0 then
                selected.is = true
                selected.x = mouseOn.x
                selected.y = mouseOn.y
                if plr.inventory[(selected.y-1)*8+selected.x].id ==nil then
                  selected.is=false
                end
              end
            end
            ::craftedbench::
            else
              if mouseOn.trash then
               -- plr.inventory[(selected.y-1)*8+selected.x].id = nil
              else
              local ph = plr.inventory[(selected.y-1)*8+selected.x]
              plr.inventory[(selected.y-1)*8+selected.x] = plr.inventory[(mouseOn.y-1)*8+mouseOn.x]
              plr.inventory[(mouseOn.y-1)*8+mouseOn.x] = ph
              selected.is = false
              end
            end
          end
        end
      end
}