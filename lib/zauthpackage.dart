library ziqx_auth;

import 'package:flutter/material.dart';
import 'package:ziqx_auth/functions/signin.dart';
import 'package:ziqx_auth/functions/verifySession.dart';

import 'authenticate.dart';

class ZiqxAuth {
  static authenticate(
      {required BuildContext context,
      required String api,
      required String app,
      required Function(dynamic) onSuccess}) async {
    await createSession(api, app).then((value) async {
      print("Value is:$value");
      if (value['status'] == 'success') {
        String sessionId = value['data']['key'];
        ZauthLaunchAuth(sessionId);

        verFunc(sessionId, api, (data) {
          onSuccess(data);
          Navigator.pop(context);
        });
      }
    });
  }
}

verFunc(sessionId, api, onDone) async {
  verifySession(sessionId, api).then((sessionData) {
    if (sessionData['data']['isVerified'] == true) {
      onDone(sessionData);
    } else {
      Future.delayed(const Duration(seconds: 3), () {
        verFunc(sessionId, api, onDone);
      });
    }
  });
}
