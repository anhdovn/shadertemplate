uniform vec2 uResolution;
varying vec2 vUv;
varying vec3 vPosition;

float react(vec2 pos, vec2 size, vec2 center) {
    vec2 p = pos - center;
    float halfX = size.x * 0.5;
    float halfY = size.y * 0.5;

    float hoz = step(-halfX, p.x) - step(halfX, p.x);
    float ver = step(-halfY, p.y) - step(halfY, p.y);

    return hoz * ver;
}

void main() {

    float inReact1 = react(vPosition.xy, vec2(0.25, 0.125), vec2(0.5, 0.75));
    float inReact2 = react(vPosition.xy, vec2(0.25, 0.125), vec2(-0.5, 0.75));
    vec2 color = vec2(1.0, 1.0) * inReact1 + vec2(1.0, 0.0) * inReact2;

    gl_FragColor = vec4(color, 0.0, 1.0);
}