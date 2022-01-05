import 'package:flutter/services.dart';
import 'package:news/pages/screens.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: primaryColor,
        fontFamily: 'Kodchasan',
        appBarTheme: const AppBarTheme(
          color: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(color: primaryColor),
        ),
      ),
      home: const Splash(),
    );
  }
}
