varying vec4 v_vColour0;
varying vec4 v_vColour1;
varying vec2 v_vTexcoord;

void main()
{
    gl_FragColor = mix(v_vColour1, v_vColour0, texture2D(gm_BaseTexture, v_vTexcoord).a);
}
