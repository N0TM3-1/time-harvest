convert = {}

function convert.screen_to_world(x, y, z, camera_id)
    local DISPLAY_WIDTH = sys.get_config_int("display.width")   -- Get display width
    local DISPLAY_HEIGHT = sys.get_config_int("display.height") -- Get display height

    local projection = camera.get_projection(camera_id)
    local view = camera.get_view(camera_id)
    local w, h = window.get_size() -- get window size

    -- Adjust the window size for display scaling
    w = w / (w / DISPLAY_WIDTH)
    h = h / (h / DISPLAY_HEIGHT)

    local inv = vmath.inv(projection * view)
    x = (2 * x / w) - 1
    y = (2 * y / h) - 1
    z = (2 * z) - 1
    local x1 = math.floor(x * inv.m00 + y * inv.m01 + z * inv.m02 + inv.m03)
    local y1 = math.floor(x * inv.m10 + y * inv.m11 + z * inv.m12 + inv.m13)
    local z1 = math.floor(x * inv.m20 + y * inv.m21 + z * inv.m22 + inv.m23)
    return x1, y1, z1
end

function convert.world_to_tile(x, y, tile_size)
    local tile_x = math.floor(x / tile_size) + 1
    local tile_y = math.floor(y / tile_size) + 1

    return tile_x, tile_y
end

return convert
