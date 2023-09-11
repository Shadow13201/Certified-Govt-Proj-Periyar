import 'package:flutter/material.dart';

class Loading {
  static showLoading(BuildContext context) {
    return showDialog(
        barrierColor: Colors.white70,
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: AlertDialog(
              backgroundColor: Colors.transparent,
              elevation: 0,
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: const <Widget>[
                  Center(
                    child: SizedBox(
                      width: 44,
                      height: 44,
                      child: CircularProgressIndicator(
                        color: Color(0xffFFCC00),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
