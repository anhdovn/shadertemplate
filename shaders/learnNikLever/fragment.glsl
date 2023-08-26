uniform float uTime;

void main() {
    gl_FragColor = vec4((sin(uTime) + 1.0) / 2.0, (cos(uTime) + 1.0) / 2.0, (sin(uTime) + 1.0) / 2.0, 1.0);
}