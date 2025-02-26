---@meta

---@alias game_event_name
---| 'bullet_impact' # Internally listened by default
---| 'weapon_fire' # Internally listened by default
---| 'bomb_beginplant' # Internally listened by default
---| 'bomb_abortplant' # Internally listened by default
---| 'bomb_planted' # Internally listened by default
---| 'bomb_defused' # Internally listened by default
---| 'bomb_exploded' # Internally listened by default
---| 'round_start' # Internally listened by default
---| 'game_newmap' # Internally listened by default
---| 'map_shutdown' # Internally listened by default
---| 'round_end' # Custom event example

---@class events_t
---@field add_listener fun(name: game_event_name) Adds a game event to the listener

---@class mods
---@field events events_t Event manager. Use this mod if you want to listen to more in-game events
local mods = {}

-- This table exposes several mods (short for Module, not Modification), that Fatality uses to operate.
_G.mods = mods