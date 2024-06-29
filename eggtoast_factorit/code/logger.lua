log = {
    init = function(e,w,i,d,v)
        e = e or true
        w = w or true
        i = i or true
        d = d or false
        v = v or false
        c = {e,w,i,d,v}
    end,
    c = {true,true,true,false,false},
    error = function(o,t)
        if c[1] then
            print("ERROR:["..o.."] "..t)
        end
    end,
    warning = function(o,t)
        if c[2] then
            print("warn:log["..o.."] "..t)
        end
    end,
    info = function(o,t)
        if c[3] then
            print("["..o.."] "..t)
        end
    end,
    debug = function(o,t)
        if c[4] then
            print("dbg:["..o.."] "..t)
        end
    end,
    verbose = function(o,t)
        if c[5] then
            print("v:["..o.."] "..t)
        end
    end,
}
log.err = log.error
log.e = log.err
log.warn = log.warning
log.w = log.warn
log.log = log.info
log.l = log.info
log.d = log.debug
log.v = log.verbose