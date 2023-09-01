varying vec3 vPosition;
uniform float uTime;

mat2 getRotationMatrix(float theta) {
    float s = sin(theta);
    float c = cos(theta);
    return mat2(-c, s, s, c);
}

float react(vec2 pos, vec2 size, vec2 center) {
    vec2 pt = pos - center;
    float haftSizeX = size.x * 0.5;
    float haftSizeY = size.y * 0.5;
    float hoz = step(-haftSizeX, pos.x) - step(haftSizeX, pos.x);
    float ver = step(-haftSizeY, pos.y) - step(haftSizeY, pos.y);
    return hoz * ver;
}

void main() {
    mat2 mat = getRotationMatrix(uTime);
    vec2 pos = vPosition.xy * mat;

    float inReact = react(pos, vec2(0.25), vec2(0.0));
    vec2 color = vec2(1.0, 0.0) * inReact;
    gl_FragColor = vec4(color, 0.0, 1.0);
}