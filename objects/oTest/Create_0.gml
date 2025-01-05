// Feather disable all

font = font_add_sprite_ext(sFontASCII, " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~", false, 0);
LatTextSetFont(font);

latticeLayer = LatLayerCreate(0);


LatLayerSetTarget(latticeLayer);

LatStampSprite(sTestLarge, 0, 0, 0);
LatStampSprite(sTestSmall, 1, 1, 1, c_red);
LatStampSprite(sTestSmall, 2, 2, 2, c_black, c_white);

LatStampText(4, 0, "Hello world!", c_black, c_white);
LatStampBg(c_blue, 4, 0, 4, 1);
LatStampFg(c_blue, 10, 0, 4, 1);