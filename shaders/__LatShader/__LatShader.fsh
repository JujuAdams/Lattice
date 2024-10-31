varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 u_vLayerSize;
uniform vec2 u_vCellSize;
uniform vec2 u_vSymbolsSize;
uniform vec2 u_vSymbolsDimensions;

uniform sampler2D u_sSymbols;
uniform sampler2D u_sPalette;

void main()
{
    vec4 symbolRGBA = texture2D(gm_BaseTexture, v_vTexcoord);
    
    float symbol = 255.0*(symbolRGBA.r + 256.0*symbolRGBA.g);
    vec2  symbolCoord = vec2(mod(symbol, u_vSymbolsSize.x), floor(symbol / u_vSymbolsSize.x));
    symbolCoord /= u_vSymbolsSize;
    
    vec2 symbolUV = mod(v_vTexcoord*u_vLayerSize, 1.0);
    
    vec4 sample     = texture2D(u_sSymbols, symbolCoord + symbolUV*(u_vCellSize / u_vSymbolsDimensions));
    vec4 foreground = texture2D(u_sPalette, vec2(symbolRGBA.b, 0.0) + 0.5/256.0);
    vec4 background = texture2D(u_sPalette, vec2(symbolRGBA.a, 0.0) + 0.5/256.0);
    
    gl_FragColor = mix(background, foreground, sample.a);
}
