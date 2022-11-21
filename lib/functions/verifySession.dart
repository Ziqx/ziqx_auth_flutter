import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ziqx_auth/data/const.dart';

Future verifySession(String sessionId, String api) async {
  // for every 2 seconds send http request
try{
  var response = await http.get(Uri.parse('${ACCOUNT_ROOT_URL}api/sessions/verify?sessionId=$sessionId&api=$api'));
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    return {"status": "error", "message": "Something went wrong"};
  }

}catch(e){
  return {"status": "error", "message": "Something went wrong"};
}
  
}
