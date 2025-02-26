---@meta

---@class draw rendering system of the software.
---@field adapter adapter Rendering adapter
---@field frame_time number Rendering frame time. An alias to global_vars_t.frame_time
---@field time number Time, in seconds. An alias to global_vars_t.real_time
---@field scale number Global DPI scale
---@field display vec2 Display area size (viewport dimensions)
---@field textures accessor<texture> A string to texture map of all managed textures
---@field fonts accessor<font_base> A string to font_base map of all managed fonts
---@field shaders accessor<shader> A string to shader map of all managed shaders
---@field surface layer The layer you can render on
---@field vec2 vec2 2D vector
---@field color color This type is a color used within the rendering system.
---@field accessor accessor This type represents a safe way to access maps.
draw = {}

---@class adapter
---@field get_back_buffer fun(self: adapter):ptr Returns a back buffer texture. May return a blank or outdated texture if not updated.
---@field get_back_buffer_downsampled fun(self: adapter):ptr Returns a 4x down sampled version of the back buffer texture.
---@field get_shared_texture fun(self: adapter):ptr Returns a shared texture that replicates the down sampled back buffer texture. Updated once before layer rendering.
adapter = {}


---@class layer
---@field g command The next render command to be pushed to the queue
---@field font font_base Font to use with add_text. If nothing has been set, no text will get rendered
---@field tex_sz vec2? Texture dimensions. Required for rendering rounded shapes with texture for correct UV mapping
---@field skip_dpi boolean If set to true, will skip global DPI scale. Defaults to true
---@field add_triangle_filled fun(self: layer, a: vec2, b: vec2, c: vec2, col: color) Adds a filled triangle with a single color
---@field add_quad_filled fun(self: layer, tl: vec2, tr: vec2, br: vec2, bl: vec2, col: color) Adds a filled quad with a single color
---@field add_rect_filled fun(self: layer, r: rect, col: color) Adds a filled rectangle with a single color
---@field add_circle_filled fun(self: layer, center: vec2, radius: number, c: color, segments?: integer, fill?: number) Adds a filled circle with a single color
---@field add_triangle_filled_multicolor fun(self: layer, a: vec2, b: vec2, c: vec2, cols: color[]) Adds a filled, multicolor triangle
---@field add_rect_filled_multicolor fun(self: layer, r: rect, cols: color[]) Adds a filled, multicolor rectangle
---@field add_circle_filled_multicolor fun(self: layer, center: vec2, radius: number, cols: color[], segments?: integer, fill?: number) Adds a filled, multicolor circle
---@field add_quad_filled_multicolor fun(self: layer, tl: vec2, tr: vec2, br: vec2, bl: vec2, cols: color[]) Adds a filled, multicolor quad
---@field add_pill_multicolor fun(self: layer, mins: vec2, maxs: vec2, radius_min: number, radius_max: number, cols: color[], segments?: integer) Adds a multicolor pill shape
---@field add_shadow_line fun(self: layer, r: rect, dir: shadow_dir, a?: number) Adds a shadow line
---@field add_shadow_rect fun(self: layer, r: rect, radius: number, bg?: boolean, a?: number) Adds a shadowed rectangle
---@field add_glow fun(self: layer, r: rect, radius: number, c: color, parts?: glow_parts) Adds a glow box
---@field add_rect_filled_rounded fun(self: layer, r: rect, c: color, amount: number, rnd?: rounding) Adds a filled, rounded rectangle
---@field add_rect_filled_rounded_multicolor fun(self: layer, r: rect, c: color[], amount: number, rnd?: rounding) Adds a filled, multicolor rounded rectangle
---@field add_triangle fun(self: layer, a: vec2, b: vec2, c: vec2, col: color, thickness?: number, mode?: outline_mode) Adds a stroked triangle
---@field add_quad fun(self: layer, tl: vec2, tr: vec2, br: vec2, bl: vec2, c: color, thickness?: number, mode?: outline_mode) Adds a stroked quad
---@field add_rect fun(self: layer, r: rect, c: color, thickness?: number, mode?: outline_mode) Adds a stroked rectangle
---@field add_circle fun(self: layer, center: vec2, radius: number, c: color, segments?: integer, fill?: number, thickness?: number, mode?: outline_mode) Adds a stroked circle
---@field add_line fun(self: layer, a: vec2, b: vec2, c: color, thickness?: number) Adds a line
---@field add_line_multicolor fun(self: layer, a: vec2, b: vec2, c: color, c2: color, thickness?: number) Adds a multicolor line
---@field add_rect_rounded fun(self: layer, r: rect, c: color, amount: number, rnd?: rounding, thickness?: number, mode?: outline_mode) Adds a rounded, filled rectangle
---@field add_text fun(self: layer, p: vec2, text: string, c: color, params?: text_params) Adds text with optional color control using \fRRGGBBAA and \b
---@field override_clip_rect fun(self: layer, r?: rect, intersect?: boolean) Overrides clip rectangle with support of intersection
layer = {}

---@class vec2
---@field x number X coordinate
---@field y number Y coordinate
---@field floor fun(self: vec2):vec2 Returns floored variant of this vector
---@field ceil fun(self: vec2):vec2 Returns ceiled variant of this vector
---@field round fun(self: vec2):vec2 Returns rounded variant of this vector
---@field len fun(self: vec2):number Returns length of this vector
---@field len_sqr fun(self: vec2):number Returns squared length of this vector
---@field dist fun(self: vec2, other: vec2):number Returns distance to another vector
---@field dist_sqr fun(self: vec2, other: vec2):number Returns squared distance to another vector

---@class color
---@field white fun():color Returns a white, opaque color
---@field white_transparent fun():color Returns a white, transparent color
---@field black fun():color Returns a black, opaque color
---@field black_transparent fun():color Returns a black, transparent color
---@field percent fun(p: number, a?: number):color Returns a red-to-green color based on percentage
---@field gray fun(b: number, a?: number):color Returns a black-to-white color based on percentage
---@field interpolate fun(a: color, b: color, t: number):color Interpolates two colors
---@field rgba fun(self: color):number Returns integer representation in RGBA format
---@field argb fun(self: color):number Returns integer representation in ARGB format
---@field bgra fun(self: color):number Returns integer representation in BGRA format
---@field abgr fun(self: color):number Returns integer representation in ABGR format
---@field darken fun(self: color, value: number):color Returns darker variant of this color
---@field mod_a fun(self: color, value: number):color Modulate opacity of the color
---@field r fun(self: color, value: number):color Override red and return new color
---@field g fun(self: color, value: number):color Override green and return new color
---@field b fun(self: color, value: number):color Override blue and return new color
---@field a fun(self: color, value: number):color Override opacity and return new color
---@field get_r fun(self: color):number Returns red color value
---@field get_g fun(self: color):number Returns green color value
---@field get_b fun(self: color):number Returns blue color value
---@field get_a fun(self: color):number Returns opacity color value
---@field h fun(self: color):number Return hue value of the color
---@field s fun(self: color):number Returns saturation value of the color
---@field v fun(self: color):number Returns brightness value of the color
---@field hsv fun(self: color, hue: number, saturation: number, brightness: number, alpha?: number):color Construct new color from HSB values

---@class rect
---@field mins vec2 Mins (top-left) vector
---@field maxs vec2 Maxs (bottom-right) vector
---@field width fun(self: rect, value?: number):number|rect Get or set rectangle width
---@field height fun(self: rect, value?: number):number|rect Get or set rectangle height
---@field size fun(self: rect, value?: vec2):vec2|rect Get or set rectangle size
---@field explode fun(self: rect, value: vec2):rect Explodes the rectangle by given vector
---@field half_width fun(self: rect):rect Returns a rectangle with half of the width
---@field translate fun(self: rect, value: vec2):rect Translates this rectangle by vector coordinates
---@field margin_left fun(self: rect, value: number):rect Move rectangle from the left
---@field margin_right fun(self: rect, value: number):rect Move rectangle from the right
---@field margin_top fun(self: rect, value: number):rect Move rectangle from the top
---@field margin_bottom fun(self: rect, value: number):rect Move rectangle from the bottom
---@field padding_left fun(self: rect, value: number):rect Adds value to the left side
---@field padding_right fun(self: rect, value: number):rect Adds value to the right side
---@field padding_top fun(self: rect, value: number):rect Adds value to the top side
---@field padding_bottom fun(self: rect, value: number):rect Adds value to the bottom side
---@field shrink fun(self: rect, value: number):rect Shrinks the rectangle by given amount
---@field expand fun(self: rect, value: number):rect Expands the rectangle by given amount
---@field contains fun(self: rect, other: vec2|rect):boolean Returns true if contains vector/rectangle
---@field overlaps fun(self: rect, other: rect):boolean Returns true if rectangles overlap
---@field intersect fun(self: rect, other: rect):rect Intersects this rectangle with another
---@field tl fun(self: rect):vec2 Returns top-left vector
---@field tr fun(self: rect):vec2 Returns top-right vector
---@field br fun(self: rect):vec2 Returns bottom-right vector
---@field bl fun(self: rect):vec2 Returns bottom-left vector
---@field center fun(self: rect):vec2 Returns center point
---@field circle fun(self: rect, r: number):vec2 Returns point on ellipsis at given radians
---@field floor fun(self: rect):rect Returns floored rectangle
---@field ceil fun(self: rect):rect Returns ceiled rectangle
---@field round fun(self: rect):rect Returns rounded rectangle
---@field is_zero fun(self: rect):boolean Returns true if mins and maxs are zero

---@class accessor<T>
---@field __index fun(key: string):any Returns an object by key
---@field __newindex fun(key: string, obj: any) Sets an object by key

---@class outline_mode
---@field inset any Inset outlining. The outline will be inside the shape (+1px from top-left, -1px from bottom-right)
---@field outset any Outset outlining. The outline will be outside of the shape (-1px from top-left, +1px from bottom-right)
---@field center any Center outlining. The outline will match the shape size

---@class rounding
---@field tl any Round top-left corner
---@field tr any Round top-right corner
---@field bl any Round bottom-left corner
---@field br any Round bottom-right corner
---@field t any Round both top corners (same as bit.bor(draw.rounding.tl, draw.rounding.tr))
---@field l any Round both left corners (same as bit.bor(draw.rounding.tl, draw.rounding.bl))
---@field r any Round both right corners (same as bit.bor(draw.rounding.tr, draw.rounding.br))
---@field b any Round both bottom corners (same as bit.bor(draw.rounding.bl, draw.rounding.br))
---@field all any Round all corners (same as bit.bor(draw.rounding.tl, draw.rounding.tr, draw.rounding.bl, draw.rounding.br))

---@class glow_parts
---@field tl any Draw top-left corner
---@field tr any Draw top-right corner
---@field bl any Draw bottom-left corner
---@field br any Draw bottom-right corner
---@field t any Draw top line
---@field l any Draw left line
---@field r any Draw right line
---@field b any Draw bottom line
---@field all_left any Draw all left side shapes (corners and line)
---@field all_right any Draw all right side shapes (corners and line)
---@field all_top any Draw all top side shapes (corners and line)
---@field all_bottom any Draw all bottom side shapes (corners and line)
---@field all any Draw the entire glow around the shape
---@field no_bottom any Draw glow except for the bottom line
---@field no_top any Draw glow except for the top line
---@field no_right any Draw glow except for the right line
---@field no_left any Draw glow except for the left line

---@class text_alignment
---@field left any Align left. Text position's X coordinate is at the left side of the text area
---@field center any Align center. Text position's X/Y coordinate is at the center of the text area
---@field right any Align right. Text position's X coordinate is at the right side of the text area
---@field top any Align top. Text position's Y coordinate is at the top side of the text area (same as left for vertical)
---@field bottom any Align bottom. Text position's Y coordinate is at the bottom side of the text area (same as right for vertical)

---@class text_params
---@field with_v fun(v: text_alignment): text_params Creates text_params instance with vertical alignment
---@field with_h fun(h: text_alignment): text_params Creates text_params instance with horizontal alignment
---@field with_line fun(line: text_alignment): text_params Creates text_params instance with line alignment
---@field with_vh fun(v: text_alignment, h: text_alignment): text_params Creates text_params instance with vertical and horizontal alignments
---@field with_vline fun(v: text_alignment, line: text_alignment): text_params Creates text_params instance with vertical and line alignment
---@field with_hline fun(h: text_alignment, line: text_alignment): text_params Creates text_params instance with horizontal and line alignment
---@field with_vhline fun(v: text_alignment, h: text_alignment, line: text_alignment): text_params Creates text_params instance with vertical, horizontal and line alignments

---@class shadow_dir
---@field up any The darkest side of the shadow will be at the bottom
---@field down any The darkest side of the shadow will be at the top
---@field left any The darkest side of the shadow will be on the left side
---@field right any The darkest side of the shadow will be on the right side

---@class render_mode
---@field normal any Normal, opaque rendering. Polygons filled with color and texture sampling supported
---@field wireframe any Wireframe rendering. Polygons not filled with color, no texture sampling

---@class command
---@field texture ptr Texture pointer (use set_texture for safety)
---@field frag_shader ptr Fragment shader pointer (use set_shader for safety)
---@field clip_rect rect? Clip rectangle for scissor testing
---@field uv_rect rect? UV rect for texture mapping (nil = 0,0,1,1)
---@field alpha number Global opacity override (default: 1)
---@field rotation number Shape rotation in degrees
---@field anti_alias boolean Apply tesselation to shapes
---@field ignore_scaling boolean Ignore global DPI scale (default: true)
---@field chained_call boolean For shaders: don't update back buffer texture
---@field only_downsampled boolean Capture back buffer if true (and chained_call is false)
---@field capture_back_buffer boolean Alias for only_downsampled
---@field is_tile boolean Use tiling texture sampler
---@field mode render_mode Rendering mode
---@field set_texture fun(self: command, tex: texture) Sets a texture safely
---@field set_shader fun(self: command, sh: shader) Sets a fragment shader safely

---@class managed
---@field obj ptr Pointer to GPU object. Nil if object is not created
---@field create fun(self: managed) Creates the managed object in GPU memory. Should only be called once
---@field destroy fun(self: managed) Destroys the managed object in GPU memory. Never destroy while object is in use for rendering

---@class texture : managed
---@field is_animated boolean True if this is an animated_texture instance
---@field get_size fun(self: texture): vec2 Returns the texture dimensions
---@field __call fun(path_or_data: string|ptr, size_or_w?: integer, h?: integer, p?: integer): texture Constructor for texture from file, memory, or RGBA data

---@class svg_texture : texture
---@field __call fun(svg: string, height?: number): svg_texture Constructs an SVG texture. Height of 0 means no automatic downscale

---@class animated_texture : texture
---@field __call fun(path_or_data: string|ptr, size?: integer): animated_texture Constructs animated texture from file or memory. Only supports GIF format

---@class shader : managed
---@field __call fun(src: string): shader Constructs a shader from HLSL source code (ps_4_0)
---@comment Constant buffer (register b0):
---@comment - mvp (float4x4): Projection matrix
---@comment - tex (float2): Texture dimensions
---@comment - time (float): Render time
---@comment - alpha (float): Global opacity override
---@comment Input structure:
---@comment - pos (float4): Vertex position [SV_POSITION]
---@comment - col (float4): Vertex color [COLOR0]
---@comment - uv (float2): UV coordinates [TEXCOORD0]
---@comment Bound objects:
---@comment - sampler0 (sampler): Texture sampler
---@comment - texture0 (Texture2D): Texture object

---@class font_flags
---@field shadow any Adds 1px shadow to font glyphs
---@field outline any Adds 1px outline to font glyphs
---@field anti_alias any Enable antialiasing (GDI fonts only)
---@field no_dpi any Disable DPI scaling
---@field no_kern any Disable glyph kerning
---@field mono any Strong hinting algorithm (FreeType only)
---@field light any Light hinting algorithm (FreeType only)

---@class glyph_t
---@field codepoint integer Character codepoint
---@field size vec2 Glyph dimensions
---@field offset vec2 Glyph offset
---@field uv rect UV rect on the texture atlas

---@class font_base : managed
---@field height number Font height in pixels
---@field ascent number Font ascent value in pixels
---@field descent number Font descent value in pixels
---@field line_gap number Font line gap in pixels
---@field kerning_gap number Font kerning gap in pixels
---@field outline_alpha number Font outline opacity (0-1), default 0.45
---@field flags font_flags Font flags (use bit library to read)
---@field y_offset integer Glyph Y offset in pixels
---@field x_offset integer Glyph X offset in pixels
---@field fallback_font font_base Fallback font for missing glyphs
---@field dropshadow_color color Shadow color (RGB only)
---@field get_kerned_char_width fun(self: font_base, left: integer, right: integer): number Returns character width with kerning
---@field get_kerning fun(self: font_base, cp: integer): number Returns kerning value for a character
---@field get_text_size fun(self: font_base, text: string, skip_scaling?: boolean, til_newline?: boolean): vec2 Returns text area size
---@field wrap_text fun(self: font_base, text: string, width: number): string Wraps text to meet desired width
---@field get_glyph fun(self: font_base, codepoint: integer): glyph_t Returns glyph information
---@field get_texture fun(self: font_base, gl: glyph_t): integer|nil Returns texture atlas containing the glyph

---@class font : font_base
---@field __call fun(path_or_mem: string|ptr, size: number, flags?: font_flags, min?: integer, max?: integer, sz?: integer): font Constructs a FreeType font from file or memory

---@class font_gdi : font_base
---@field __call fun(name: string, size: number, flags?: font_flags, min?: integer, max?: integer, weight?: integer): font_gdi Constructs a GDI font from system font

-- Rendering system of the software.
_G.draw = draw