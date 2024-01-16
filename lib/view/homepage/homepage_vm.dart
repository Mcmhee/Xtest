import 'dart:math';

import 'package:app/model/user_model.dart';
import 'package:app/service/network_service.dart';
import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  final _network = NetworkService();
  List<UserResponse>? user;
  UserResponse? randomUser = UserResponse();
  bool showloadingforfooter = false;

  ini() {
    showloadingforfooter = true;
  }

  getUser() async {
    randomUser = null;
    notifyListeners();
    user = await _network.getUser();
    var random = Random();
    randomUser = user![random.nextInt(10)];
    ini();
    notifyListeners();
  }
}
