---@meta

-- Extend the built-in math library with Fatality-specific functions
math = math or {}

---Calculates angles between 2 vectors
---@param src vector Source vector
---@param dst vector Destination vector
---@return vector angles
function math.calc_angle(src, dst) end

---Normalizes an angle
---@param angle number Input angle
---@return number normalized_angle
function math.angle_normalize(angle) end

---Approaches an angle over time
---@param from vector Start angle
---@param to vector End angle
---@param speed number Approach speed
---@return vector delta_angle
function math.approach_angles(from, to, speed) end

---Returns a point on the edge of a box
---@param mins vector Box mins
---@param maxs vector Box maxs
---@param dir vector Point direction (angle)
---@param radius number Area radius
---@return vector point
function math.edge_point(mins, maxs, dir, radius) end

---Linear interpolation
---@param t1 number Start value
---@param t2 number End value
---@param progress number Interpolation amount
---@return number interpolated_value
function math.lerp(t1, t2, progress) end

---Calculates angles from a vector
---@param forward vector Source vector
---@param up? vector Up vector
---@return vector angles
function math.vector_angles(forward, up) end

---Transforms a point in the game world onto the viewport
---@param xyz vector Point in the world
---@param round? boolean Whether should round the output (default: true)
---@return vec2 viewport_point
function math.world_to_screen(xyz, round) end

---Clamps a value between min and max
---@param n number Value
---@param lower number Lowest value
---@param upper number Highest value
---@return number clamped_value
function math.clamp(n, lower, upper) end

---Maps the value from one range to another range
---@param val number Value
---@param a number Lowest source value
---@param b number Highest source value
---@param c number Lowest destination value
---@param d number Highest destination value
---@return number mapped_value
function math.remap_val(val, a, b, c, d) end

---Maps the value from one range to another range and clamps the result
---@param val number Value
---@param a number Lowest source value
---@param b number Highest source value
---@param c number Lowest destination value
---@param d number Highest destination value
---@return number mapped_value
function math.remap_val_clamped(val, a, b, c, d) end

---Creates a 2D vector
---@param x number X coordinate
---@param y number Y coordinate
---@return vec2
function math.vec2(x, y) end

---Creates a 3D vector
---@param x number X coordinate
---@param y number Y coordinate
---@param z number Z coordinate
---@return vector
function math.vec3(x, y, z) end