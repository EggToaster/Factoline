gui = { --TODO: rewrite entire code here as it sucks
    mouseclick = false,
    read = function (tbl)
        
    end,
    draw = function (tbl)
        gui.tempguinow = tbl
        if table.haskey(tbl,"button") then
            for i = 1,#tbl.button do
                local this = tbl.button[i]
                local ofs={0,0,0,0}
                local stenreset = false
                if table.eachContain(tbl.stencil.stenciltag,this.tag) then
                    stenreset = true
                    gui.script.stencilTag=table.indexOfEach(tbl.stencil.stenciltag,this.tag)
                    love.graphics.stencil(tbl.stencil.try,"replace",1)
                    love.graphics.setStencilTest("greater", 0)
                end
                if this.slide then
                    ofs[2] = -1*gui.script.sliderpos
                end
                local tmp = {this.pos[1],this.pos[2],this.size[1],this.size[2]}
                for ii = 1,4 do
                    if type(tmp[ii]) == "number" then
                        tmp[ii] =  {"dummy",tmp[ii]}
                    end
                end 
                gui.script.setctbl(this.bg)
                love.graphics.rectangle("fill", gui.script.func[tmp[1][1]](tmp[1][2]) + ofs[1], gui.script.func[tmp[2][1]](tmp[2][2]) + ofs[2], gui.script.func[tmp[3][1]](tmp[3][2]) +ofs[3], gui.script.func[tmp[4][1]](tmp[4][2]) +ofs[4])
                gui.script.setctbl(this.color)
                love.graphics.rectangle("line",gui.script.func[tmp[1][1]](tmp[1][2])+ofs[1],gui.script.func[tmp[2][1]](tmp[2][2])+ofs[2],gui.script.func[tmp[3][1]](tmp[3][2])+ofs[3],gui.script.func[tmp[4][1]](tmp[4][2])+ofs[4])
                gui.script.setctbl(this.txc)
                local txt = this.text
                if type(txt)=="function" then
                    txt = txt()
                end
                    if string.sub(txt,1,1)=="#" then
                        txt = lang.gettxt(string.sub(txt,2,string.len(txt)))
                        love.graphics.print(txt,this.pos[1]+ofs[1],this.pos[2]+ofs[2]-5,0,this.txs[1]+ofs[3],this.txs[2]+ofs[4])
                    else
                    if string.sub(txt,1,1)=="?" then
                        love.graphics.draw(texture.gettex(string.sub(txt,2,string.len(txt))),this.pos[1]+ofs[1],this.pos[2]+ofs[2],0,this.txs[1]+ofs[3],this.txs[2]+ofs[4])
                    else
                        love.graphics.print(txt,this.pos[1]+ofs[1],this.pos[2]+ofs[2]-10,0,this.size[1]+ofs[3],this.txs[2]+ofs[4])
                    end
                end
                if stenreset then
                    love.graphics.setStencilTest()
                end
            end
        end
        if table.haskey(tbl,"rect") then
            for i = 1,#tbl.rect do
                local object = tbl.rect[i]
                local ofs={0,0,0,0}
                local stenreset = false
                if table.eachContain(tbl.stencil.stenciltag,object.tag) then
                    stenreset = true
                    gui.script.stencilTag=table.indexOfEach(tbl.stencil.stenciltag,object.tag)
                    love.graphics.stencil(tbl.stencil.try,"replace",1)
                    love.graphics.setStencilTest("greater", 0)
                end
                if object.slide then
                    ofs[2] = -1*gui.script.sliderpos
                end
                local tmp = {object.pos[1],object.pos[2],object.size[1],object.size[2]}
                for ii = 1,4 do
                    if type(tmp[ii]) == "number" then
                        tmp[ii] =  {"dummy",tmp[ii]}
                    end
                end 
                gui.script.setctbl(object.bg)
                love.graphics.rectangle("fill", gui.script.func[tmp[1][1]](tmp[1][2]) + ofs[1], gui.script.func[tmp[2][1]](tmp[2][2]) + ofs[2], gui.script.func[tmp[3][1]](tmp[3][2]) +ofs[3], gui.script.func[tmp[4][1]](tmp[4][2]) +ofs[4])
                gui.script.setctbl(object.color)
                love.graphics.rectangle("line",gui.script.func[tmp[1][1]](tmp[1][2])+ofs[1],gui.script.func[tmp[2][1]](tmp[2][2])+ofs[2],gui.script.func[tmp[3][1]](tmp[3][2])+ofs[3],gui.script.func[tmp[4][1]](tmp[4][2])+ofs[4])
                if stenreset then
                    love.graphics.setStencilTest()
                end
            end
        end
        if table.haskey(tbl,"recttxt") then
            for i = 1,#tbl.recttxt do
                local this = tbl.recttxt[i]
                local object=this
                local ofs={0,0,0,0}
                local stenreset = false
                if table.eachContain(tbl.stencil.stenciltag,this.tag) then
                    stenreset = true
                    gui.script.stencilTag=table.indexOfEach(tbl.stencil.stenciltag,this.tag)
                    love.graphics.stencil(tbl.stencil.try,"replace",1)
                    love.graphics.setStencilTest("greater", 0)
                end
                if this.slide then
                    ofs[2] = -1*gui.script.sliderpos
                end
                local tmp = {object.pos[1],object.pos[2],object.size[1],object.size[2]}
                for ii = 1,4 do
                    if type(tmp[ii]) == "number" then
                        tmp[ii] =  {"dummy",tmp[ii]}
                    end
                end 
                gui.script.setctbl(object.bg)
                love.graphics.rectangle("fill", gui.script.func[tmp[1][1]](tmp[1][2]) + ofs[1], gui.script.func[tmp[2][1]](tmp[2][2]) + ofs[2], gui.script.func[tmp[3][1]](tmp[3][2]) +ofs[3], gui.script.func[tmp[4][1]](tmp[4][2]) +ofs[4])
                gui.script.setctbl(object.color)
                love.graphics.rectangle("line",gui.script.func[tmp[1][1]](tmp[1][2])+ofs[1],gui.script.func[tmp[2][1]](tmp[2][2])+ofs[2],gui.script.func[tmp[3][1]](tmp[3][2])+ofs[3],gui.script.func[tmp[4][1]](tmp[4][2])+ofs[4])
                local txt = this.text
                if type(txt)=="function" then
                    if string.sub(txt(),1,1) == "?" then
                        print(string.sub(txt(),2,string.len(txt())))
                        love.graphics.draw(texture.gettex(string.sub(txt(),2,string.len(txt()))),gui.script.func[tmp[1][1]](tmp[1][2])+ofs[1],gui.script.func[tmp[2][1]](tmp[2][2])+ofs[2],gui.script.func[tmp[3][1]](tmp[3][2])+ofs[3],gui.script.func[tmp[4][1]](tmp[4][2])+ofs[4])
                    else
                        love.graphics.print(txt(),gui.script.func[tmp[1][1]](tmp[1][2])+ofs[1],gui.script.func[tmp[2][1]](tmp[2][2])+ofs[2],gui.script.func[tmp[3][1]](tmp[3][2])+ofs[3],gui.script.func[tmp[4][1]](tmp[4][2])+ofs[4])
                    end
                else
                    if string.sub(txt,1,1)=="#" then
                        txt = lang.gettxt(string.sub(txt,2,string.len(txt)))
                    end
                    if string.sub(txt,1,1)=="?" then
                        love.graphics.draw(texture.gettex(string.sub(txt,2,string.len(txt))),gui.script.func[tmp[1][1]](tmp[1][2])+ofs[1],gui.script.func[tmp[2][1]](tmp[2][2])+ofs[2],gui.script.func[tmp[3][1]](tmp[3][2])+ofs[3],gui.script.func[tmp[4][1]](tmp[4][2])+ofs[4])
                    else
                        love.graphics.print(txt,gui.script.func[tmp[1][1]](tmp[1][2])+ofs[1],gui.script.func[tmp[2][1]](tmp[2][2])+ofs[2],gui.script.func[tmp[3][1]](tmp[3][2])+ofs[3],gui.script.func[tmp[4][1]](tmp[4][2])+ofs[4])
                    end
                end
                if stenreset then
                    love.graphics.setStencilTest()
                end
            end
        end
        if table.haskey(tbl,"text") then
            for i = 1,#tbl.text do
                local this = tbl.text[i]
                local ofs={0,0,0,0}
                local stenreset = false
                if table.eachContain(tbl.stencil.stenciltag,this.tag) then
                    stenreset = true
                    gui.script.stencilTag=table.indexOfEach(tbl.stencil.stenciltag,this.tag)
                    love.graphics.stencil(tbl.stencil.try,"replace",1)
                    love.graphics.setStencilTest("greater", 0)
                end
                if this.slide then
                    ofs[2] = -1*gui.script.sliderpos
                end
                local tmp = {this.pos[1],this.pos[2],this.size[1],this.size[2]}
                for ii = 1,4 do
                    if type(tmp[ii]) == "number" then
                        tmp[ii] =  {"dummy",tmp[ii]}
                    end
                end 
                gui.script.setctbl(this.color)
                local txt = this.text
                if type(txt)=="function" then
                    if string.sub(txt(),1,1) == "?" then
                        love.graphics.draw(texture.gettex(string.sub(txt(),2,string.len(txt()))),gui.script.func[tmp[1][1]](tmp[1][2])+ofs[1],gui.script.func[tmp[2][1]](tmp[2][2])+ofs[2],0,gui.script.func[tmp[3][1]](tmp[3][2])+ofs[3],gui.script.func[tmp[4][1]](tmp[4][2])+ofs[4])
                    else
                        love.graphics.print(txt(),gui.script.func[tmp[1][1]](tmp[1][2])+ofs[1],gui.script.func[tmp[2][1]](tmp[2][2])+ofs[2],0,gui.script.func[tmp[3][1]](tmp[3][2])+ofs[3],0,gui.script.func[tmp[4][1]](tmp[4][2])+ofs[4])
                    end
                else
                    if string.sub(txt,1,1)=="#" then
                        txt = lang.gettxt(string.sub(txt,2,string.len(txt)))
                    end
                    if string.sub(txt,1,1)=="?" then
                        love.graphics.draw(texture.gettex(string.sub(txt,2,string.len(txt))),gui.script.func[tmp[1][1]](tmp[1][2])+ofs[1],gui.script.func[tmp[2][1]](tmp[2][2])+ofs[2],0,gui.script.func[tmp[3][1]](tmp[3][2])+ofs[3],gui.script.func[tmp[4][1]](tmp[4][2])+ofs[4])
                    else
                        love.graphics.print(txt, gui.script.func[tmp[1][1]](tmp[1][2])+ofs[1], gui.script.func[tmp[2][1]](tmp[2][2])+ofs[2], 0, gui.script.func[tmp[3][1]](tmp[3][2])+ofs[3],gui.script.func[tmp[4][1]](tmp[4][2])+ofs[4])
                    end
                end
                if stenreset then
                    love.graphics.setStencilTest()
                end
            end
        end
        if table.haskey(tbl,"slider") then
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
    action = function (tbl)
        tbl = gui.tempguinow
        if tbl==nil then else
        if mouse.ison(1) then
            if gui.mouseclick==false then
                    if table.haskey(tbl,"button") then
                        for i = 1,#tbl.button do
                            local this = tbl.button[i]
                            local mx,my = mouse.getPos()
                            local hitbox = ((this.hitbox~=nil)and this.hitbox or {this.pos[1],this.pos[2],this.size[1],this.size[2]})
                            if mx >= hitbox[1] and mx <= hitbox[1]+hitbox[3] and my >= hitbox[2] and my <= hitbox[2]+hitbox[4] then
                                this.action()
                            end
                        end
                    end
                    if table.haskey(tbl,"slider") then
                        for i = 1,#tbl.slider do
                            local this = tbl.slider[i]
                            local mx,my = mouse.getPos()
                            if mx >= this.pos[1]-10 and mx <= this.pos[1]+this.wid+10 and my >= this.pos[2]+gui.script.sliderpos-25 and my <= this.pos[2]+this.wid+gui.script.sliderpos then
                                gui.script.slideron = true
                                gui.script.slideroffset = my-(this.pos[2]+gui.script.sliderpos)
                            end
                        end
                    end
                end
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
        gui.mouseclick=true
        else
        gui.script.slideron = false
        gui.mouseclick=false
        end
    end
    end,
    elementlist ={
        "text",
        "button",
        "rect",
        "recttxt",
        "slider"
    },
    script = {
        setctbl = function (tbl)
            local alpha = tbl[4] or 255
            love.graphics.setColor(tbl[1],tbl[2],tbl[3],alpha)
        end,
        stencilTag="",
        resetSlider = function ()
            gui.script.sliderpos = 0
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
            end
        }
    },
    tempguinow = nil
}