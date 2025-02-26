---@meta

---@class ptr
---@field __call fun(num: integer): ptr Converts a number to light_userdata pointer

---@class ref_holder_t<T>
---@field val any Value holder for reference variables

---@class vector
---@field x number X coordinate
---@field y number Y coordinate
---@field z number Z coordinate
---@field __call fun(x?: number, y?: number, z?: number): vector Vector constructor
---@field is_zero fun(self: vector, tolerance?: number): boolean Returns true if vector is within tolerance
---@field dist fun(self: vector, other: vector): number Distance to another vector
---@field dist_sqr fun(self: vector, other: vector): number Squared distance (faster)
---@field dist_2d fun(self: vector, other: vector): number 2D distance (x,y only)
---@field dist_2d_sqr fun(self: vector, other: vector): number Squared 2D distance (faster)
---@field cross fun(self: vector, other: vector): vector Cross product
---@field is_valid fun(self: vector): boolean True if all values are finite
---@field length fun(self: vector): number Vector length
---@field length_sqr fun(self: vector): number Squared length (faster)
---@field length_2d fun(self: vector): number 2D length (x,y only)
---@field length_2d_sqr fun(self: vector): number Squared 2D length (faster)
---@field dot fun(self: vector, other: vector): number Dot product

---@class vector4d
---@field x number
---@field y number
---@field z number
---@field w number

---@class veccolor
---@field r number Red component (0-1)
---@field g number Green component (0-1)
---@field b number Blue component (0-1)

---@class cview_setup
---@field fov number Current FOV
---@field fov_viewmodel number Current viewmodel FOV
---@field origin vector Current view origin
---@field view vector Current view angles
---@field aspect_ratio number Current aspect ratio (width/height)

---@class cuser_cmd
---@field command_number integer Current command number
---@field get_button fun(self: cuser_cmd, button: input_bit_mask): boolean Returns button state
---@field set_button fun(self: cuser_cmd, button: input_bit_mask) Sets button state
---@field remove_button fun(self: cuser_cmd, button: input_bit_mask) Removes button state
---@field get_viewangles fun(self: cuser_cmd): vector Returns current viewangles
---@field set_viewangles fun(self: cuser_cmd, angles: vector) Sets viewangles
---@field lock_angles fun(self: cuser_cmd) Sets command viewangles into game view
---@field get_forwardmove fun(self: cuser_cmd): number Returns forward movement (0-1)
---@field get_leftmove fun(self: cuser_cmd): number Returns left movement (0-1)
---@field set_forwardmove fun(self: cuser_cmd, move: number) Sets forward movement (0-1)
---@field set_leftmove fun(self: cuser_cmd, move: number) Sets left movement (0-1)
---@field rotate_movement fun(self: cuser_cmd, yaw: number) Rotates movement toward yaw

---@class game_event_t
---@field get_name fun(self: game_event_t): string Returns event name
---@field get_bool fun(self: game_event_t, key: string): boolean Returns boolean value by key
---@field get_int fun(self: game_event_t, key: string): integer Returns integer value by key
---@field get_float fun(self: game_event_t, key: string): number Returns float value by key
---@field get_string fun(self: game_event_t, key: string): string|nil Returns string value by key
---@field get_controller fun(self: game_event_t, key: string): cs2_player_controller Returns controller by key
---@field get_pawn_from_id fun(self: game_event_t, key: string): cs2_player_pawn Returns pawn by key

---@enum client_frame_stage
local client_frame_stage = {
    undefined = 0, -- Stage not defined
    start = 1, -- Frame build starting
    render_start = 2, -- Frame render starting
    net_update_start = 3, -- Network update starting
    net_update_preprocess = 4, -- Network update about to be processed
    net_pre_entity_packet = 5, -- Entity packets about to be processed
    net_update_postdataupdate_start = 6, -- Entity info about to update
    net_update_postdataupdate_end = 7, -- Entity info update finishing
    net_update_end = 8, -- Network update ending
    net_creation = 9, -- New entities about to be created
    render_end = 10, -- Frame rendering ending
}

---@enum input_bit_mask
local input_bit_mask = {
    in_attack = 1,
    in_attack2 = 2,
    in_jump = 3,
    in_duck = 4,
    in_forward = 5,
    in_back = 6,
    in_use = 7,
    in_turnleft = 8,
    in_turnright = 9,
    in_moveleft = 10,
    in_reload = 11,
    in_speed = 12,
    in_joyautosprint = 13,
    in_useorreload = 14,
    in_score = 15,
    in_zoom = 16,
    in_look_at_weapon = 17,
}

-- Make types and enums globally available
_G.ptr = ptr
_G.vector = vector
_G.vector4d = vector4d
_G.veccolor = veccolor
_G.client_frame_stage = client_frame_stage
_G.input_bit_mask = input_bit_mask
