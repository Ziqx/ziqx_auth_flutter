import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'data/const.dart';

void ZauthLaunchAuth(ChromeSafariBrowser browser, String sessionId,
    Color toolbarColor,  onError(e)) async {
  try {
    await browser.open(
        url: Uri.parse(
            '${ACCOUNT_ROOT_URL}login?sessionId=$sessionId&ref=session@$sessionId'),
        options: ChromeSafariBrowserClassOptions(
            android: AndroidChromeCustomTabsOptions(
                shareState: CustomTabsShareState.SHARE_STATE_OFF,
                toolbarBackgroundColor: toolbarColor),
            ios: IOSSafariOptions(
                barCollapsingEnabled: true,
                preferredBarTintColor: toolbarColor)));
  } catch (e) {
    browser.close();
    onError(e);
  }
}
