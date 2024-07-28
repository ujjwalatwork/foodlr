
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String? _userName;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          inputDecorationTheme: const InputDecorationTheme(
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.amberAccent)
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.amberAccent),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.amberAccent),
            ),
            prefixIconColor: Colors.amberAccent,
            suffixIconColor: Colors.amberAccent,
          )
      ),
      home: Scaffold(
        body: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    "assets/logo.png",
                    width: 200,
                  ),
                  SizedBox(height: 100,),
                  TextFormField(
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (newValue) => _userName = newValue,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 15),
                      alignLabelWithHint: true,
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      hintText: 'Username',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      suffixIcon: Icon(Icons.close),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.email_outlined),
                      ),
                      prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
                    ),
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return 'Please enter email address';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    obscureText: true,
                    onSaved: (newValue) => _password = newValue,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 15),
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      hintText: 'Password',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.password_outlined),
                      ),
                      prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
                      suffixIcon: Icon(Icons.remove_red_eye_outlined),
                    ),
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return 'Please enter password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 60,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amberAccent,
                      minimumSize: Size(double.infinity, 50),
                    ),
                    onPressed: () async {
                      final form = _formKey.currentState;
                      if(form!.validate()) {
                        form.save();
                        print("form is valid");
                        var client = http.Client();
                        try {
                          var response = await client.post(
                              Uri.https('dummyjson.com', 'auth/login'),
                              body: {
                                'username': _userName,
                                'password': _password,
                                'expiresInMins': "30",
                              });
                          var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
                          //var uri = Uri.parse(decodedResponse['uri'] as String);
                          print("decodedResponse: ${decodedResponse}");
                      } finally {
                      client.close();
                      }
                      } else {
                        print("form is not valid");
                      }
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}