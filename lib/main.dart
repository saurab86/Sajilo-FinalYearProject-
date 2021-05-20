import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:sajilo/screens/welcome/welcome1.dart';
import 'services/auth.dart';
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
            create: (contex) => contex.read<AuthService>().authStateChanges), 
      ],
      child: MaterialApp(
        title: 'Sajilo',
        home:Welcome() ,
        theme: ThemeData(primaryColor: Colors.blueAccent),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
