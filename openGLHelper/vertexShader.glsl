#version 150

in vec3 position;
in vec4 color;
out vec4 col;

uniform mat4 modelViewMatrix;
uniform mat4 projectionMatrix;
uniform int mode;

void main()
{
  // compute the transformed and projected vertex position (into gl_Position) 
  // compute the vertex color (into col)

  if (mode == 0) {
    // Render mode 0: Use the original color
    col = color;
  } else if (mode == 1) {
    // Render mode 1: Render in grayscale
    float gray = dot(color.rgb, vec3(0.299, 0.587, 0.114));
    col = vec4(vec3(gray), color.a);
  } else if (mode == 2) {
    // Render mode 2: Render with inverted colors
    col = vec4(vec3(1.0) - color.rgb, color.a);
  } else if (mode == 3) {
    // Render mode 3: Render with a solid color (e.g., red)
    col = vec4(1.0, 0.0, 0.0, 1.0);
  }
  
  gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0f);
  // col = color;
}

