import 'package:flutter/material.dart';
import 'package:murilobarberapp/widgets/auth_check.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MuriloBarberApp',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: AuthCheck(),
    );
  }
}
