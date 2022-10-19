gui = {
    mouseclick = false,
    read = function (tbl)
        
    end,
    draw = function (tbl)
        gui.tempguinow = tbl
        if gui.script.isvalid(tbl) then
            if table.haskey(tbl,"text") then
                for i = 1,#tbl.text do
                    local this = tbl.text[i]
                    gui.script.setctbl(this.color)
                    local txt = this.text
                    if string.sub(txt,1,1)=="#" then
                        txt = lang.gettxt(string.sub(txt,2,string.len(txt)))
                    end
                    love.graphics.print(txt,this.pos[1],this.pos[2],0,this.size[1],this.size[2])
                end
            end
            if table.haskey(tbl,"button") then
                for i = 1,#tbl.button do
                    local this = tbl.button[i]
                    gui.script.setctbl(this.bg)
                    love.graphics.rectangle("fill",this.pos[1],this.pos[2],this.size[1],this.size[2])
                    gui.script.setctbl(this.color)
                    love.graphics.rectangle("line",this.pos[1],this.pos[2],this.size[1],this.size[2])
                    gui.script.setctbl(this.txc)
                    local txt = this.text
                    if string.sub(txt,1,1)=="#" then
                        txt = lang.gettxt(string.sub(txt,2,string.len(txt)))
                    end
                    love.graphics.print(txt,this.pos[1],this.pos[2],0,this.txs[1],this.txs[2])
                    
                end
            end
            if table.haskey(tbl,"rect") then
                for i = 1,#tbl.rect do
                    local this = tbl.rect[i]
                    gui.script.setctbl(this.bg)
                    love.graphics.rectangle("fill",this.pos[1],this.pos[2],this.size[1],this.size[2])
                    gui.script.setctbl(this.color)
                    love.graphics.rectangle("line",this.pos[1],this.pos[2],this.size[1],this.size[2])
                end
            end
            if table.haskey(tbl,"recttxt") then
                for i = 1,#tbl.recttxt do
                    local this = tbl.recttxt[i]
                    gui.script.setctbl(this.bg)
                    love.graphics.rectangle("fill",this.pos[1],this.pos[2],this.size[1],this.size[2])
                    gui.script.setctbl(this.color)
                    love.graphics.rectangle("line",this.pos[1],this.pos[2],this.size[1],this.size[2])
                    local txt = this.text
                    if string.sub(txt,1,1)=="#" then
                        txt = lang.gettxt(string.sub(txt,2,string.len(txt)))
                    end
                    love.graphics.print(txt,this.pos[1],this.pos[2],0,this.txs[1],this.txs[2])
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
        else
            error("invalid gui")
        end
    end,
    action = function (tbl)
        tbl = gui.tempguinow
        if love.mouse.isDown(1) then
            if gui.mouseclick==false then
                if tbl==nil then else
                    if table.haskey(tbl,"button") then
                for i = 1,#tbl.button do
                    local this = tbl.button[i]
                    local mx,my = love.mouse.getPosition()
                    if mx >= this.pos[1] and mx <= this.pos[1]+this.size[1] and my >= this.pos[2] and my <= this.pos[2]+this.size[2] then
                        this.action()
                    end
                end
            end
            if table.haskey(tbl,"slider") then
                for i = 1,#tbl.slider do
                    local this = tbl.slider[i]
                    local mx,my = love.mouse.getPosition()
                    if mx >= this.pos[1] and mx <= this.pos[1]+this.wid and my >= this.pos[2]+gui.script.sliderpos and my <= this.pos[2]+this.wid+gui.script.sliderpos then
                        gui.script.slideron = true
                        print("Dasdasdasdsdadsads")
                    end
                end
            end
            end
            end
            if tbl==nil then else
            if table.haskey(tbl,"slider") then
            for i = 1,#tbl.slider do
                local mx,my = love.mouse.getPosition()
                local this = tbl.slider[i]
            if gui.script.slideron == true then
                gui.script.sliderpos = my-this.pos[2]
                if gui.script.sliderpos >= this.len then
                    gui.script.sliderpos = this.len
                end
                if gui.script.sliderpos <= this.pos[2] then
                    gui.script.sliderpos = 0
                end
            end
        end
        end
    end
            gui.mouseclick=true
        else
            gui.script.slideron = false
            gui.mouseclick=false
        end
    end,
    testrender = function ()
        gui.draw(gui.testgui)
    end,
    testgui = {
        text = {
            {color={0,0,0},text="THIS IS TEST MESSAGE!!!!!",pos={0,0},size={2.5,2.5}}
        },
        button = {
            {color={0,0,0},bg={1,1,1},text="TESTBTN",pos={100,100},size={50,50},txc={0,0,0},txs={1,1},action=function ()
                print("hello world")
                stng=false
            end}
        }
    },
    elementlist ={
        "text",
        "button"
    },
    script = {
        setctbl = function (tbl)
            local alpha = tbl[4] or 255
            love.graphics.setColor(tbl[1],tbl[2],tbl[3],alpha)
        end,
        isvalid = function (tbl)
            local tried = {}
            table.insert(tried,gui.script.validelemlist(tbl))
            table.insert(tried,gui.script.validtbl(tbl))
            if table.alltrue(tried) then
                return true
            end
            return false
        end,
        validelemlist = function (tbl)
            return true
        end,
        validtbl = function (tbl)
            if isTable(tbl) then
                return true
            end
            return false
        end,
        resetslider = function (tbl)
            gui.script.sliderpos = 0
        end,
        sliderpos = 0,
        slideron = false
    },
    tempguinow = nil
}