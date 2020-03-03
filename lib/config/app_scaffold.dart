import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final PreferredSizeWidget appBar;
  final Widget body;
  final Color backgroundColor;

  const AppScaffold({
    Key key,
    this.appBar,
    this.body,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: body,
            backgroundColor: backgroundColor,
          )
        : Scaffold(
            appBar: appBar,
            body: body,
            backgroundColor: backgroundColor,
          );
  }
}
