local mo = {
    main =function (t)
        t.modules.audio = true              -- Enable the audio module (boolean)
        t.modules.data = false              -- Enable the data module (boolean)
        t.modules.event = false             -- Enable the event module (boolean)
        t.modules.font = true               -- Enable the font module (boolean)
        t.modules.graphics = true           -- Enable the graphics module (boolean)
        t.modules.image = true              -- Enable the image module (boolean)
        t.modules.joystick = true           -- Enable the joystick module (boolean)
        t.modules.keyboard = false          -- Enable the keyboard module (boolean)
        t.modules.mouse = false             -- Enable the mouse module (boolean)
        t.modules.math = true               -- Enable the math module (boolean)            
        t.modules.physics = true            -- Enable the physics module (boolean)
        t.modules.sound = true              -- Enable the sound module (boolean)
        t.modules.system = true             -- Enable the system module (boolean)
        t.modules.thread = true             -- Enable the thread module (boolean)
        t.modules.timer = true              -- Enable the timer module (boolean), Disabling it will result 0 delta time in love.update
        t.modules.touch = true              -- Enable the touch module (boolean)
        t.modules.video = true              -- Enable the video module (boolean)
        t.modules.window = true             -- Enable the window module (boolean)
    end
}
return mo