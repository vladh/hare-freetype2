use strings;

export type FT_Error = int;
export type FT_Pos = i64;
export type FT_Fixed = i64;
export type FT_Bitmap_Size = struct {
	height: i8,
	width: i8,
	sz: FT_Pos,
	x_ppem: FT_Pos,
	y_ppem: FT_Pos,
};
export type FT_CharMap = nullable *FT_CharMapRec;
export type FT_Encoding = enum {
	// TODO
	FT_ENCODING_NONE,
	FT_ENCODING_MS_SYMBOL,
	FT_ENCODING_UNICODE,
	FT_ENCODING_SJIS,
	FT_ENCODING_PRC,
	FT_ENCODING_BIG5,
	FT_ENCODING_WANSUNG,
	FT_ENCODING_JOHAB,
	GB2312 = FT_ENCODING_PRC,
	MS_SJIS = FT_ENCODING_SJIS,
	MS_GB2312 = FT_ENCODING_PRC,
	MS_BIG5 = FT_ENCODING_BIG5,
	MS_WANSUNG = FT_ENCODING_WANSUNG,
	MS_JOHAB = FT_ENCODING_JOHAB,
	FT_ENCODING_ADOBE_STANDARD,
	FT_ENCODING_ADOBE_EXPERT,
	FT_ENCODING_ADOBE_CUSTOM,
	FT_ENCODING_ADOBE_LATIN_1,
	FT_ENCODING_OLD_LATIN_2,
	FT_ENCODING_APPLE_ROMAN,
};
export type FT_CharMapRec = struct {
	face: FT_Face,
	encoding: FT_Encoding,
	platform_id: u16,
	encoding_id: u16,
};
export type FT_Generic_Finalizer = fn(object: nullable *void) void;
export type FT_Generic = struct {
	data: nullable *void,
	finalizer: *FT_Generic_Finalizer,
};
export type FT_BBox = struct {
	xMin: FT_Pos,
	yMin: FT_Pos,
	xMax: FT_Pos,
	yMax: FT_Pos,
};
export type FT_Glyph_Metrics = struct {
	width: FT_Pos,
	height: FT_Pos,
	horiBearingX: FT_Pos,
	horiBearingY: FT_Pos,
	horiAdvance: FT_Pos,
	vertBearingX: FT_Pos,
	vertBearingY: FT_Pos,
	vertAdvance: FT_Pos,
};
export type FT_GlyphSlot = nullable *FT_GlyphSlotRec;
export type FT_Vector = struct {
	x: FT_Pos,
	y: FT_Pos,
};
export type FT_Glyph_Format = enum {
	// TODO
	FT_GLYPH_FORMAT_NONE,
	FT_GLYPH_FORMAT_COMPOSITE,
	FT_GLYPH_FORMAT_BITMAP,
	FT_GLYPH_FORMAT_OUTLINE,
	FT_GLYPH_FORMAT_PLOTTER,
	FT_GLYPH_FORMAT_SVG,
};
export type FT_Pixel_Mode = enum {
	FT_PIXEL_MODE_NONE,
	FT_PIXEL_MODE_MONO,
	FT_PIXEL_MODE_GRAY,
	FT_PIXEL_MODE_GRAY2,
	FT_PIXEL_MODE_GRAY4,
	FT_PIXEL_MODE_LCD,
	FT_PIXEL_MODE_LCD_V,
	FT_PIXEL_MODE_BGRA,
	FT_PIXEL_MODE_MAX,
};
export type FT_Render_Mode = enum {
	FT_RENDER_MODE_NORMAL,
	FT_RENDER_MODE_LIGHT,
	FT_RENDER_MODE_MONO,
	FT_RENDER_MODE_LCD,
	FT_RENDER_MODE_LCD_V,
	FT_RENDER_MODE_SDF,
	FT_RENDER_MODE_MAX,
};
export type FT_Bitmap = struct {
	rows: u32,
	width: u32,
	pitch: i32,
	buffer: *u8,
	num_grays: u16,
	pixel_mode: u8,
	palette_mode: u8,
	palette: nullable *void,
};
export type FT_Outline = struct {
	n_contours: i16,
	n_points: i16,
	points: *FT_Vector,
	tags: *char,
	contours: *i16,
	flags: i32,
};
export type FT_SubGlyph = nullable *void;
export type FT_Slot_Internal = nullable *void;
export type FT_GlyphSlotRec = struct {
	library: FT_Library,
	face: FT_Face,
	next: FT_GlyphSlot,
	glyph_index: u32,
	generic: FT_Generic,
	metrics: FT_Glyph_Metrics,
	linearHoriAdvance: FT_Fixed,
	linearVertAdvance: FT_Fixed,
	advance: FT_Vector,
	format: FT_Glyph_Format,
	bitmap: FT_Bitmap,
	bitmap_left: i32,
	bitmap_top: i32,
	outline: FT_Outline,
	num_subglyphs: u32,
	subglyphs: FT_SubGlyph,
	control_data: nullable *void,
	control_len: i64,
	lsb_delta: FT_Pos,
	rsb_delta: FT_Pos,
	other: nullable *void,
	internal: FT_Slot_Internal,
};
export type FT_Library = nullable *void;
export type FT_Face = nullable *FT_FaceRec;
export type FT_Driver = nullable *void;
export type FT_Memory = nullable *void;
export type FT_Stream = nullable *FT_StreamRec;
export type FT_StreamDesc = struct {
	value: i64,
	pointer: nullable *void,
};
export type FT_Stream_IoFunc = fn(
	stream: FT_Stream,
	offset_: u64,
	buffer: *char,
	count: u64
) u64;

export type FT_Stream_CloseFunc = fn(
	stream: FT_Stream,
) void;
export type FT_StreamRec = struct {
	base: *char,
	sz: u64,
	pos: u64,
	descriptor: FT_StreamDesc,
	pathname: FT_StreamDesc,
	read: *FT_Stream_IoFunc,
	close: *FT_Stream_CloseFunc,
	memory: FT_Memory,
	cursor: *char,
	limit: *char,
};
export type FT_List = nullable *FT_ListRec;
export type FT_ListNode = nullable *FT_ListNodeRec;
export type FT_ListNodeRec = struct {
	prev: FT_ListNode,
	next: FT_ListNode,
	data: nullable *void,
};
export type FT_ListRec = struct {
	head: FT_ListNode,
	tail: FT_ListNode,
};
export type FT_Face_Internal = nullable *void;
export type FT_FaceRec = struct {
	num_faces: i64,
	face_index: i64,
	face_flags: u64,
	style_flags: u64,
	num_glyphs: i64,
	family_name: *char,
	style_name: *char,
	num_fixed_sizes: i32,
	available_sizes: *FT_Bitmap_Size,
	num_charmaps: i32,
	charmaps: *FT_CharMap,
	generic: FT_Generic,
	bbox: FT_BBox,
	units_per_EM: u16,
	ascender: i16,
	descender: i16,
	height: i16,
	max_advance_width: i16,
	max_advance_height: i16,
	underline_position: i16,
	underline_thickness: i16,
	glyph: FT_GlyphSlot,
	sz: size,
	charmap: FT_CharMap,
	driver: FT_Driver,
	memory: FT_Memory,
	stream: FT_Stream,
	sizes_list: FT_ListRec,
	autohint: FT_Generic,
	extensions: nullable *void,
	internal: FT_Face_Internal,
};

export type FT_Face_Flag = enum u64 {
	FT_FACE_FLAG_SCALABLE = 0,
	FT_FACE_FLAG_FIXED_SIZES = 1u64 << 1,
	FT_FACE_FLAG_FIXED_WIDTH = 1u64 << 2,
	FT_FACE_FLAG_SFNT = 1u64 << 3,
	FT_FACE_FLAG_HORIZONTAL = 1u64 << 4,
	FT_FACE_FLAG_VERTICAL = 1u64 << 5,
	FT_FACE_FLAG_KERNING = 1u64 << 6,
	FT_FACE_FLAG_FAST_GLYPHS = 1u64 << 7,
	FT_FACE_FLAG_MULTIPLE_MASTERS = 1u64 << 8,
	FT_FACE_FLAG_GLYPH_NAMES = 1u64 << 9,
	FT_FACE_FLAG_EXTERNAL_STREAM = 1u64 << 10,
	FT_FACE_FLAG_HINTER = 1u64 << 11,
	FT_FACE_FLAG_CID_KEYED = 1u64 << 12,
	FT_FACE_FLAG_TRICKY = 1u64 << 13,
	FT_FACE_FLAG_COLOR = 1u64 << 14,
	FT_FACE_FLAG_VARIATION = 1u64 << 15,
	FT_FACE_FLAG_SVG = 1u64 << 16,
	FT_FACE_FLAG_SBIX = 1u64 << 17,
	FT_FACE_FLAG_SBIX_OVERLAY = 1u64 << 18,
};

export type FT_Load_Flag = enum u32 {
	FT_LOAD_DEFAULT = 0,
	FT_LOAD_NO_SCALE = 1u32 << 0,
	FT_LOAD_NO_HINTING = 1u32 << 1,
	FT_LOAD_RENDER = 1u32 << 2,
	FT_LOAD_NO_BITMAP = 1u32 << 3,
	FT_LOAD_VERTICAL_LAYOUT = 1u32 << 4,
	FT_LOAD_FORCE_AUTOHINT = 1u32 << 5,
	FT_LOAD_CROP_BITMAP = 1u32 << 6,
	FT_LOAD_PEDANTIC = 1u32 << 7,
	FT_LOAD_IGNORE_GLOBAL_ADVANCE_WIDTH = 1u32 << 9,
	FT_LOAD_NO_RECURSE = 1u32 << 10,
	FT_LOAD_IGNORE_TRANSFORM = 1u32 << 11,
	FT_LOAD_MONOCHROME = 1u32 << 12,
	FT_LOAD_LINEAR_DESIGN = 1u32 << 13,
	FT_LOAD_SBITS_ONLY = 1u32 << 14,
	FT_LOAD_NO_AUTOHINT = 1u32 << 15,
	FT_LOAD_COLOR = 1u32 << 20,
	FT_LOAD_COMPUTE_METRICS = 1u32 << 21,
	FT_LOAD_BITMAP_METRICS_ONLY = 1u32 << 22,
	FT_LOAD_ADVANCE_ONLY = 1u32 << 8,
	FT_LOAD_SVG_ONLY = 1u32 << 23,
};

export @symbol("FT_Init_FreeType") fn FT_Init_FreeType(
	alibrary: *FT_Library,
) FT_Error;

export @symbol("FT_Done_FreeType") fn FT_Done_FreeType(
	library: FT_Library,
) FT_Error;

@symbol("FT_New_Face") fn _FT_New_Face(
	library: FT_Library,
	filepathname: *const char,
	face_index: i64,
	aface: *FT_Face,
) FT_Error;
export fn FT_New_Face(
	library: FT_Library,
	filepathname: str,
	face_index: i64,
	aface: *FT_Face,
) FT_Error = {
	return _FT_New_Face(library, strings::to_c(filepathname), face_index, aface);
};

export @symbol("FT_Done_Face") fn FT_Done_Face(
	face: FT_Face,
) FT_Error;

export @symbol("FT_Set_Pixel_Sizes") fn FT_Set_Pixel_Sizes(
	face: FT_Face,
	pixel_width: u32,
	pixel_height: u32,
) FT_Error;

export fn FT_Is_Scalable(face: FT_Face) bool = {
	const f = face as *FT_FaceRec;
	return ~(f.face_flags & FT_Face_Flag::FT_FACE_FLAG_SCALABLE: u64) == 0;
};

export @symbol("FT_Load_Char") fn FT_Load_Char(
	face: FT_Face,
	char_code: u64,
	load_flags: u64,
) FT_Error;

export @symbol("FT_Render_Glyph") fn FT_Render_Glyph(
	slot: FT_GlyphSlot,
	render_mode: FT_Render_Mode,
) FT_Error;

export @symbol("FT_Load_Glyph") fn FT_Load_Glyph(
	face: FT_Face,
	glyph_index: u32,
	load_flags: FT_Load_Flag,
) FT_Error;

export @symbol("FT_Get_Char_Index") fn FT_Get_Char_Index(
	face: FT_Face,
	charcode: u64,
) u32;
