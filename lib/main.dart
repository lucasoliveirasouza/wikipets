import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:wikipets/constantes.dart';
import 'package:wikipets/firebase_options.dart';
import 'package:wikipets/service/auth_service.dart';
import 'package:wikipets/service/cat_service.dart';
import 'package:wikipets/service/comment_service.dart';
import 'package:wikipets/service/dog_service.dart';
import 'package:wikipets/service/forum_service.dart';
import 'package:wikipets/views/auth/auth_check.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => CatService()),
      ChangeNotifierProvider(create: (context) => DogService()),
      ChangeNotifierProvider(create: (context) => AuthService()),
      ChangeNotifierProvider(create: (context) => ForumService()),
      ChangeNotifierProvider(create: (context) => CommentService()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Wiki Pets',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: color2,
          ),
        ),
      ),
      home: const AuthCheck(),
    );
  }
}
