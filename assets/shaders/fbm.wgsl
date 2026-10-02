#import bevy_pbr::{
    mesh_view_bindings::globals,
    forward_io::VertexOutput,
    mesh_functions::{get_world_from_local, mesh_position_local_to_clip}
}

struct Vertex {
    @builtin(instance_index) instance_index: u32,
    @location(0) position: vec3<f32>,
};

@vertex
fn vertex(vertex: Vertex) -> VertexOutput {
    var out: VertexOutput;
    out.position = mesh_position_local_to_clip(
        get_world_from_local(vertex.instance_index),
        vec4<f32>(vertex.position, 1.0),
    ); 
    return out;
}


@fragment
fn fragment(in: VertexOutput) -> @location(0) vec4<f32> {
    var p = in.uv;
    var cv = fbm(p);
    return vec4<f32>(cv, cv, cv, 1.0);
}

// See https://gist.github.com/munrocket/236ed5ba7e409b8bdf1ff6eca5dcdc39
// MIT License. © Stefan Gustavson, Munrocket

fn permute4(x: vec4f) -> vec4f { return ((x * 34. + 1.) * x) % vec4f(289.); }
fn fade2(t: vec2f) -> vec2f { return t * t * t * (t * (t * 6. - 15.) + 10.); }

fn perlinNoise2(P: vec2f) -> f32 {
    var Pi: vec4f = floor(P.xyxy) + vec4f(0., 0., 1., 1.);
    let Pf = fract(P.xyxy) - vec4f(0., 0., 1., 1.);
    Pi = Pi % vec4f(289.); // To avoid truncation effects in permutation
    let ix = Pi.xzxz;
    let iy = Pi.yyww;
    let fx = Pf.xzxz;
    let fy = Pf.yyww;
    let i = permute4(permute4(ix) + iy);
    var gx: vec4f = 2. * fract(i * 0.0243902439) - 1.; // 1/41 = 0.024...
    let gy = abs(gx) - 0.5;
    let tx = floor(gx + 0.5);
    gx = gx - tx;
    var g00: vec2f = vec2f(gx.x, gy.x);
    var g10: vec2f = vec2f(gx.y, gy.y);
    var g01: vec2f = vec2f(gx.z, gy.z);
    var g11: vec2f = vec2f(gx.w, gy.w);
    let norm = 1.79284291400159 - 0.85373472095314 *
        vec4f(dot(g00, g00), dot(g01, g01), dot(g10, g10), dot(g11, g11));
    g00 = g00 * norm.x;
    g01 = g01 * norm.y;
    g10 = g10 * norm.z;
    g11 = g11 * norm.w;
    let n00 = dot(g00, vec2f(fx.x, fy.x));
    let n10 = dot(g10, vec2f(fx.y, fy.y));
    let n01 = dot(g01, vec2f(fx.z, fy.z));
    let n11 = dot(g11, vec2f(fx.w, fy.w));
    let fade_xy = fade2(Pf.xy);
    let n_x = mix(vec2f(n00, n01), vec2f(n10, n11), vec2f(fade_xy.x));
    let n_xy = mix(n_x.x, n_x.y, fade_xy.y);
    return 2.3 * n_xy;
}

//  MIT License. © Inigo Quilez, Munrocket
//  noise2() is any noise here: Value, Perlin, Simplex, Worley

fn fbm(p_in: vec2f) -> f32 {
    var p = p_in;
    var m2: mat2x2f = mat2x2f(vec2f(0.8, 0.6), vec2f(-0.6, 0.8));
    var f: f32 = 0.;
    f = f + 0.5000 * perlinNoise2(p); p = m2 * p * 2.02;
    f = f + 0.2500 * perlinNoise2(p); p = m2 * p * 2.03;
    f = f + 0.1250 * perlinNoise2(p); p = m2 * p * 2.01;
    f = f + 0.0625 * perlinNoise2(p);
    return f / 0.9375;
}
