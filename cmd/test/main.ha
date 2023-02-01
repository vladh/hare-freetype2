use fmt;
use ft = freetype2;

def FONT_PATH: str = "/usr/share/fonts/noto-cjk/NotoSerifCJK-Regular.ttc";

export fn main() void = {
	let library: ft::FT_Library = null;
	ft::FT_Init_FreeType(&library);

	let face: ft::FT_Face = null;
	let status = ft::FT_New_Face(library, FONT_PATH, 0, &face);
	if (status != 0) {
		fmt::printfln("could not load face: (path {}) (status {})",
			FONT_PATH, status: int)!;
	};

	ft::FT_Done_Face(face);
};
