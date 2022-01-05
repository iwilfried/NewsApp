import 'dart:async';
import 'dart:io';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news/pages/screens.dart';

class Splash extends StatefulWidget {
  const Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Onboarding()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              whiteColor.withOpacity(0.9),
              whiteColor.withOpacity(0.8),
              whiteColor.withOpacity(0.6),
              whiteColor.withOpacity(0.5),
              whiteColor.withOpacity(0.3),
              whiteColor.withOpacity(0.1),
            ],
          ),
        ),
        child: WillPopScope(
          onWillPop: () => exit(0),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 320),
                logo(),
                const SizedBox(height: 270),
                spinkit(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  logo() {
    return Container(
      alignment: Alignment.center,
      child: Image.asset(
        'assets/logo.png',
        height: 50.0,
        width: 150.0,
      ),
    );
  }

  spinkit() {
    return const SpinKitFadingCircle(
      color: primaryColor,
      size: 50.0,
    );
  }
}
