grabbing={id=nil}
plr={
    x=mapx/2,
    y=mapy/2,
    handrot=0,
    craftopen=false,
    rot="right",
    inventory={},
    hotselect=1,
    itemsys = function ()
        grabbing=plr.inventory[plr.hotselect+32]
        if #plr.inventory < 42 then
                table.insert(plr.inventory,{id=nil,hover=0,drag=0})
        end
        if love.keyboard.isDown("space") then
            if grabbing.id =="crafttable" then
                obj.gen.make("craftbench",plr.x,plr.y,"crafttable",{craftopen=false})
                plr.inventory[plr.hotselect+32]={id=nil,hover=0,drag=0}
            end
        end
    end,
    itemdraw = function ()
        if grabbing.id ==nil then
        else
        if grabbing.id=="miningpick" then
        if plr.handrot==1 then
            if plr.rot=="left"then
                love.graphics.draw(gr.texture.gettex(grabbing.id.."ud"),plr.x+4,plr.y+21,0,0.1,0.1)
                else
                love.graphics.draw(gr.texture.gettex(grabbing.id.."reverseud"),plr.x-4,plr.y+21,0,0.1,0.1)
                end
            else
                if plr.rot=="left"then
                    love.graphics.draw(gr.texture.gettex(grabbing.id),plr.x+20,plr.y+21,0,0.1,0.1)
                    else
                    love.graphics.draw(gr.texture.gettex(grabbing.id.."reverse"),plr.x-21,plr.y+22,0,0.1,0.1)
                    end
            end
        else
            if plr.rot=="left"then
                love.graphics.draw(gr.texture.gettex(grabbing.id),plr.x+20,plr.y+21,0,0.1,0.1)
                else
                love.graphics.draw(gr.texture.gettex(grabbing.id),plr.x-21,plr.y+22,0,0.1,0.1)
                end
        end
    end
end
}