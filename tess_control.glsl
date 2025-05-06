#version 410 core
layout(vertices = 4) out; 

void main() {
   
    gl_out[gl_InvocationID].gl_Position = gl_in[gl_InvocationID].gl_Position;
    
    if (gl_InvocationID == 0) {
        
        gl_TessLevelOuter[0] = float(gl_PatchVerticesIn) * 5.0;  // To smoothen out the curve depends on the number of vertices inputted at this time
        gl_TessLevelOuter[1] = float(gl_PatchVerticesIn) * 5.0;  
    }
}