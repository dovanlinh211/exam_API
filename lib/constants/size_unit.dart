import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SizeUnit {
  static double _screenWidth = 0;
  static double _screenHeight = 0;
  static double _unitSizeHorizontal = 0;
  static double _unitSizeVertical = 0;

  static double textSizeUnit = 0;
  static double imageSizeUnit = 0;
  static double heightSizeUnit = 0;
  static double widthSizeUnit = 0;

  void init(BoxConstraints constraints, Orientation orientation) {
    // For the portrait mode
    if (orientation == Orientation.portrait) {
      _screenWidth = constraints.maxWidth;
      _screenHeight = constraints.maxHeight;
      // For the landscape mode
    } else {
      _screenWidth = constraints.maxHeight;
      _screenHeight = constraints.maxWidth;
    }
    // In this the size will be divided into blocks
    // Suppose height is 800 then 800/100 we will get 8 blocks vertically
    // Same goes for the vertical
    _unitSizeHorizontal = _screenWidth / 100;
    _unitSizeVertical = _screenHeight / 100;

    textSizeUnit = _unitSizeVertical;
    heightSizeUnit = _unitSizeVertical;
    widthSizeUnit = _unitSizeHorizontal;

    print(_unitSizeHorizontal);
    print(_unitSizeVertical);
  }
}