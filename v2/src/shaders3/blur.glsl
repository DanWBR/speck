#version 300 es
precision highp float;

in vec3 aPosition;

void main() {
    gl_Position = vec4(aPosition, 1);
}


// __split__
#version 300 es
precision highp float;

uniform sampler2D uTexture;
uniform float uRes;
uniform int leftRight;

out vec4 myOutputColor;

void main() {
    vec2 dir;
    if (leftRight == 1) {
        dir = vec2(1,0)/uRes;
    } else {
        dir = vec2(0,1)/uRes;
    }
    const int range = 16;
    vec4 sample = vec4(0,0,0,0);
    for (int i = -range; i <= range; i++) {
        vec2 p = gl_FragCoord.xy/uRes + dir * float(i);
        sample += texture(uTexture, p);
    }
    sample /= float(range) * 2.0 + 1.0;
    myOutputColor = sample;
}
