gr = {
    dr = 1,
    dg = 1,
    db = 1,
    draw = {
        square = function (x,y,sx,sy,mode,cr,cg,cb)
            cr = cr or gr.dr
            cg = cg or gr.dg
            cb = cb or gr.db
            mode = mode or "fill"
            local r,g,b,a = love.graphics.getColor()
            love.graphics.setColor(cr,cg,cb)
            love.graphics.rectangle("fill", x,y,sx,sy)
            love.graphics.setColor(r,g,b,a)
        end,
        txt = function (txt,x,y,sx,sy,cr,cg,cb,r,ox,oy)
            cr = cr or gr.dr
            cg = cg or gr.dg
            cb = cb or gr.db
            ox = ox or 0
            oy = oy or 0
            r = r or 0
            local r,g,b,a = love.graphics.getColor()
            love.graphics.setColor(cr,cg,cb)
            love.graphics.print(txt,x,y,r,sx,sy,ox,oy)
            love.graphics.setColor(r,g,b,a)
        end,
        any = function (obj,x,y,sx,sy,rad,ox,oy,kx,ky)
            rad = rad or 0
            sx = sx or 1
            sy = sy or 1
            ox = ox or 0
            oy = oy or 0
            kx = kx or 0
            ky = ky or 0
            local r,g,b,a = love.graphics.getColor()
            love.graphics.setColor(0,0,0)
            love.graphics.draw(obj,x,y,rad,sx,sy,ox,oy,kx,ky)
            love.graphics.setColor(r,g,b,a)
        end,
        box = function (x,y,sx,sy,cx,cy,cz,bx,by,bz)
            cx = cx or 0
            cy = cy or 0
            cz = cz or 0
            bx = bx or 1
            by = by or 1
            bz = bz or 1
            local r,g,b,a = love.graphics.getColor()
            love.graphics.setColor(cx,cy,cz)
            love.graphics.rectangle("fill",x,y,sx,sy)
            love.graphics.setColor(bx,by,bz)
            love.graphics.rectangle("line",x,y,sx,sy)
            love.graphics.setColor(r,g,b,a)
        end
    },
    texture={
        gettex = function (texstrg)
            return(gr.texture.texture[indexOf(gr.texture.texture2,texstrg..".png")])
        end,
        texture={},
        load = function ()
            gr.texture.texture2 = love.filesystem.getDirectoryItems("/res/")
        end,
        parse = function ()
            for i=1,#gr.texture.texture2 do
                table.insert(gr.texture.texture,love.graphics.newImage("/res/"..gr.texture.texture2[i]))
            end
        end
    }
}