#version 150

in vec3 position;
in vec4 color;
in vec2 texCoord;
out vec4 col;

uniform mat4 modelViewMatrix;
uniform mat4 projectionMatrix;
uniform int mode;
uniform sampler2D heightmapTexture;
uniform float texelSizeS;
uniform float texelSizeT;

void main()
{
    vec3 newPosition = position;

    if (mode == 3) // Smooth mode
    {
        float s = texCoord.s;
        float t = texCoord.t;

        // Sample the heightmap texture at neighboring positions
        float height_center = texture(heightmapTexture, vec2(s, t)).r;
        float height_left = texture(heightmapTexture, vec2(s - texelSizeS, t)).r;
        float height_right = texture(heightmapTexture, vec2(s + texelSizeS, t)).r;
        float height_down = texture(heightmapTexture, vec2(s, t - texelSizeT)).r;
        float height_up = texture(heightmapTexture, vec2(s, t + texelSizeT)).r;

        // Compute the average height
        float avgHeight = (height_center + height_left + height_right + height_down + height_up) / 5.0;

        // Update the vertex's Y position
        newPosition.y = avgHeight * 0.1; // Adjust scaling as needed
    }

    col = color;
    gl_Position = projectionMatrix * modelViewMatrix * vec4(newPosition, 1.0f);
}