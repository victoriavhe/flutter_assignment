import 'package:flutter/cupertino.dart';

class IOSBody extends StatelessWidget {
  final Widget blocBuilder;

  const IOSBody({Key key, this.blocBuilder}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            largeTitle: Text(
              "Home Credit Indonesia",
              style: TextStyle(fontSize: 25),
            ),
          ),
          SliverFillRemaining(
            child: blocBuilder,
          )
        ],
      ),
    );
  }
}
