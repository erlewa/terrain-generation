shader_type spatial;

uniform sampler2D fbm : source_color, filter_nearest; 

ivec2 get_tex_pixel_coord(vec2 uv) {
	ivec2 t_size = textureSize(fbm, 0);
	vec2 pixel = uv * vec2(t_size);
	return ivec2(pixel);
}	

// Calculate Normal with a Sobel Kernel
vec3 compute_normal(vec2 uv) {
	ivec2 pixel = get_tex_pixel_coord(uv);
	
	//         -y
	//      tl t tr
	//  -x  l    r   +x
	//      bl b br
	//         +y
	
	float tr = texelFetch(fbm, pixel + ivec2(1, -1),  0).r;
	float t  = texelFetch(fbm, pixel + ivec2(0, -1),  0).r;
	float tl = texelFetch(fbm, pixel + ivec2(-1, -1), 0).r;
	float l  = texelFetch(fbm, pixel + ivec2(-1, 0),  0).r;
	float bl = texelFetch(fbm, pixel + ivec2(-1, 1),  0).r;
	float b  = texelFetch(fbm, pixel + ivec2(0, 1),   0).r;
	float br = texelFetch(fbm, pixel + ivec2(1, 1),   0).r;
	float r  = texelFetch(fbm, pixel + ivec2(1, 0),   0).r;

	float dx = (tr + 2.0*r + br) - (tl + 2.0*l + bl);
	float dy = (bl + 2.0*b + br) - (tl + 2.0*t + tr);
	
    return normalize(vec3(dx, dy, 1.0));
}

// \(d_x = \frac{\text{height}(x+1, y) - \text{height}(x-1, y)}{2}\)
// \(d_y = \frac{\text{height}(x, y+1) - \text{height}(x, y-1)}{2}\)
void vertex() {
	VERTEX = vec3(VERTEX.x, texture(fbm, UV).r, VERTEX.z);
	NORMAL = compute_normal(UV);
}

void fragment() {
	// Called for every pixel the material is visible on.
	ALBEDO = texture(fbm, UV).rgb;
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
