gr = {
    dr = 255,
    dg = 255,
    db = 255,
    draw = {
        square = function (x,y,sx,sy,mode,cr,cg,cb)
            cr = cr or gr.dr
            cg = cg or gr.dg
            cb = cb or gr.db
            mode = mode or "fill"
            love.graphics.setColor(cr,cg,cb)
            love.graphics.rectangle("fill", x,y,sx,sy)
            love.graphics.setColor(255,255,255)
        end,
        txt = function (txt,x,y,sx,sy,cr,cg,cb,r,ox,oy)
            cr = cr or gr.dr
            cg = cg or gr.dg
            cb = cb or gr.db
            ox = ox or 0
            oy = oy or 0
            r = r or 0
            love.graphics.setColor(cr,cg,cb)
            love.graphics.print(txt,x,y,r,sx,sy,ox,oy)
        end,
        any = function (obj,x,y,sx,sy,r,ox,oy,kx,ky)
            r = r or 0
            sx = sx or 1
            sy = sy or 1
            ox = ox or 0
            oy = oy or 0
            kx = kx or 0
            ky = ky or 0
            love.graphics.setColor(0,0,0)
            love.graphics.draw(obj,x,y,r,sx,sy,ox,oy,kx,ky)
        end
    },
    texture={
        gettex = function (texstr)
            return(gr.texture.texture[indexOf(gr.texture.texture2,texstr..".png")])
        end,
        texture={},
        load = function ()
            gr.texture.texture2 = love.filesystem.getDirectoryItems("/res/")
        end,
        parse = function ()
            for i=1,#gr.texture.texture2 do
                loadphase2="/res/"..gr.texture.texture2[i]
                table.insert(gr.texture.texture,love.graphics.newImage("/res/"..gr.texture.texture2[i]))
                loadgraphics()
            end
        end
    }
}