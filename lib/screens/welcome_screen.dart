import 'package:chat_app/screens/components/rounded_button.dart';
import 'package:chat_app/screens/login_screen.dart';
import 'package:chat_app/screens/registration_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'Welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation animation;
  @override
  void initState(){
    super.initState();

    controller = AnimationController(vsync: this,
    duration: const Duration(seconds: 2),
    upperBound: 1);
    animation = ColorTween(begin: Colors.blueGrey,end: Colors.white).animate(controller);
    controller.forward();

    controller.addListener(() {
      setState(() {

      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: 'fox',
                  child: CircleAvatar(
                    child: Image.asset('lib/asset/86289.webp',
                    ),
                    radius: 50,
                  ),
                ),
                const Text(
                  'Fox Chat',
                  style: const TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            Roundedbutton(buttontitle: 'Log In', color: Colors.lightBlueAccent,OnPressed:() {Navigator.pushNamed(context, LoginScreen.id);}),
            Roundedbutton(buttontitle: 'Register', color: Colors.blueAccent,OnPressed:() {Navigator.pushNamed(context, RegistrationScreen.id);}),


          ],
        ),
      ),
    );
  }
}

