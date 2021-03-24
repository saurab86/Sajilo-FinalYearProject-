import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
// import 'package:sajilo/navpages/navscreens/navhandling.dart';
import 'package:sajilo/screens/welcome/welcome.dart';
import 'screens/welcome/welcome.dart';
import 'services/auth.dart';
// import 'package:sajilo/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => AuthService(),
      child: MaterialApp(
        title: 'Sajilo',
        home: WelcomeScreen(),
        theme: ThemeData(primaryColor: Colors.blueAccent),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
