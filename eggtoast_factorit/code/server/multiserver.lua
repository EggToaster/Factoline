---@diagnostic disable: undefined-field, undefined-global
mulplay = {
  serverrun = function (save)
    mulplay.host = enet.host_create("localhost:6789")
    info = love.filesystem.getInfo("savegame/"..save..".fsg")
    if info==nil then
      plr.lst = {}
      obj.list = {}
      obj.genworld()
    else
      toload = json.decode(love.filesystem.load("savegame/server.fsg"))
      obj.list=toload.obj
      plr.lst = (toload.plr.lst == nil and {} or toload.plr.list)
    end
    local threadCode = [[
    while true do
        mulplay.thread()
    end
    ]]
    mulplay.threadd = love.thread.newThread( threadCode )
    mulplay.threadd:start( 99, 1000 )
  end,
  host = nil,
  plrlist = {},
  threadd = nil,
  kill = function ()
    mulplay.threadd:kill()  
  end,
  thread = function ()
    local event = mulplay.host:service(100)
    while event do
      if event.type == "receive" then
        print("[MULTIPLAYER]Got message: ", event.data, event.peer)
        event.peer:send(json.encode({type="ping",data=nil}))
      elseif event.type == "connect" then
        print(event.peer, "connected.")
        event.peer:send(json.encode({type="ping",data=nil}))
        plrid = plrid + 4
        while event do
          evendata = json.decode(event.data)
            if event.type == "receive" and evendata.type == "loginid" then
                table.insert(mulplay.plrlist,event.data.data)
            end
        end
        local event = mulplay.host:service(100)
        plt ={
          handrot=0,
          craftopen=false,
          rot="right",
          hotselect=1
        }
        event.peer:send(json.encode({type="savegameload",data={obl=obj.list,plrinv=plr.inventory[table.indexof(plr.lst,plrid)],plrstuff=plt}}))
      elseif event.type == "disconnect" then
        print(event.peer, "disconnected.")
      end
      event = mulplay.host:service()
    end
  end
}