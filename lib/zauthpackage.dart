library ziqx_auth;

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:ziqx_auth/functions/signin.dart';
import 'package:ziqx_auth/functions/verifySession.dart';
import 'authenticate.dart';

class ZiqxAuth {
  static final ChromeSafariBrowser browser = ChromeSafariBrowser();

  static authenticate(
      {required BuildContext context,
      required String api,
      required String app,
      required Function(dynamic) onSuccess,
      required Function(dynamic) onError,
      Color toolBarColor = Colors.black}) async {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Authenticating...'),
      backgroundColor: Colors.green[800],
    ));
    await createSession(api, app).then((value) async {
      if (value['status'] == 'success') {
        String sessionId = value['data']['key'];
        ZauthLaunchAuth(browser, sessionId, toolBarColor, (e) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text('Authentication failed, Please try again'),
            backgroundColor: Colors.red[800],
          ));
          onError({
            'status': 'error',
            'message': 'Something went wrong, Probably network error',
            'log': e.toString()
          });
        });
        await verFunc(sessionId, api, (data) {
          print("🔌 Logged in to Ziqx Auth");
          onSuccess(data);
          browser.close();
        });
      } else {
        onError(value);
      }
    }).catchError((er) {
      onError({
        'status': 'error',
        'message': 'Something went wrong, Probably network error',
        'log': er.toString()
      });
    });
  }
}

verFunc(sessionId, api, onDone) async {
  print("🔒 Checking for verification [Session: $sessionId]...");
  await verifySession(sessionId, api).then((sessionData) {
    if (sessionData['data']['isVerified'] == true) {
      print("✅ Authentication Verified");
      onDone(sessionData);
    } else {
      Future.delayed(const Duration(seconds: 3), () async {
        await verFunc(sessionId, api, onDone);
      });
    }
  });
}
