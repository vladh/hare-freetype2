use ft = freetype2;

export fn main() void = {
	let library: ft::FT_Library = null;
	ft::FT_Init_FreeType(&library);
};
