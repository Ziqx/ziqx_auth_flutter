import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';

import 'data/const.dart';

void ZauthLaunchAuth(String sessionId) async {
  try {
    await launch(
      '${ACCOUNT_ROOT_URL}login?sessionId=$sessionId&ref=session@$sessionId',
      customTabsOption: const CustomTabsOption(
        toolbarColor: Color(0xff000000),
        enableDefaultShare: false,
        enableUrlBarHiding: true,
        showPageTitle: true,
        extraCustomTabs: <String>[
          'org.mozilla.firefox',
          'com.microsoft.emmx',
        ],
      ),
      safariVCOption: const SafariViewControllerOption(
        preferredBarTintColor: Color(0xff000000),
        preferredControlTintColor: Colors.white,
        barCollapsingEnabled: true,
        entersReaderIfAvailable: false,
        dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
      ),
    );
  } catch (e) {
    print(e.toString());
  }
}
