local log = {
    init = function(self,e,w,i,d,v)
        e = e or true
        w = w or true
        i = i or true
        d = d or false
        v = v or false
        self.c = {e,w,i,d,v}
    end,
    c = {true,true,true,false,false},
    assert = function(self, b, o, t)
        if not b then
            self:fatal(o,t)
        end
    end,
    fatal = function(self, o, t)
        if not t then
            t = o
            o = "no module"
        end
        print("\27[41m\27[04m["..o.."] FATAL: "..tostring(t).."\27[00m")
        error("["..o.."] "..t)
    end,
    error = function(self, o, t)
        if not t then
            t = o
            o = "no module"
        end
        if self.c[1] then
            print("\27[31m["..o.."] ERROR: "..tostring(t).."\27[00m")
        end
    end,
    warning = function(self, o, t)
        if not t then
            t = o
            o = "no module"
        end
        if self.c[2] then
            print("\27[33m["..o.."] WARN : "..tostring(t).."\27[00m")
        end
    end,
    info = function(self, o, t)
        if not t then
            t = o
            o = "no module"
        end
        if self.c[3] then
            print("["..o.."] "..tostring(t).."\27[00m")
        end
    end,
    debug = function(self, o, t)
        if not t then
            t = o
            o = "no module"
        end
        if self.c[4] then
            print("\27[02m["..o.."] debug: "..tostring(t).."\27[00m") --TODO: FIXME: AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
        end                                      -- For some reason, debug and verbose looks same. Better than not having any colors.
    end,
    verbose = function(self, o, t)
        if not t then
            t = o
            o = "no module"
        end
        if self.c[5] then
            print("\27[02m["..o.."] verb : "..tostring(t).."\27[00m")
        end
    end,
    colours = function(log, conclude)
        log:e("Color","These")
        log:w("Color","Are")
        log:l("Color","Colors!")
        log:d("Color","Debug")
        log:v("Color","Verbose")
        if conclude then log.fatal("Color","Test concluded") end
    end
}
log.err = log.error
log.e = log.err
log.warn = log.warning
log.w = log.warn
log.log = log.info
log.l = log.info
log.i = log.info
log.d = log.debug
log.v = log.verbose

return log