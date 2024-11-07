// Feather disable all

LatSymbolAddSprite(sTest);
LatSymbolAddFont(sFontASCII, " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~");

latticeLayer = LatLayerCreate();
LatLayerSetTarget(latticeLayer);

LatSprite(sTest, 0, 0, 0);
LatSprite(sTest, 1, 1, 1, c_red);
LatSprite(sTest, 2, 2, 2, c_black, c_white);

LatText(4, 0, "Hello world!", c_red, c_white);
LatBackground( 4, 0, 4, 1, c_blue);
LatForeground(10, 0, 4, 1, c_blue);