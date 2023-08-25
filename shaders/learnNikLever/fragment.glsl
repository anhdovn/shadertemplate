uniform vec2 uMouse;
uniform vec2 uResolution;

void main() {
    gl_FragColor = vec4(uMouse.x / uResolution.x, uMouse.y / uResolution.y, 0.0, 1.0);
}