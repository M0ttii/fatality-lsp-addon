---@meta

---@class events
---@field present_queue event_t Invoked each time the game queues a frame for rendering. This is the only permitted location for drawing on screen.
---@field frame_stage_notify event_t Invoked every time the game progresses onto another frame stage. This event is called before the game handles a new frame stage.
---@field render_start_pre event_t Invoked every time game starts the scene rendering process. This event is called before the game's function runs.
---@field render_start_post event_t Invoked every time game starts scene rendering process. This event is called after the game's function runs.
---@field setup_view_pre event_t Invoked every time the game sets up the view. This event is called before the game's function runs.
---@field setup_view_post event_t Invoked every time the game sets up the view information. This event is called after the game's function runs.
---@field override_view event_t Invoked every time the game internally overrides view information. You are free to change whatever you like in the provided view setup.
---@field event event_t Invoked every time a game event fires. We do not listen to every single event that exists in the game.
---@field handle_input event_t Invoked every time the game processes mouse/controller input. This is a good place to alter mouse movement, if needed.
---@field input event_t Invoked every time the GUI processes input.
events = {}

---@alias event_callback fun(...: any)

---@class event_t
---@field add fun(self: event_t, callback: event_callback) Adds a callback to the event. The callback arguments are dictated by the event instance.
---@field remove fun(self: event_t, callback: event_callback) Removes a callback that was earlier passed to the add() function.
local event_t = {}

-- Define event instances
events.present_queue = setmetatable({}, { __index = event_t })
events.frame_stage_notify = setmetatable({}, { __index = event_t })
events.render_start_pre = setmetatable({}, { __index = event_t })
events.render_start_post = setmetatable({}, { __index = event_t })
events.setup_view_pre = setmetatable({}, { __index = event_t })
events.setup_view_post = setmetatable({}, { __index = event_t })
events.override_view = setmetatable({}, { __index = event_t })
events.event = setmetatable({}, { __index = event_t })
events.handle_input = setmetatable({}, { __index = event_t })
events.input = setmetatable({}, { __index = event_t })

-- There are a number of events that Fatality provides to use in the API - from various hooks, to in-game events. Each event entry is an object of event_t. This table documents events to be used by your scripts.
_G.events = events