import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

showErrorDialog(BuildContext context, String message) {
  AwesomeDialog(
          context: context,
          dialogType: DialogType.ERROR,
          title: "Error",
          desc: message)
      .show();
}

showLoadingDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [CircularProgressIndicator(), Text("Loading...")],
            ),
          ),
        );
      });
}
