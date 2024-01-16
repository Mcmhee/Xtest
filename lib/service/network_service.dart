import 'dart:convert';

import 'package:app/model/user_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';

class NetworkService {
  Future getUser() async {
    var url = '${dotenv.env['BASEURL']}/users';

    var result = await get(Uri.parse(url), headers: {
      "Content-Type": "application/json",
    });

    final Iterable item = jsonDecode(result.body);

    print("getPost Response:: ${url}");
    print("getPost Response:: ${result.body}");

    return item.map((e) => UserResponse.fromJson(e)).toList();
  }
}
