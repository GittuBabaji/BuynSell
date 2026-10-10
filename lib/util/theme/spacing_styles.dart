import "package:flutter/material.dart";
import "package:buynsell/util/constants/sizes.dart";
class TspacingStyle{
    TspacingStyle._();
    static const EdgeInsetsGeometry paddingwithAppbarheight= EdgeInsets.only(
            top:TSizes.appBarHeight,
            left:TSizes.defaultSpace,
            right:TSizes.defaultSpace,
            bottom:TSizes.defaultSpace
          );
}
