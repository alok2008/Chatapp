import 'package:chat_app/constants.dart';
import 'package:chat_app/screens/chat_screen.dart';
import 'package:chat_app/screens/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool showSpinner= false;
  final _auth = FirebaseAuth.instance;
  String Email = '';
  String Password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 150.0,
                child: Flexible(
                  child: Hero(
                      tag: 'fox',
                      child: Image.asset('lib/asset/86289.webp')),
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  Email=value;
                },
                decoration: kInputDecoration.copyWith(hintText: 'Enter your Email')
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value) {
                  Password=value;
                },
                decoration: kInputDecoration.copyWith(hintText: 'Enter your Password'),)
              ,
              const SizedBox(
                height: 24.0,
              ),
              Roundedbutton(buttontitle: 'Register', color: Colors.blueAccent,
                  OnPressed:() async {
                setState(() {
                  showSpinner = true;
                });
               try { final newUser = await _auth.createUserWithEmailAndPassword(
                   email: Email, password: Password);
                 if(newUser != null) {
                   Navigator.pushNamed(context, ChatScreen.id);
                 }
                 setState(() {
                   showSpinner = false;
                 });
              }
              catch(e){
                 print(e);
              }
              }
              ),

            ],
          ),
        ),
      ),
    );
  }
}