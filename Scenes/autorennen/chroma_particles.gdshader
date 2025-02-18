shader_type canvas_item;

uniform float timescale = 3;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	float time_scaled = TIME * timescale;
	COLOR.rgb = vec3(abs(sin(time_scaled)), abs(sin(time_scaled + PI/3.0)), abs(sin(time_scaled + 2.0*PI/3.0)));
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
