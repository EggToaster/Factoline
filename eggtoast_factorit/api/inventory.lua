local mouseOn = {is=false,x=1,y=1}

local selected = {is=false,x=1,y=1}
inv = {
    open=0,    
    sys = function ()
        local mx,my = mouse.getPos()
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
        love.graphics.setColor(0,0,0)
        love.graphics.rectangle("fill",50,50,320,400)
        love.graphics.setColor(1,1,1)
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
          end
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
          end
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
             if item.id==nil then else
              love.graphics.setColor(1,1,1)
              love.graphics.draw(texture.gettex(item.id),drawX,drawY,0,0.065,0.065)
            end
            end
          end
          local drawX = (9-1)*30+55
          local drawY = (5-1)*30+80
          local item = plr.inventory[(5-1)*8+9]
          if item.id==nil then else
            love.graphics.setColor(1,1,1)
            love.graphics.draw(texture.gettex(item.id),drawX,drawY,0,0.065,0.065)
          end
          if selected.is and mouseOn.trash==false then
            local mx,my = mouse.getPos()
            love.graphics.setColor(1,1,1)
            local item = plr.inventory[(selected.y-1)*8+selected.x]
            love.graphics.draw(texture.gettex(item.id),mx,my,0,0.065,0.065)
          end
          love.graphics.setColor(1,1,1)
        end
    end,
    mouseclick = function(x,y,b)
        if b == 1 then
          if mouseOn.is then
            if not selected.is then
              if mouseOn.trash then
              else
                if crafteruse then
                  if not (plr.inventory[(mouseOn.y-1)*8+mouseOn.x].id==nil) then
                        _G[string.gsub(obj.list[plr.craftopeni].id,"plcd","")].put(i,mouseOn.x,mouseOn.y,plr.craftopeni)
                        goto inventorymouseclickend
                    end
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
            else
              if mouseOn.trash then
              else
              local ph = plr.inventory[(selected.y-1)*8+selected.x]
              plr.inventory[(selected.y-1)*8+selected.x] = plr.inventory[(mouseOn.y-1)*8+mouseOn.x]
              plr.inventory[(mouseOn.y-1)*8+mouseOn.x] = ph
              selected.is = false
              end
            end
          end
        end
        ::inventorymouseclickend::
      end
}