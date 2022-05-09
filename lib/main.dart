import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wikipets/service/cat_service.dart';
import 'package:wikipets/service/dog_service.dart';
import 'package:wikipets/views/home/home.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => CatService()),
      ChangeNotifierProvider(create: (context) => DogService()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wiki Pets',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const HomeView(),
    );
  }
}
