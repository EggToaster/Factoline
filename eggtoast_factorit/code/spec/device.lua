dload = {
    load = function ()
        if device.noclick then
            if device.console then
                mouse.device="stick"
            else
                mouse.device="touch"
            end
        else
            mouse.device="mouse"
        end
        if device.padonly then
            joymode = true
        end
        joysticks = love.joystick.getJoysticks()[1]
    end
}