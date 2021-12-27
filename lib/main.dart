import 'package:flutter/material.dart';
import 'package:routes/pages/Resoult.dart';
import 'package:routes/pages/TestForm.dart';

import 'package:routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        Routes.SignIn: (context) => const TestForm(),
        Routes.Result: (context) => Result(),
      },
      initialRoute: Routes.SignIn,
    );
  }
}
