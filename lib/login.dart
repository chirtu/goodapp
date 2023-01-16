import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

import 'dashboard.dart';


class LoginPage extends StatelessWidget {

  final username_controller = TextEditingController();
  final password_controller = TextEditingController();

  final userdata = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Shared Preferences"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Login Form",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(
              "To show Example of Shared Preferences Alternative using GetX Storage",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: username_controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'username',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: password_controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
          ElevatedButton(

              onPressed: () {
                String username = username_controller.text;
                String password = password_controller.text;

                if (username == 'fatuma' && password == '123') {
                  print('Successfull');

                  userdata.write('isLogged', true);
                  userdata.write('username',username );

                  Get.offAll(DashBoard());

                }else{
                  Get.snackbar("Error", "Please Enter Username & Password",snackPosition: SnackPosition.BOTTOM);
                }
              },
              child: Text("Log-In"),
            )
          ],
        ),
      ),
    );
  }
}