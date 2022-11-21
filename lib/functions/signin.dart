import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ziqx_auth/data/const.dart';

Future createSession(api, app) async {
  try {
    final response =
      await http.get(Uri.parse('${ACCOUNT_ROOT_URL}api/sessions/create?api=$api&app=$app'));
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    return {"status": "error", "message": "Something went wrong"};
  }
  } catch (e) {
    return {"status": "error", "message": "Something went wrong"};
  }
}
