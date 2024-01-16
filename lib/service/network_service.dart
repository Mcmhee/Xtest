import 'dart:convert';

import 'package:app/model/user_model.dart';
import 'package:http/http.dart';

class NetworkService {
  String get baseUrl => "https://jsonplaceholder.typicode.com";

  Future getUser() async {
    var url = '$baseUrl/users';

    var result = await get(Uri.parse(url), headers: {
      "Content-Type": "application/json",
    });

    final Iterable item = jsonDecode(result.body);

    print("getPost Response:: ${url}");
    print("getPost Response:: ${result.body}");

    return item.map((e) => UserResponse.fromJson(e)).toList();
  }
}
