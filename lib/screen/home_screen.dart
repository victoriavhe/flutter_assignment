import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/bloc/home_bloc.dart';
import 'package:flutter_assignment/bloc/home_bloc_builder.dart';
import 'package:flutter_assignment/bloc/home_event.dart';
import 'package:flutter_assignment/config/app_scaffold.dart';
import 'package:flutter_assignment/services/home_repository.dart';

import 'home_ios_body.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeBloc homeBloc;
  HomeRepository homeRepository = HomeRepository();

  @override
  void initState() {
    homeBloc = HomeBloc(homeRepository);
    homeBloc.dispatch(FetchHomeResponse());
    super.initState();
  }

  Future<void> onRefresh() async {
    homeBloc.dispatch(FetchHomeResponse());
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: Platform.isIOS
            ? IOSBody(
                blocBuilder: HomeBlocBuilder(
                bloc: homeBloc,
                context: context,
              ))
            : HomeBlocBuilder(
                bloc: homeBloc,
                context: context,
              ),
      ),
      appBar: AppBar(
        title: Text("Home Credit Indonesia"),
      ),
    );
  }
}
