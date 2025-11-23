function aiColor3D(_r = 0, _g = 0, _b = 0) constructor {
	r = _r;
	g = _g;
	b = _b;
	
	/**
	 * Converts to a single variable color compatible with other game maker functions
	 */
	static to_gm_color = function() {
		return make_colour_rgb(r*255, g*255, b*255);
	}
}