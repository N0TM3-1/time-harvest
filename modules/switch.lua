switch = {}

function switch.load(reciever) -- Load collection
    msg.post(reciever, "init")
    msg.post(reciever, "enable")
end

function switch.unload(reciever) -- Unload collection
    msg.post(reciever, "disable")
    msg.post(reciever, "final")
    msg.post(reciever, "unload")
end

function switch.change(current, next) -- Switch collection
    msg.post(next, "init")
    msg.post(next, "enable")
    msg.post(current, "disable")
    msg.post(current, "final")
    msg.post(current, "unload")
end

return switch