// Feather disable all

LatSymbolAddSprite(sTest);
LatSymbolAddFont(sFontASCII, " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~");

latticeLayer = LatLayerCreate(0);

LatLayerSetTarget(latticeLayer);
LatPaletteSet(2, c_red);
LatPaletteSet(3, c_blue);

LatSprite(sTest, 0, 0, 0);
LatSprite(sTest, 1, 1, 1, 2);
LatSprite(sTest, 2, 2, 2, 0, 1);

LatText(4, 0, "Hello world!", 2, 1);
LatBackground(3, 4, 0, 4, 1);
LatForeground(3, 10, 0, 4, 1);