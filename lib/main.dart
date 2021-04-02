import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:sajilo/screens/welcome/welcome.dart';
//import 'navpages/navscreens/navhandling.dart';
import 'screens/welcome/welcome.dart';
import 'services/auth.dart';
import 'services/authenticationprovider.dart';
// import 'package:sajilo/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(),
        ),
        StreamProvider(
            create: (contex) => contex.read()<AuthenticationProvider>().authState)
      ],
      child: MaterialApp(
        title: 'Sajilo',
        home: WelcomeScreen(),
        theme: ThemeData(primaryColor: Colors.blueAccent),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
