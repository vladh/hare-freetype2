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
export type FT_CharMap = *FT_CharMapRec;
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
	platform_id: u8,
	encoding_id: u8,
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
export type FT_GlyphSlot = *FT_GlyphSlotRec;
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
export type FT_Bitmap = struct {
	rows: u32,
	width: u32,
	pitch: i32,
	buffer: *char,
	num_grays: u8,
	pixel_mode: char,
	palette_mode: char,
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
export type FT_Face = *FT_FaceRec;
export type FT_Driver = nullable *void;
export type FT_Memory = nullable *void;
export type FT_Stream = *FT_StreamRec;
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
export type FT_List = *FT_ListRec;
export type FT_ListNode = *FT_ListNodeRec;
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

	face_flags: i64,
	style_flags: i64,

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

export @symbol("FT_Init_FreeType") fn FT_Init_FreeType(
	alibrary: *FT_Library
) FT_Error;
