import 'package:flutter/material.dart';
import 'package:flutter_assignment/helper/utility_helper.dart';
import 'package:flutter_assignment/model/home.dart';

import 'home_grid.dart';
import 'icon_list.dart';

class HomeCard extends StatelessWidget {
  final Home home;

  HomeCard(this.home);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.23,
        child: HomeGrid(
          children: List.generate(home.items.length, (i) {
            return InkWell(
              onTap: () => UtilityHelper.openBrowser(home.items[i].link),
              child: Column(
                children: <Widget>[
                  Icon(
                    IconList.listOfIcon[i],
                    size: 24,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "${home.items[i].productName.toString().replaceAll("Pembiayaan", "")}",
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
