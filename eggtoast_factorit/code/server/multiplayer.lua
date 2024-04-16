---@diagnostic disable: undefined-field, undefined-global
mulplay = {}
playerid="Toshikawa"
require("api.multiserver")
function mulplay.join(ip)
    local host = enet.host_create()
    local server = host:connect(ip)
    local event = host:service(100)
end
function mulplay.tick()
    local event = host:service(100)
    
    while event do
        if event.type == "receive" then
            print("Got message: ", event.data, event.peer)
            event.peer:send(json.encode({type="ping",data=nil}))
            evendata = json.decode(event.data)
            if evendata.type=="savegameload" then
                plr.inventory = evendata.data.plrinv
                obj.list = evendata.data.obl
                plr.handrot=0
                plr.craftopen=false
                plr.rot="right"
                plr.hotselect=1
                plr.plr.grabbing={id=nil}
            end
        elseif event.type == "connect" then
            print(event.peer, "connected.")
            event.peer:send(json.encode({type="loginid",data=playerid}))
        elseif event.type == "disconnect" then
            print(event.peer, "disconnected.")
        end
    event = host:service()
    end
end