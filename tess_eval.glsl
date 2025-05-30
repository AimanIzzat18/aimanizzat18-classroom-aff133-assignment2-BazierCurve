 #version 410 core
layout(isolines, equal_spacing) in;

void main() {
    float t = gl_TessCoord.x;
    
    
    int n = gl_PatchVerticesIn; 
    
    
    if (n == 2) {
        // Linear interpolation (straight line)
        gl_Position = mix(gl_in[0].gl_Position, gl_in[1].gl_Position, t); // The straight line between two point will be the bezier curve, detecting what's left of the points, it will be 0 and 1
    } 

    else if (n == 3) {                                                    // Based on the javascript info, formula of Bezier curve
        
        float u = 1.0 - t;
        float b0 = u * u;
        float b1 = 2.0 * u * t;
        float b2 = t * t;
        gl_Position = b0*gl_in[0].gl_Position + b1*gl_in[1].gl_Position + b2*gl_in[2].gl_Position;
    }
    else if (n == 4) {
        // Cubic B�zier curve (your original code)
        float u = 1.0 - t;
        float b0 = u * u * u;
        float b1 = 3.0 * u * u * t;
        float b2 = 3.0 * u * t * t;
        float b3 = t * t * t;
        gl_Position = b0*gl_in[0].gl_Position + b1*gl_in[1].gl_Position + 
                     b2*gl_in[2].gl_Position + b3*gl_in[3].gl_Position;
    }
    else {
        
        gl_Position = vec4(0.0);
    }
}