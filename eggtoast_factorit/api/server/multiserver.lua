---@diagnostic disable: undefined-field
function mulplay.serverrun()
local host = nil--enet.host_create("localhost:6789")
info = love.filesystem.getInfo("savegame/server.fsg")
if info==nil then
--plr.x={mapx/2}
--plr.y={mapx/2}
plr.handrot=0
plr.craftopen=false
plr.rot="right"
plr.lst={"Toshikawa"}
plr.inventory={{{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id="miningpick"},{id="crafttable"},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id="trash"}},{{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id="miningpick"},{id="crafttable"},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id=nil},{id="trash"}}}
plr.hotselect=1
obj.list={}
title=false
obj.genworld()
grabbing={id=nil}
else
toload = json.decode(love.filesystem.load("savegame/server.fsg"))
obj.list=toload.obj
plr.inventory = toload.plr.inv
plr.lst = toload.plr.lst
plr.maxid =toload.plr.maxid
plr.x = toload.plr.posx
plr.y = toload.plr.posy
plrid=plr.maxid
end
plrlist={}
while true do
  local event = host:service(100)
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
              table.insert(plrlist,event.data.data)
          end
      end
      local event = host:service(100)
      plt ={
        handrot=0,
        craftopen=false,
        rot="right",
        hotselect=1
      }
      event.peer:send(json.encode({type="savegameload",data={obl=obj.list,plrinv=plr.inventory[indexOf(plr.lst,plrid)],plrstuff=plt}}))
    elseif event.type == "disconnect" then
      print(event.peer, "disconnected.")
    end
    event = host:service()
  end
end
end