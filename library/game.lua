---@meta

---@class game
---@field global_vars global_vars_t This service exposes global variables used by the game, such as frame time or current server time
---@field engine cengine_client This service exposes the engine client, which includes commonly used engine-related functions
---@field input ccsgo_input This service exposes the command input system
---@field input_system cinput_system This service exposes the control input system
---@field game_ui_funcs cgame_ui_funcs This service exposes the game's UI functions
---@field cvar ccvar This service exposes the game's cvar system
local game = {}

---@class global_vars_t
---@field real_time number Time passed since the game start, in seconds
---@field frame_count integer Amount of frames rendered since the game start
---@field abs_frame_time number Absolute (averaged) frame time
---@field max_clients integer Maximum amount of clients on the current server
---@field ticks_this_frame integer Amount of ticks passed during the currently rendered frame
---@field frame_time number Time in which a previous frame was rendered
---@field cur_time number Time passed since the server's game start
---@field tick_fraction number Current tick's fractional value
---@field tick_count integer Ticks passed since the server's game start
---@field map_path string Relative path to current loaded map's file
---@field map_name string Name of the currently loaded map

---@class cnet_chan
---@field get_address fun():string? Returns address string of the remote machine
---@field is_loopback fun():boolean? Returns whether connected to local machine
---@field is_null fun():boolean Returns whether the channel is stubbed
---@field get_latency fun():number? Returns current latency to the remote server (in seconds)

---@class cengine_client
---@field get_last_timestamp fun():number Returns last timestamp, in seconds
---@field get_last_server_tick fun():integer Returns last server tick number
---@field in_game fun():boolean Returns whether the client is currently in game
---@field is_connected fun():boolean Returns whether the client is currently connected to a game server
---@field get_netchan fun():cnet_chan Returns the Network Channel used for network communication
---@field client_cmd fun(cmd: string, unrestricted?: boolean) Executes a client-sided console command
---@field get_screen_size fun():integer, integer Returns client window screen size (width, height)

---@class ccsgo_input
---@field in_third_person boolean true if currently in the third person
---@field get_view_angles fun():vector Returns current camera view angles
---@field set_view_angles fun(ang: vector) Sets new camera view angles

---@class cinput_system
---@field vk_to_button_code fun(vk: integer):integer Converts a virtual key to button code

---@class cgame_ui_funcs
---@field get_binding_for_button_code fun(code: integer):string Returns the binding name for a button code

---@class convar
---@field name string Read-only name of the convar
---@field description string Read-only description of the convar
---@field flags integer Read-only flags of the convar
---@field value any Read-only value of the convar in its type

---@class ccvar
---@field find fun(name: string):convar Get the game's cvar under this name


-- This table exposes various internal services and global objects used by Fatality, and also provides a way to retrieve any additional services you need.
_G.game = game