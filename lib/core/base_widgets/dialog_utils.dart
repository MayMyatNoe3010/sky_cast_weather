import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../res/dimensions.dart';

class DialogUtils {
  static Future? dialog;
  static Future? loadingDialog;
  static Future? successDialog;
  static Future? loadingDialogWithMessage;
  static Future? errorWithMessageDialog;
  static Future? customWidgetDialog;

  static BuildContext? loadingContext;
  static BuildContext? loadingDialogWithMessageContext;
  static BuildContext? errorWithMessageContext;
  static BuildContext? successDialogContext;
  static BuildContext? customWidgetDialogContext;

  static Future<void> showSuccessDialog(
      {required BuildContext buildContext,
        String title = 'Title',
        String message = 'message',
        Function? callback}) async {
    if (successDialog != null) {
      // Navigator.of(buildContext).pop();
      // dialog = null;
      return;
    }
    successDialog = showDialog<void>(
      context: buildContext,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        successDialogContext = context;
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: Text(
              title,
              textAlign: TextAlign.center,
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  //space16(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.check_circle,
                      size: 100,
                      color: Colors.green,
                    ),
                  ),
                  //space16(),
                  Text(
                    message,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  dialog = null;
                  Navigator.of(successDialogContext!).pop();
                  callback?.call();
                },
              ),
            ],
          ),
        );
      },
    );
    return dialog;
  }

  static hideSuccessDialog({
    required BuildContext buildContext,
  }) {
    successDialog = null;
    if (successDialogContext != null) {
      Navigator.of(successDialogContext!, rootNavigator: true).pop();
    }
  }

  static Future<void> showTextDialog(
      {required BuildContext buildContext,
        String title = 'Title',
        String message = 'message',
        Function? callback}) async {
    if (dialog != null) {
      return;
    }
    dialog = showDialog<void>(
      context: buildContext,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: Text(title),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(message),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  dialog = null;
                  Navigator.of(buildContext).pop();
                  callback?.call();
                },
              ),
            ],
          ),
        );
      },
    );
    return dialog;
  }

  static showLoading({required BuildContext context}) {
    if (loadingDialog != null) {
      return;
    }
    loadingDialog = showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext buildContext) {
        loadingContext = buildContext;
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            insetPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 120),
            content: CupertinoActivityIndicator(),
          ),
        );
      },
    );
  }

  static hideLoading({required BuildContext context}) {
    loadingDialog = null;
    if (loadingContext != null) {
      Navigator.of(loadingContext!, rootNavigator: true).pop();
      loadingContext = null;
    }
  }

  static showLoadingWithMessage(
      {required BuildContext context, required String message}) {
    if (loadingDialogWithMessage != null) {
      return;
    }
    loadingDialogWithMessage = showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext buildContext) {
        loadingDialogWithMessageContext = buildContext;
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: Center(child: Text(message)),
            // insetPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 165),
            content: Container(
              padding: const EdgeInsets.all(8),
              child: const CupertinoActivityIndicator(),
              // child: AlertDialog(
              //   title: CupertinoActivityIndicator(// ),
            ),
          ),
        );
      },
    );
  }

  static hideLoadingDialogWithMessage({required BuildContext context}) {
    loadingDialogWithMessage = null;
    if (loadingDialogWithMessageContext != null) {
      Navigator.of(loadingDialogWithMessageContext!, rootNavigator: true).pop();
    }
  }

  static showErrorWithMessage(
      {required BuildContext context, required String message}) {
    if (errorWithMessageDialog != null) {
      return;
    }
    errorWithMessageDialog = showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext buildContext) {
        errorWithMessageContext = buildContext;
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: Center(child: Text(message)),
            // insetPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 165),
            content: Container(
              padding: const EdgeInsets.all(8),
              child: const Icon(
                Icons.error,
                size: 100,
                color: Colors.red,
              ),
              // child: AlertDialog(
              //   title: CupertinoActivityIndicator(// ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    hideErrorWithMessage(context: context);
                  },
                  child: Text('OK')),
            ],
          ),
        );
      },
    );
  }

  static hideErrorWithMessage({required BuildContext context}) {
    errorWithMessageDialog = null;
    if (errorWithMessageContext != null) {
      Navigator.of(errorWithMessageContext!, rootNavigator: true).pop();
    }
  }

  static Future<void> showCustomWidgetDialog(
      {required BuildContext buildContext,
        String title = 'Title',
        String message = 'message',
        Function? callback,
        Widget? content
      }) async {
    if (customWidgetDialog != null) {
      // Navigator.of(buildContext).pop();
      // dialog = null;
      return;
    }
    customWidgetDialog = showDialog<void>(
      context: buildContext,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        customWidgetDialogContext = context;
        return PopScope(
          canPop: false,
          child: AlertDialog(
            title: Text(
              title,
              textAlign: TextAlign.center,
            ),
            content: content,
            actions: <Widget>[
              TextButton(onPressed: (){
                hideCustomWidgetDialog(buildContext: buildContext);
              }, child: const Text('CANCEL', style: TextStyle(color: Colors.red),)),
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  callback?.call();
                  hideCustomWidgetDialog(buildContext: buildContext);
                },
              ),
            ],
          ),
        );
      },
    );
    return dialog;
  }

  static hideCustomWidgetDialog({
    required BuildContext buildContext,
  }) {
    customWidgetDialog = null;
    if (customWidgetDialogContext != null) {
      Navigator.of(customWidgetDialogContext!, rootNavigator: true).pop();
    }
  }

  static showSnackBar(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
    ));
  }


}
