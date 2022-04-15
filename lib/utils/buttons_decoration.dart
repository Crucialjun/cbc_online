import 'package:cbc_online/app_colors.dart';
import 'package:flutter/cupertino.dart';

class ButtonsDecoration extends BoxDecoration {
  @override
  Color? get color => appPrimaryColor;

  @override
  BorderRadiusGeometry? get borderRadius => BorderRadius.circular(12.0);
}
