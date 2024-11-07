varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 u_vLayerSize;
uniform vec2 u_vCellSize;
uniform vec2 u_vSymbolsSize;
uniform vec2 u_vSymbolsDimensions;

uniform sampler2D u_sSymbols;

void main()
{
    vec4 symbolRGBA = texture2D(gm_BaseTexture, v_vTexcoord);
    vec4 background = texture2D(gm_BaseTexture, v_vTexcoord + vec2(1.0/3.0, 0.0));
    vec4 foreground = texture2D(gm_BaseTexture, v_vTexcoord + vec2(2.0/3.0, 0.0));
    
    float symbol = 255.0*(symbolRGBA.r + 256.0*symbolRGBA.g);
    vec2  symbolCoord = vec2(mod(symbol, u_vSymbolsSize.x), floor(symbol / u_vSymbolsSize.x));
    symbolCoord /= u_vSymbolsSize;
    
    vec2 symbolUV = mod(vec2(3.0, 1.0)*v_vTexcoord*u_vLayerSize, 1.0);
    vec4 sample = texture2D(u_sSymbols, symbolCoord + symbolUV*(u_vCellSize / u_vSymbolsDimensions));
    
    gl_FragColor = mix(background, foreground, sample.a);
}
