#version 410 core
layout(vertices = 3) out;

void main() {
    gl_out[gl_InvocationID].gl_Position = gl_in[gl_InvocationID].gl_Position;

    if (gl_InvocationID == 0) {
        gl_TessLevelOuter[0] = 20.0;
        gl_TessLevelOuter[1] = 20.0;
    }
}
