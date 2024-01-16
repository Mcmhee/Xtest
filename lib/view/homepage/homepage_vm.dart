import 'package:app/model/user_model.dart';
import 'package:app/service/network_service.dart';
import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  final _network = NetworkService();
  List<UserResponse>? user;

  getUser() async {
    user = await _network.getUser();
    notifyListeners();
  }
}
