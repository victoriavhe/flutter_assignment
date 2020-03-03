import 'package:flutter/material.dart';

class HomeGrid extends StatelessWidget {
  final List<Widget> children;

  HomeGrid({Key key, this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.fromLTRB(12, 16, 12, 16),
      crossAxisCount: 3,
      children: children,
    );
  }
}
