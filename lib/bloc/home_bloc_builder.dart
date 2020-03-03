import 'package:flutter/material.dart';
import 'package:flutter_assignment/widgets/articles_card.dart';
import 'package:flutter_assignment/widgets/product_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_bloc.dart';
import 'home_state.dart';

class HomeBlocBuilder extends StatelessWidget {
  final HomeBloc bloc;

  //when it is stateless you need to obtain a context
  final BuildContext context;

  const HomeBlocBuilder({Key key, this.bloc, this.context}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: BlocBuilder(
          bloc: bloc,
          builder: (context, state) {
            return widgetStateManager(state);
          },
        ),
      ),
    );
  }

  Widget widgetStateManager(HomeState state) {
    if (state is EmptyState) {
      return Container(
        color: Colors.greenAccent,
      );
    } else if (state is HomeLoading) {
      return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(child: CircularProgressIndicator()),
      );
    } else if (state is HomeDataLoaded) {
      var _productSection = state.home.data
          .firstWhere((home) => home.section.toUpperCase() == "PRODUCTS");
      var _articleSection = state.home.data
          .firstWhere((home) => home.section.toUpperCase() == "ARTICLES");

      return Container(
        padding: EdgeInsets.all(12),
        child: Column(
          children: <Widget>[
            HomeCard(_productSection),
            SizedBox(
              height: 12,
            ),
            Expanded(child: ArticleCard(_articleSection)),
          ],
        ),
      );
    } else if (state is HomeDataEmpty) {
      return Container(
        child: Center(
          child: Text("Empty"),
        ),
      );
    } else if (state is ErrorFetch) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          child: AlertDialog(
            title: Text("Whoops"),
            content: Text("Something went wrong."),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.pop(context),
                child: Text("OK"),
              )
            ],
          ),
        );
      });
    }

    return Container();
  }
}
