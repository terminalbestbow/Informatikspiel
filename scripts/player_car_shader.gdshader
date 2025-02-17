shader_type canvas_item;

uniform float timescale = 3;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec3 replacement_color = vec3(0,0,0);
	float time_scaled = TIME * timescale;
	replacement_color = vec3(abs(sin(time_scaled)), abs(sin(time_scaled + PI/3.0)), abs(sin(time_scaled + 2.0*PI/3.0)));
	float color_length = length(COLOR.rgb * vec3(1,0,1));
	float green_filter = COLOR.g * (1.0 - step(0.01, color_length));
	COLOR.rgb = replacement_color * green_filter + COLOR.rgb * color_length;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
