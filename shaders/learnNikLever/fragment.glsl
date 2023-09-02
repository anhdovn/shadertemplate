varying vec3 vPosition;
uniform float uTime;
varying vec2 vUv;

mat2 getRotationMatrix(float theta) {
    float s = sin(theta);
    float c = cos(theta);
    return mat2(-c, s, s, c);
}

float react(vec2 pos, vec2 size, vec2 center) {
    vec2 pt = pos - center;
    float haftSizeX = size.x * 0.5;
    float haftSizeY = size.y * 0.5;
    float hoz = step(-haftSizeX, pt.x) - step(haftSizeX, pt.x);
    float ver = step(-haftSizeY, pt.y) - step(haftSizeY, pt.y);
    return hoz * ver;
}

void main() {
    vec2 center = vec2(0.5);
    float tileCount = 3.0;
    mat2 mat = getRotationMatrix(uTime);
    vec2 p = fract(vUv * tileCount);
    vec2 pos = (mat * (p - center)) + center;

    float inReact = react(pos, vec2(0.25), center);
    vec2 color = vec2(1.0, 0.0) * inReact;
    gl_FragColor = vec4(color, 0.0, 1.0);
}