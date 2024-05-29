gui = { --TODO: rewrite entire code here as it sucks
    action = function(x,y,b)
        local tbl = gui.tmpgui or nil
        if nullcheck(tbl) then
            for _, tbl in pairs(tbl) do
                local mx, my = mouse.getPos()
                local neon = function(a,b)
                    if nullcheck(tbl[a]) then
                        tbl[b] = tbl[a]
                    end
                end
                local neo = function(a)
                    if type(a) == "function" then
                        return {"f",a}
                    elseif type(a) ~= "table" then
                        return {"dummy",a}
                    end
                    return a
                end
                neon("position","p");neon("pos","p");neon("size","s")
                neon("action","a")
                local x,y,sx,sy = tbl.p[1],tbl.p[2],tbl.s[1],tbl.s[2]
                x, y, sx, sy = neo(x), neo(y), neo(sx), neo(sy)
                x, y, sx, sy = gui.script.func[x[1]](x[2]), gui.script.func[y[1]](y[2]), gui.script.func[sx[1]](sx[2]), gui.script.func[sy[1]](sy[2])
                if nullcheck(tbl.a) and boxcol(x,y,sx,sy,mx,my) then
                    tbl.a()
                end
            end
            if nullcheck(tbl) then
                if mouse.ison(1) then
                    if table.haskey(tbl,"slider") then
                        for i = 1,#tbl.slider do
                            local mx,my = mouse.getPos()
                            local this = tbl.slider[i]
                            if gui.script.slideron == true then
                                gui.script.sliderpos = my-this.pos[2]-gui.script.slideroffset

                                if gui.script.sliderpos > this.len then
                                    gui.script.sliderpos = this.len
                                end
                                if gui.script.sliderpos < 0 then
                                    gui.script.sliderpos = 0
                                end
                            end
                        end
                    end
                else
                gui.script.slideron = false
                end
            end
        end
    end,
    tick = function()
    end,
    draw = function(this)
        local tbl = this
        if nullcheck(this) then
            gui.tmpgui = this
            for _, this in pairs(this) do
                local neo = function(a)
                    if type(a) == "function" then
                        return {"f",a}
                    elseif type(a) ~= "table" then
                        return {"dummy",a}
                    end
                    return a
                end
                local neon = function(a,b)
                    if nullcheck(this[a]) then
                        this[b] = this[a]
                    end
                end
                local ne = function(a,b)
                    if not nullcheck(this[a]) then
                        this[a] = b
                    end
                end
                local n = function(a,b)
                    if nullcheck(a) then
                        return a
                    end
                    return b
                end
                local setc = gui.script.setctbl
                neon("pos","p");neon("size","s");neon("position","p")
                neon("text","t");neon("render","r")
                neon("border","b");neon("background","bg")
                neon("slide","sl");neon("stencil","st")
                if #this.b ~= 5 then
                    if nullcheck(this.b[4]) then
                        this.b[5] = this.b[4]
                    else
                        --this.b[5] = 
                    end
                end
                ne("sl",nil);ne("st",nil);
                local x, y = this.p[1], this.p[2]
                local sx, sy = this.s[1], this.s[2]
                local t = this.t
                x, y, sx, sy = neo(x), neo(y), neo(sx), neo(sy)
                x, y, sx, sy = gui.script.func[x[1]](x[2]), gui.script.func[y[1]](y[2]), gui.script.func[sx[1]](sx[2]), gui.script.func[sy[1]](sy[2])
                if nullcheck(this.bg) then
                    setc(this.bg)
                    love.graphics.rectangle("fill",x,y,sx,sy)
                end
                if nullcheck(this.b) then
                    love.graphics.setColor(this.b[2],this.b[3],this.b[4],n(this.b[5],1))
                    if this.b[1] == 1 then
                        love.graphics.rectangle("line",x,y,sx,sy)
                    else
                        local i = this.b[1]
                        love.graphics.rectangle("fill",x,y,i,sy)--left
                        love.graphics.rectangle("fill",x+i,y,sx-i,i)--top
                        love.graphics.rectangle("fill",x+i,y+sy-i,sx-i,i)--bottom
                        love.graphics.rectangle("fill",x+sx-i,y+i,i,sy-i-i)--right
                    end
                end
                if nullcheck(this.r) then
                    this.r()
                end
                if nullcheck(t) then
                    t.t = n(t.text,t.t)
                    t.c = n(t.color,t.c)
                    t.s = n(t.size,t.s)
                    gui.script.setctbl(t.c)
                    if string.sub(t.t,1,1) == "#" then
                        t.t = lang.gettxt(string.sub(t.t,2,string.len(t.t)))
                    end
                    love.graphics.print(t.t,x+t.p[1],y+t.p[2],0,t.s[1],t.s[2])
                end
            end
            love.graphics.setColor(1,1,1)
        end
        if table.haskey(this,"slider") then
            for i = 1,#tbl.slider do
                local this = tbl.slider[i]
                local quartcircle = math.pi
                gui.script.setctbl(this.bg)
                love.graphics.arc( "fill", "open", this.pos[1]+(this.wid/2), this.pos[2], 12, 0, -quartcircle )
                love.graphics.arc( "fill", "open", this.pos[1]+(this.wid/2), this.pos[2]+this.len,12,0,quartcircle)
                love.graphics.rectangle("fill",this.pos[1], this.pos[2], this.wid,this.len)
                gui.script.setctbl(this.color)
                love.graphics.line( this.pos[1], this.pos[2], this.pos[1],this.pos[2]+this.len)
                love.graphics.line( this.pos[1]+this.wid, this.pos[2], this.pos[1]+this.wid,this.pos[2]+this.len)
                love.graphics.arc( "line", "open", this.pos[1]+(this.wid/2), this.pos[2], 12, 0, -quartcircle )
                love.graphics.arc( "line", "open", this.pos[1]+(this.wid/2), this.pos[2]+this.len,12,0,quartcircle)
                --sliderposition
                gui.script.setctbl(this.pbg)
                love.graphics.circle("fill",this.pos[1]+(this.wid/2),this.pos[2]+gui.script.sliderpos,this.wid)
                gui.script.setctbl(this.pc)
                love.graphics.circle("line",this.pos[1]+(this.wid/2),this.pos[2]+gui.script.sliderpos,this.wid)
            end
        end
    end,
    script = {
        setctbl = function (tbl)
            local alpha = tbl[4] or 255
            love.graphics.setColor(tbl[1],tbl[2],tbl[3],alpha)
        end,
        sliderpos = 0,
        slideron = false,
        slideroffset=0,
        func = {
            dx = function ()
                local dx,dy = love.graphics.getDimensions()
                return dx
            end,
            dy = function ()
                local dx,dy = love.graphics.getDimensions()
                return dy
            end,
            dummy = function(a) return a; end,
            centerdx = function(a)
                local dx,dy = love.graphics.getDimensions()
                return dx/2+a
            end,
            centerdy = function(a)
                local dx,dy = love.graphics.getDimensions()
                return dy/2+a
            end,
            f = function(fu)
                return fu()
            end
        }
    }
}