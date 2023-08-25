import "/style.css";
import * as THREE from "three";
import { OrbitControls } from "three/examples/jsm/controls/OrbitControls.js";
import * as dat from "lil-gui";
import vertexShader from "/shaders/learnNikLever/vertex.glsl";
import fragmentShader from "/shaders/learnNikLever/fragment.glsl";

/**
 * Base
 */
// Debug
const gui = new dat.GUI();

// Canvas
const canvas = document.querySelector("canvas.webgl");

// Scene
const scene = new THREE.Scene();

/**
 * Test mesh
 */
// Geometry
const geometry = new THREE.PlaneGeometry(2, 2, 32, 32);

// Texture
const texture = new THREE.TextureLoader().load("/textures/flag-french.jpg");
console.log(texture);
// Material
const uniforms = {
  uMouse: { value: { x: 0.0, y: 0.0 } },
  uResolution: { value: { x: window.innerWidth, y: window.innerHeight } }
}

const material = new THREE.ShaderMaterial({
  vertexShader: vertexShader,
  fragmentShader: fragmentShader,
  side: THREE.DoubleSide,
  uniforms: uniforms
});

// Mesh
const mesh = new THREE.Mesh(geometry, material);
scene.add(mesh);


/**
 * Mousemove
*/
const mouseMove = (event) => {
  uniforms.uMouse.value.x = event.touches ? event.touches[0].clientX : event.clientX
  uniforms.uMouse.value.y = event.touches ? event.touches[0].clientY : event.clientY
}

if ('ontouchstart' in window) {
  document.addEventListener('touchmove', mouseMove)
} else {
  document.addEventListener('mousemove', mouseMove)
}


/**
 * Sizes
 */
const sizes = {
  width: window.innerWidth,
  height: window.innerHeight,
};

window.addEventListener("resize", () => {
  // Update sizes
  sizes.width = window.innerWidth;
  sizes.height = window.innerHeight;

  // Update camera
  camera.aspect = sizes.width / sizes.height;
  camera.updateProjectionMatrix();

  // Update renderer
  renderer.setSize(sizes.width, sizes.height);
  renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2));

  // Update Resolution
  uniforms.uResolution.value.x = window.innerWidth
  uniforms.uResolution.value.y = window.innerHeight
});

/**
 * Camera
 */
// Base camera
const camera = new THREE.OrthographicCamera(
  -1,
  1,
  1,
  -1,
  0.1,
  10
);
camera.position.set(0, 0, 1);
scene.add(camera);

// Controls
const controls = new OrbitControls(camera, canvas);
controls.enableDamping = true;
controls.enabled = false;

/**
 * Renderer
 */
const renderer = new THREE.WebGLRenderer({
  canvas: canvas,
});
renderer.setSize(sizes.width, sizes.height);
renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2));

/**
 * Animate
 */
const clock = new THREE.Clock();
const tick = () => {
  // Update controls
  controls.update();
  const elapsedTime = clock.getElapsedTime();
  // update uTime
  // material.uniforms.uTime.value = elapsedTime;

  // Render
  renderer.render(scene, camera);

  // Call tick again on the next frame
  window.requestAnimationFrame(tick);
};

tick();
