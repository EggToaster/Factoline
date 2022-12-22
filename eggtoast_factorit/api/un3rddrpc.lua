dsc = {
    load = function ()
        if not device.console then
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
                details = "Singleplayer",
                largeImageKey = "500icon",
                largeImageText= gameversionstr,
                smallImageKey = detl
            }
        
            nextPresenceUpdate = 0
            discordRPC.ready = function (userId, username, discriminator, avatar)
                print(string.format("Discord: ready (%s, %s, %s, %s)", userId, username, discriminator, avatar))
            end
            discordRPC.disconnected = function(errorCode, message)
                print(string.format("Discord: disconnected (%d: %s)", errorCode, message))
            end
            
            discordRPC.errored = function(errorCode, message)
                print(string.format("Discord: error (%d: %s)", errorCode, message))
            end
            
            discordRPC.joinGame = function(joinSecret)
                print(string.format("Discord: join (%s)", joinSecret))
            end
            
            discordRPC.spectateGame = function(spectateSecret)
                print(string.format("Discord: spectate (%s)", spectateSecret))
            end
            
            discordRPC.joinRequest = function(userId, username, discriminator, avatar)
                print(string.format("Discord: join request (%s, %s, %s, %s)", userId, username, discriminator, avatar))
                discordRPC.respond(userId, "yes")
            end
        end
    end
}