---@meta

---@class schema_accessor_t<T>
---@field get fun(self: schema_accessor_t<any>): any Returns the value
---@field set fun(self: schema_accessor_t<any>, value: any) Sets the value

---@class base_entity
---@field __index fun(name: string): schema_accessor_t Search for a field in class
---@field get_class_name fun(self: base_entity): string|nil Returns schema class name
---@field to_weapon_base_gun fun(self: base_entity): cs2_weapon_base_gun|nil Cast to weapon base gun
---@field to_weapon_base fun(self: base_entity): cs2_weapon_base|nil Cast to weapon base
---@field to_player_pawn fun(self: base_entity): cs2_player_pawn|nil Cast to player pawn
---@field to_player_controller fun(self: base_entity): cs2_player_controller|nil Cast to player controller

---@class cs2_weapon_base_gun : base_entity
---@field get_abs_origin fun(self: cs2_weapon_base_gun): vector Returns absolute origin
---@field get_max_speed fun(self: cs2_weapon_base_gun): number Returns max player speed with weapon
---@field get_inaccuracy fun(self: cs2_weapon_base_gun, mode: csweapon_mode): number Returns inaccuracy value
---@field get_spread fun(self: cs2_weapon_base_gun, mode: csweapon_mode): number Returns spread value
---@field get_id fun(self: cs2_weapon_base_gun): weapon_id Returns weapon ID
---@field get_type fun(self: cs2_weapon_base_gun): csweapon_type Returns weapon type
---@field get_data fun(self: cs2_weapon_base_gun): ccsweapon_base_vdata Returns weapon static data
---@field is_gun fun(self: cs2_weapon_base_gun): boolean Returns true if weapon is firearm
---@field is_attackable fun(self: cs2_weapon_base_gun): boolean Returns true if can attack
---@field has_secondary_attack fun(self: cs2_weapon_base_gun): boolean Returns true if has secondary attack
---@field has_spread fun(self: cs2_weapon_base_gun): boolean Returns true if weapon has spread

---@class cs2_player_pawn : base_entity
---@field should_draw fun(self: cs2_player_pawn): boolean Returns true if game will draw player
---@field is_left_handed fun(self: cs2_player_pawn): boolean Returns true if left-hand mode enabled
---@field get_abs_origin fun(self: cs2_player_pawn): vector Returns absolute origin
---@field get_abs_angles fun(self: cs2_player_pawn): vector Returns absolute angles
---@field get_abs_velocity fun(self: cs2_player_pawn): vector Returns absolute velocity
---@field set_abs_origin fun(self: cs2_player_pawn, vec: vector) Sets absolute origin
---@field set_abs_angles fun(self: cs2_player_pawn, ang: vector) Sets absolute angles
---@field set_abs_velocity fun(self: cs2_player_pawn, vel: vector) Sets absolute velocity
---@field is_alive fun(self: cs2_player_pawn): boolean Returns true if player is alive
---@field is_enemy fun(self: cs2_player_pawn): boolean Returns true if enemy to local player
---@field is_enemy_to fun(self: cs2_player_pawn, ent: base_entity): boolean Returns true if enemy to entity
---@field get_active_weapon fun(self: cs2_player_pawn): cs2_weapon_base_gun Returns active weapon
---@field get_name fun(self: cs2_player_pawn): string Returns sanitized player name
---@field get_view_offset fun(self: cs2_player_pawn): vector Returns view offset
---@field get_eye_pos fun(self: cs2_player_pawn): vector Returns eye position

---@class cs2_player_controller : base_entity
---@field is_enemy fun(self: cs2_player_controller): boolean Returns true if enemy to local player
---@field get_name fun(self: cs2_player_controller): string Returns sanitized player name
---@field get_pawn fun(self: cs2_player_controller): cs2_player_pawn Returns attached pawn
---@field get_active_weapon fun(self: cs2_player_controller): cs2_weapon_base_gun Returns active weapon
---@field get_observer_pawn fun(self: cs2_player_controller): base_entity Returns observer pawn
---@field get_observer_target fun(self: cs2_player_controller): base_entity Returns observed pawn
---@field get_observer_mode fun(self: cs2_player_controller): observer_mode_t Returns observer mode

---@class cs2_weapon_base : base_entity
---@field get_abs_origin fun(self: cs2_weapon_base): vector Returns absolute origin
---@field get_id fun(self: cs2_weapon_base): weapon_id Returns weapon ID
---@field get_type fun(self: cs2_weapon_base): csweapon_type Returns weapon type
---@field get_data fun(self: cs2_weapon_base): ccsweapon_base_vdata Returns weapon static data

---@class cs2_grenade_projectile : base_entity
---@field get_abs_origin fun(self: cs2_grenade_projectile): vector Returns absolute origin
---@field get_grenade_type fun(self: cs2_grenade_projectile): integer Returns grenade type

---@class cfiring_mode
---@field values_arr any[] Values array for firing mode

---@class ccsweapon_base_vdata
---@field __index fun(name: string): schema_accessor_t Searches for a field in this class

---@class entity_entry_t<T>
---@field entity any Entity instance, type depends on list source
---@field had_dataupdate boolean True if client received updates for this entity
---@field handle chandle<any> Entity handle for safe global storage
---@field avatar texture|nil Player's profile picture (only for cs2_player_controller)

---@class entity_list_t<T>
---@field for_each fun(self: entity_list_t<any>, callback: fun(entry: entity_entry_t<any>)) Loop through entities
---@field for_each_z fun(self: entity_list_t<any>, callback: fun(entry: entity_entry_t<any>)) Loop through entities in reverse

---@class entities
---@field players entity_list_t<cs2_player_pawn> Player pawns
---@field controllers entity_list_t<cs2_player_controller> Player controllers
---@field items entity_list_t<cs2_weapon_base> Held items
---@field dropped_items entity_list_t<cs2_weapon_base> Dropped items
---@field projectiles entity_list_t<cs2_grenade_projectile> Grenade projectiles
---@field get_local_pawn fun(): cs2_player_pawn Returns local player's pawn
---@field get_local_controller fun(): cs2_player_controller Returns local player's controller
entities = {}

---@alias chandle<T> number Handle to an entity of type T

---@enum csweapon_mode
csweapon_mode = {
    primary_mode = 0,
    secondary_mode = 1,
    grenade_mode = 2,
}

---@enum csweapon_type
csweapon_type = {
    none = -1,
    knife = 0,
    pistol = 1,
    submachinegun = 2,
    rifle = 3,
    shotgun = 4,
    sniper = 5,
    machinegun = 6,
    c4 = 7,
    grenade = 8,
    stackable_item = 9,
    fists = 10,
    breach_charge = 11,
    bumpmine = 12,
    tablet = 13,
    melee = 14,
    shield = 15,
}

---@enum weapon_id
weapon_id = {
    none = 0,
    deagle = 1,
    elite = 2,
    fiveseven = 3,
    glock = 4,
    ak47 = 7,
    aug = 8,
    awp = 9,
    famas = 10,
    g3sg1 = 11,
    galil = 13,
    m249 = 14,
    m4a4 = 16,
    mac10 = 17,
    p90 = 19,
    mp5sd = 23,
    ump45 = 24,
    xm1014 = 25,
    bizon = 26,
    mag7 = 27,
    negev = 28,
    sawedoff = 29,
    tec9 = 30,
    taser = 31,
    p2000 = 32,
    mp7 = 33,
    mp9 = 34,
    nova = 35,
    p250 = 36,
    shield = 37,
    scar20 = 38,
    sg553 = 39,
    ssg08 = 40,
    knifegg = 41,
    knife = 42,
    flashbang = 43,
    hegrenade = 44,
    smokegrenade = 45,
    molotov = 46,
    decoy = 47,
    incgrenade = 48,
    c4 = 49,
    healthshot = 57,
    knife_t = 59,
    m4a1_silencer = 60,
    usp_silencer = 61,
    cz75a = 63,
    revolver = 64,
    tagrenade = 68,
    fists = 69,
    breachcharge = 70,
    tablet = 72,
    melee = 74,
    axe = 75,
    hammer = 76,
    spanner = 78,
    knife_ghost = 80,
    firebomb = 81,
    diversion = 82,
    frag_grenade = 83,
    snowball = 84,
    bumpmine = 85,
}

---@enum observer_mode_t
observer_mode_t = {
    none = 0,
    deathcam = 1,
    freezecam = 2,
    fixed = 3,
    in_eye = 4,
    chase = 5,
    roaming = 6,
}

-- internal entity list
_G.entities = entities

-- Make enums globally available
_G.csweapon_mode = csweapon_mode
_G.csweapon_type = csweapon_type
_G.weapon_id = weapon_id
_G.observer_mode_t = observer_mode_t