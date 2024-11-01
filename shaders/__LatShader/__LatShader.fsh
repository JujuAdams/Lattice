varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D u_sForeground;

void main()
{
    gl_FragColor = v_vColour*texture2D(u_sForeground, v_vTexcoord)*texture2D(gm_BaseTexture, v_vTexcoord);
}
