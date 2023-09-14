import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:murilobarberapp/firebase_options.dart';
import 'package:murilobarberapp/murilo_barber_app.dart';
import 'package:murilobarberapp/data/post_provider.dart';
import 'package:murilobarberapp/services/auth_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PostProvider()),
        ChangeNotifierProvider(create: (context) => AuthService()),
      ],
      child: const MyApp(),
    ),
  );
}
