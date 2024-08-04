import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_1/pages/increment_page.dart';
import 'package:provider_1/providers/counter_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) =>Counter(),
  child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: IncrementPage(),

    );
  }
}

