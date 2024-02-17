import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin { //SingleTickerProviderStateMixin allows to use animations and similar
  
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    //after X seconds, navigate to the homescreen
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => HomeScreen(), //not necessary to add context
          )
      );
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.redAccent],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage('assets/img/logo/logo_no_background.png'),
                width: 300,
                height: 300,
              ),
            ],
          ),
            /*Image(
              image: AssetImage('assets/img/logo/logo_no_background.png'),
              width: 100,
              height: 100,
            ),*/
            SizedBox(height: 25),
            /*FractionallySizedBox(
              widthFactor: 1, // between 0 and 1
              heightFactor: 0,
            ),*/
            /*Icon(
              Icons.emoji_objects,
              size: 100,
              color: Colors.white,
            )*/
            Text(
              "from",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 32,
              ),
            ),
            Text(
              "G7 - Hackathon",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
