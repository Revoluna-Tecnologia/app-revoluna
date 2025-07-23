// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:open_mail_app/open_mail_app.dart';

Future openMail(BuildContext context) async {
  // Add your function code here!

  var result = await OpenMailApp.openMailApp(
    nativePickerTitle: 'Selecione seu aplicativo',
  );

  void showNoMailAppsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Aplicativos não encontrados"),
          content: Text(
              "Por favor, abra seu e-mail com seu navegador de preferência."),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  if (!result.didOpen && result.canOpen) {
    showDialog(
      context: context,
      builder: (_) {
        return MailAppPickerDialog(
          mailApps: result.options,
        );
      },
    );
  } else if (!result.didOpen && !result.canOpen) {
    showNoMailAppsDialog(context);
  }
}
