use fmt;
use ft = freetype2;

def FONT_PATH: str = "/usr/share/fonts/noto-cjk/NotoSerifCJK-Regular.ttc";
def FONT_SIZE: u32 = 32;

export fn main() void = {
	let library: ft::FT_Library = null;
	ft::FT_Init_FreeType(&library);

	let face: ft::FT_Face = null;
	const status = ft::FT_New_Face(library, FONT_PATH, 0, &face);
	if (status != 0) {
		fmt::printfln("could not load face: (path {}) (status {})",
			FONT_PATH, status: int)!;
	};

	ft::FT_Set_Pixel_Sizes(face, 0, FONT_SIZE);

	if (ft::FT_Is_Scalable(face)) {
		fmt::printfln("face is not scalable")!;
	};

	let slot: ft::FT_GlyphSlot = (face as *ft::FT_FaceRec).glyph;
	const status = ft::FT_Load_Char(face, 'E', ft::FT_Load_Flag::FT_LOAD_RENDER);
	if (status != 0) {
		fmt::println("could not load char")!;
	};

	ft::FT_Done_Face(face);
};
