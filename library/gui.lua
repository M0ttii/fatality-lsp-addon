---@meta

---@class notification_system
local notification_system = {}

---@enum mouse_button
local mouse_button = {
    left = 0,    -- Left mouse button
    right = 1,   -- Right mouse button
    middle = 2,  -- Middle (scroll wheel) button
    back = 3,    -- Back button (side button 1)
    forward = 4, -- Forward button (side button 2)
}

---@class context_input
---@field cursor fun(self: context_input): vec2 Returns current cursor position
---@field cursor_prev fun(self: context_input): vec2 Returns previous cursor position
---@field cursor_delta fun(self: context_input): vec2 Delta between previous and current positions
---@field did_cursor_move fun(self: context_input): boolean Returns true if cursor moved since last input
---@field did_wheel_move fun(self: context_input): boolean Returns true if mouse wheel moved since last input
---@field did_process_mouse fun(self: context_input): boolean Returns true if any mouse key state changed
---@field button_released fun(self: context_input): boolean Returns true if any key was released
---@field wheel_delta fun(self: context_input): number Returns amount of rows scrolled this input
---@field is_mouse_up fun(self: context_input, mb: mouse_button): boolean Returns true if mouse key is up
---@field is_mouse_down fun(self: context_input, mb: mouse_button): boolean Returns true if mouse key is down
---@field is_mouse_clicked fun(self: context_input, mb: mouse_button): boolean Returns true if mouse key was clicked
---@field is_mouse_released fun(self: context_input, mb: mouse_button): boolean Returns true if mouse key was released
---@field did_process_key fun(self: context_input): boolean Returns true if any key state changed
---@field is_key_up fun(self: context_input, k: integer): boolean Returns true if key is up
---@field is_key_down fun(self: context_input, k: integer): boolean Returns true if key is down
---@field is_key_clicked fun(self: context_input, k: integer): boolean Returns true if key was clicked
---@field is_key_released fun(self: context_input, k: integer): boolean Returns true if key was released

---@class control
local control = {}

---@class container
---@field add fun(self: container, ctrl: control) Adds a control to the container
---@field remove fun(self: container, ctrl: control) Removes a control from the container
---@field find fun(self: container, id: string): control|nil Finds a control by ID

---@class control_container : control, container
---@field __call fun(id: control_id): control_container Constructs the control container

---@class layout : control_container
---@field __call fun(id: control_id): layout Constructs the layout

---@class group : control_container
---@field __call fun(id: control_id): group Constructs the group

---@class context
---@field find fun(self: context, id: string): control|nil Finds a control by ID
---@field user user_t User's basic information

---@class bits
---@field reset fun(self: bits) Resets the value
---@field get_raw fun(self: bits): integer Returns raw value
---@field set_raw fun(self: bits, val: integer) Sets raw value
---@field none fun(self: bits): boolean Returns true if no bits set
---@field set fun(self: bits, bit: integer) Enables a bit
---@field unset fun(self: bits, bit: integer) Disables a bit
---@field get fun(self: bits, bit: integer): boolean Returns bit state
---@field toggle fun(self: bits, bit: integer) Toggles bit state

---@class control_id
---@field id integer Hashed representation of the ID (readonly)
---@field id_string string Normal representation of the ID (readonly)
---@field __call fun(id: string): control_id Constructs the ID structure

---@class user_t
---@field avatar texture|nil User's avatar (readonly)
---@field username string User's username (readonly)

---@class notification
---@field __call fun(hdr: string, txt: string, ico: texture|nil): notification Constructs the notification

---@class notification_system
---@field add fun(self: notification_system, notif: notification) Adds a notification to the list

---@class value_param<T>
---@field get fun(self: value_param<any>): any Returns the value
---@field get_direct fun(self: value_param<any>): any Returns value disregarding keybinds
---@field set fun(self: value_param<any>, val: any) Sets the value
---@field get_hotkey_state fun(self: value_param<any>): boolean Returns true if any hotkey active
---@field disable_hotkeys fun(self: value_param<any>) Disables all active hotkeys

---@enum control_type
local control_type = {
    default = 0,              -- Default control
    button = 1,              -- Button control
    checkbox = 2,            -- Checkbox control
    child_tab = 3,           -- Child tab control
    color_picker = 4,        -- Color picker control
    combo_box = 5,           -- Combo box control
    control_container = 6,    -- Default container control
    group = 7,               -- Groupbox control
    hotkey = 8,              -- Hotkey input control
    hsv_slider = 9,          -- HSB slider
    label = 10,              -- Label control
    layout = 11,             -- Layout control
    list = 12,               -- Listbox control
    loading = 13,            -- Loading spinner
    notification_control = 14, -- Notification item control
    popup = 15,              -- Basic popup window
    selectable = 16,         -- Basic selectable item
    slider = 17,             -- Slider item
    spacer = 18,             -- Spacer control
    tab = 19,               -- Horizontal/vertical tab
    tabs_layout = 20,        -- Tab layout variant
    weapon_tabs_layout = 21,  -- Weapon tab layout variant
    text_input = 22,         -- Text input control
    toggle_button = 23,      -- Toggle button variant
    window = 24,             -- Basic window control
    widget = 25,             -- Basic widget control
    settings = 26,           -- Settings control
    image = 27,              -- Image control
}

---@class control
---@field id integer Control ID (readonly)
---@field id_string string String representation of ID (readonly)
---@field is_visible boolean Control's visibility state (readonly)
---@field parent control|nil Parent control (readonly)
---@field type control_type Control's type (readonly)
---@field inactive boolean If true, control is in inactive state
---@field inactive_text string Tooltip replacement for inactive state
---@field inactive_color color Label color override for inactive state
---@field tooltip string Tooltip text
---@field aliases table<string, boolean> Alias list for search support
---@field get_hotkey_state fun(self: control): boolean Returns true if any hotkey active
---@field set_visible fun(self: control, val: boolean) Changes visibility state
---@field add_callback fun(self: control, cbk: function) Adds a callback
---@field cast fun(self: control): control Attempts to downcast to correct type
---@field reset fun(self: control) Resets control's state

---@class checkbox : control
---@field __call fun(id: control_id): checkbox Constructs the checkbox
---@field get_value fun(self: checkbox): value_param<boolean> Returns checkbox value
---@field set_value fun(self: checkbox, val: boolean) Sets checkbox value

---@class slider : control
---@field __call fun(id: control_id, low: number, high: number, fmt: string[]|table[], step: number): slider Constructs the slider
---@field get_value fun(self: slider): value_param<number> Returns slider value

---@class label : control
---@field __call fun(id: control_id, str: string, col: color|nil, bold: boolean): label Constructs the label
---@field set_text fun(self: label, str: string) Sets the new text

---@class selectable : control
---@field __call fun(id: control_id, str: string): selectable Constructs the selectable

---@class button : control
---@field __call fun(id: control_id, str: string): button Constructs the button

---@class color_picker : control
---@field __call fun(id: control_id, allow_alpha: boolean): color_picker Constructs the color picker
---@field get_value fun(self: color_picker): value_param<color> Returns color picker value

---@class spacer : control
---@field __call fun(id: control_id): spacer Constructs the spacer

---@class text_input : control
---@field __call fun(id: control_id): text_input Constructs the text input
---@field placeholder string Placeholder text
---@field value string Current value (readonly)
---@field set_value fun(self: text_input, str: string) Sets the new text

---@class combo_box : control_container
---@field __call fun(id: control_id): combo_box Constructs the combo box
---@field allow_multiple boolean If true, allows multiple selections
---@field get_value fun(self: combo_box): value_param<bits> Returns combo box value

---@class image : control
---@field __call fun(id: control_id, tex: texture): image Constructs the image



---@class gui
---@field ctx context GUI context
---@field notify notification_system Notification system
---@field input context_input Input context
---@field make_control fun(text: string, c: control): layout Wraps a control into a layout with label
gui = {}

-- Make gui, mouse_button and control_type globally available
_G.gui = gui
_G.mouse_button = mouse_button
_G.control_type = control_type