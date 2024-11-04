// Feather disable all

font = font_add_sprite_ext(sFontASCII, " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~", false, 0);
LatTextSetFont(font);

latticeLayer = LatLayerCreate(0);


LatLayerSetTarget(latticeLayer);

LatSprite(sTestLarge, 0, 0, 0);
LatSprite(sTestSmall, 1, 1, 1, c_red);
LatSprite(sTestSmall, 2, 2, 2, c_black, c_white);

LatText(4, 0, "Hello world!", c_black, c_white);
LatBackground(c_blue, 4, 0, 4, 1);
LatForeground(c_blue, 10, 0, 4, 1);