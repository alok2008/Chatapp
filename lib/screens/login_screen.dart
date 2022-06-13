import 'package:chat_app/screens/chat_screen.dart';
import 'package:chat_app/screens/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../constants.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  static String id='login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner= false;
  final _auth= FirebaseAuth.instance;
   late String email;
   late String password;
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
              SizedBox(
                height: 150.0,
                child: Hero(
                    tag: 'fox',
                    child: Image.asset('lib/asset/86289.webp')),
              ),
              const SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email=value;
                },
                decoration: kInputDecoration.copyWith(hintText: 'Enter Your Mail'),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                  textAlign: TextAlign.center,
                  obscureText: true,
                onChanged: (value) {
                  password=value;
                },
                decoration: kInputDecoration.copyWith(hintText: 'Enter Your Password')
              ),
              const SizedBox(
                height: 24.0,
              ),
              Roundedbutton(buttontitle: 'Log In', color: Colors.lightBlueAccent,
                  OnPressed:() async{
                setState(() {
                  showSpinner=true;
                });

                final user= await _auth.signInWithEmailAndPassword(email: email, password: password);
               try{ if (user != null)
                  {
                    Navigator.pushNamed(context, ChatScreen.id);
                    setState(() {
                      showSpinner=false;
                    });
                  } }catch(e)
               {print (e);}

              }),

            ],
          ),
        ),
      ),
    );
  }
}