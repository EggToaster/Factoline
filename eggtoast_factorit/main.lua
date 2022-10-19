state, percent = love.system.getPowerInfo( )
require("api.mathutil")
ltbtrnotice=true
if state == "unknown" or state == "nobattery" then
    print("laptop battery warn unavailable")
    ltbtrnotice=false
end
function table.contains(table, element)
    for _, value in pairs(table) do
      if value == element then
        return true
      end
    end
    return false
  end
discordRPC = require("api.discordRPC")


appId = "940840855957291018"
function love.load()
    lume = require("lume")
lurker = require("lurker")
    ftd=false
---@diagnostic disable-next-line: discard-returns
math.randomseed(os.time());math.random();math.random();math.random()
    mapx=50000
    mapy=50000
    dbg="a"
    require("api.donut")
    require("loadapi")
    debug = Donut.init(10, 10)
    ---@diagnostic disable-next-line: undefined-field
    fps = debug.add("FPS")
    ---@diagnostic disable-next-line: undefined-field
	random = debug.add("DebugValue")
    singleplayerstr="Singleplayer"
---@diagnostic disable-next-line: undefined-field
    xdebug=debug.add("X")
    ---@diagnostic disable-next-line: undefined-field
    ydebug=debug.add("Y")
    ---@diagnostic disable-next-line: undefined-field
    invdbg=debug.add("inv first 5")
    loading=1
    title=true
    fulltogg=true
---@diagnostic disable-next-line: missing-parameter
    titleimg = love.graphics.newImage("res/factoryicn.png")
    crtkeypress=true
    discordRPC.initialize(appId, true)
    gameversionstr = "Alpha 7 EXPERIMENT"
    detl = "detail will added soon..."
    presencetitle = {
        state = "In Titlescreen",
        details = "Waiting for game to start",
        largeImageKey = "500icon",
        largeImageText= gameversionstr,
        smallImageKey = "titlescreen",
        smallImageText = "cannot load detail"
    }
    presencegame = {
        state = "Playing Game",
        details = singleplayerstr,
        largeImageKey = "500icon",
        largeImageText= gameversionstr,
        smallImageKey = detl
    }

    nextPresenceUpdate = 0
    loadergame()
    require("sys")
end
function discordRPC.ready(userId, username, discriminator, avatar)
    print(string.format("Discord: ready (%s, %s, %s, %s)", userId, username, discriminator, avatar))
end
function discordRPC.disconnected(errorCode, message)
    print(string.format("Discord: disconnected (%d: %s)", errorCode, message))
end

function discordRPC.errored(errorCode, message)
    print(string.format("Discord: error (%d: %s)", errorCode, message))
end

function discordRPC.joinGame(joinSecret)
    print(string.format("Discord: join (%s)", joinSecret))
end

function discordRPC.spectateGame(spectateSecret)
    print(string.format("Discord: spectate (%s)", spectateSecret))
end

function discordRPC.joinRequest(userId, username, discriminator, avatar)
    print(string.format("Discord: join request (%s, %s, %s, %s)", userId, username, discriminator, avatar))
    discordRPC.respond(userId, "yes")
end
function wait(seconds)
    local start = os.time()
    repeat until os.time() > start + seconds
end
function indexOf(array, value)
    for i, v in ipairs(array) do
        if v == value then
            return i
        end
    end
    return nil
end
function love.quit()
    discordRPC.shutdown()
end