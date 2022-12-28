import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jemputah_app/constants/color.dart';

typedef AlertAction<T> = void Function(T index);

class DLAlert {
  DLAlert(
      {required this.cancelTitle,
      this.alertTitle = 'Alert',
      this.alertDetailMessage = '',
      required this.alertActionTitles,
      required this.onAlertAction});
  String alertTitle;
  String alertDetailMessage;
  String cancelTitle;
  List<String> alertActionTitles;
  AlertAction<int> onAlertAction;

  Widget _getAlertDialog(List<Widget> actions) {
    if (Platform.isIOS) {
      return CupertinoAlertDialog(
          title: Text(
            alertTitle,
            style: TextStyle(color: AppColors.black),
          ),
          content: Text(alertDetailMessage),
          actions: actions);
    } else {
      return AlertDialog(
          title: Text(
            alertTitle,
            style: TextStyle(color: AppColors.black),
          ),
          content: Text(alertDetailMessage),
          actions: actions);
    }
  }

  void show(BuildContext context) {
    List<Widget> actions = <Widget>[];
//Customize the cancel button as per the requirement
    Widget actionButton = TextButton(
      child: Text(
        cancelTitle,
        style: TextStyle(color: AppColors.red),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    actions.add(actionButton);
    for (int i = 0; i < alertActionTitles.length; i++) {
      Widget actionButton = TextButton(
        child: Text(
          alertActionTitles[i],
          style: TextStyle(color: AppColors.black),
        ),
        onPressed: () {
          Navigator.pop(context);
          onAlertAction(i);
        },
      );
      actions.add(actionButton);
    }
// show the dialog
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return _getAlertDialog(actions);
      },
    );
  }
}
