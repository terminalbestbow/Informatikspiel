RSRC                    VisualShader            ��������                                                  resource_local_to_scene    resource_name    code    graph_offset    mode    flags/collision_use_scale    flags/disable_force    flags/disable_velocity    flags/keep_data    nodes/vertex/0/position    nodes/vertex/connections    nodes/fragment/0/position    nodes/fragment/connections    nodes/light/0/position    nodes/light/connections    nodes/start/0/position    nodes/start/connections    nodes/process/0/position    nodes/process/connections    nodes/collide/0/position    nodes/collide/connections    nodes/start_custom/0/position    nodes/start_custom/connections     nodes/process_custom/0/position !   nodes/process_custom/connections    nodes/sky/0/position    nodes/sky/connections    nodes/fog/0/position    nodes/fog/connections    script           local://VisualShader_6l2sp �         VisualShader          �  shader_type particles;


float __rand_from_seed(inout uint seed) {
	int k;
	int s = int(seed);
	if (s == 0)
	s = 305420679;
	k = s / 127773;
	s = 16807 * (s - k * 127773) - 2836 * k;
	if (s < 0)
		s += 2147483647;
	seed = uint(s);
	return float(seed % uint(65536)) / 65535.0;
}

float __rand_from_seed_m1_p1(inout uint seed) {
	return __rand_from_seed(seed) * 2.0 - 1.0;
}

float __randf_range(inout uint seed, float from, float to) {
	return __rand_from_seed(seed) * (to - from) + from;
}

uint __hash(uint x) {
	x = ((x >> uint(16)) ^ x) * uint(73244475);
	x = ((x >> uint(16)) ^ x) * uint(73244475);
	x = (x >> uint(16)) ^ x;
	return x;
}

mat3 __build_rotation_mat3(vec3 axis, float angle) {
	axis = normalize(axis);
	float s = sin(angle);
	float c = cos(angle);
	float oc = 1.0 - c;
	return mat3(vec3(oc * axis.x * axis.x + c, oc * axis.x * axis.y - axis.z * s, oc * axis.z * axis.x + axis.y * s), vec3(oc * axis.x * axis.y + axis.z * s, oc * axis.y * axis.y + c, oc * axis.y * axis.z - axis.x * s), vec3(oc * axis.z * axis.x - axis.y * s, oc * axis.y * axis.z + axis.x * s, oc * axis.z * axis.z + c));
}

mat4 __build_rotation_mat4(vec3 axis, float angle) {
	axis = normalize(axis);
	float s = sin(angle);
	float c = cos(angle);
	float oc = 1.0 - c;
	return mat4(vec4(oc * axis.x * axis.x + c, oc * axis.x * axis.y - axis.z * s, oc * axis.z * axis.x + axis.y * s, 0), vec4(oc * axis.x * axis.y + axis.z * s, oc * axis.y * axis.y + c, oc * axis.y * axis.z - axis.x * s, 0), vec4(oc * axis.z * axis.x - axis.y * s, oc * axis.y * axis.z + axis.x * s, oc * axis.z * axis.z + c, 0), vec4(0, 0, 0, 1));
}

vec2 __get_random_unit_vec2(inout uint seed) {
	return normalize(vec2(__rand_from_seed_m1_p1(seed), __rand_from_seed_m1_p1(seed)));
}

vec3 __get_random_unit_vec3(inout uint seed) {
	return normalize(vec3(__rand_from_seed_m1_p1(seed), __rand_from_seed_m1_p1(seed), __rand_from_seed_m1_p1(seed)));
}

void start() {
	uint __seed = __hash(NUMBER + uint(1) + RANDOM_SEED);

	{
// StartOutput:0
		if (RESTART_POSITION) {
			TRANSFORM = mat4(vec4(1.0, 0.0, 0.0, 0.0), vec4(0.0, 1.0, 0.0, 0.0), vec4(0.0, 0.0, 1.0, 0.0), vec4(0.0, 0.0, 0.0, 1.0));
			if (RESTART_VELOCITY) {
				VELOCITY = (EMISSION_TRANSFORM * vec4(VELOCITY, 0.0)).xyz;
			}
			TRANSFORM = EMISSION_TRANSFORM * TRANSFORM;
		}


	}
}

                                                        RSRC