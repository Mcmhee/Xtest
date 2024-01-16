import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final DetaildArgument argument;
  const DetailPage({super.key, required this.argument});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      appBar: AppBar(
        title: Text("Detailed page"),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            icon: Icon(Icons.arrow_back_ios_new)),
      ),

//
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(argument.name),
            Text(argument.email),
            Text(argument.username)
          ],
        ),
      ),
    );
  }
}

class DetaildArgument {
  String name, username, email;

  DetaildArgument({
    required this.name,
    required this.username,
    required this.email,
  });
}
