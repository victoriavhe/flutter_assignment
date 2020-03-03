import 'package:flutter/material.dart';
import 'package:flutter_assignment/helper/utility_helper.dart';
import 'package:flutter_assignment/model/home.dart';

import 'article_image.dart';

class ArticleCard extends StatelessWidget {
  final Home home;

  ArticleCard(this.home);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Flex(
        direction: Axis.vertical,
        children: List.generate(home.items.length, (i) {
          return itemList(i);
        }),
      ),
    );
  }

  Widget itemList(int i) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 21,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(12.0),
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey[400],
            blurRadius: 2.0,
            offset: Offset(0.0, 1.0),
          ),
        ],
      ),
      child: Material(
        child: InkWell(
          onTap: () => UtilityHelper.openBrowser(home.items[i].link),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
                child: AtomicImage(
                  imageSrc: home.items[i].articleImage,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 14,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      home.items[i].articleTitle,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
