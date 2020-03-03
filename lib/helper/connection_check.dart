import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

Future<bool> checkConnection() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  bool isConnected = (connectivityResult == ConnectivityResult.wifi ||
      connectivityResult == ConnectivityResult.mobile);
  return isConnected;
}

showAlert(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('No Connection'),
        content: Text('Please check your internet connection and try again'),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "OK",
              style: TextStyle(
                color: Platform.isIOS
                    ? Color(0xFF007AFF)
                    : Theme.of(context).buttonColor,
                fontSize: Platform.isIOS ? 17 : 14,
                fontWeight: Platform.isIOS
                    ? FontWeight.w600
                    : FontWeight.normal,
              ),),
          ),
        ],
      );
    },
  );
}
