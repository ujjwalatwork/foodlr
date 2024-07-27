
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: 'Email',
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                        )
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
                    decoration: InputDecoration(
                        hintText: 'Password',
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                        )
                    ),
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return 'Please enter password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10,),
                  TextButton(
                    onPressed: (){
                      final form = _formKey.currentState;
                      if(form!.validate()) {
                        print("form is valid");
                      } else {
                        print("form is not valid");
                      }
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 20),
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
