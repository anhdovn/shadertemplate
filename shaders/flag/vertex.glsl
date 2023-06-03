uniform float uTime;
uniform vec2 uFrequency;

varying vec2 vUv;
void main() {
    vec4 modelPosition = modelMatrix * vec4(position, 1.0);
    modelPosition.z += sin(modelPosition.x * uFrequency.x - uTime) * 0.1;
    vec4 projectedPosition = projectionMatrix * viewMatrix * modelPosition;

    gl_Position = projectedPosition;

    vUv = uv;
}