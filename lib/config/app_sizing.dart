import 'package:flutter/material.dart';

class AppSizing {
  BuildContext _context;
  double _height;
  double _width;
  double _paddingHeight;
  double _paddingWidth;


  AppSizing(this._context) {
    MediaQueryData _mediaQueryData = MediaQuery.of(_context);
    _height = _mediaQueryData.size.height / 100;
    _width = _mediaQueryData.size.width / 100;
    _paddingHeight = _height - ((_mediaQueryData.padding.top - _mediaQueryData.padding.bottom) / 100);
    _paddingWidth = _width - ((_mediaQueryData.padding.right - _mediaQueryData.padding.left) / 100);
  }

  double responsiveHeight(double v) {
    return _height * v;
  }

  double responsiveWidth(double v) {
    return _width * v;
  }

  double responsivePaddingHeight(double v) {
    return _paddingHeight * v;
  }

  double responsivePaddingWidth(double v) {
    return _paddingWidth * v;
  }

}