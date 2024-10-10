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
  col = color;
  if (mode == 0) {
    col = color;
  } else if (mode == 1) {
    col = color;
  } else if (mode == 2) {
    col = color;
  } else if (mode == 3) {
    col = color;
  }
  
  gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0f);
  // col = color;
}

