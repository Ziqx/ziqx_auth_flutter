import 'package:flutter/material.dart';
import 'package:ziqx_auth/zauthpackage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ziqx Auth Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                ZiqxAuth.authenticate(
                    context: context,
                    api: 'ec48c55651vS6rt4gaf277bd1436cc',
                    app: 'myapp',
                    onSuccess: (res) {
                      print("$res");
                    });
              },
              child: const Text("Login With Ziqx")),
        ],
      )),
    );
  }
}
