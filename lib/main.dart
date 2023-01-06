import 'package:flutter/material.dart';
import 'package:movie/providers/common.dart';
import 'package:movie/screens/home.dart';
import 'package:movie/widgets/global_keys.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => CommonProvider())],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        navigatorKey: GlobalKeys.navigatorKey,
        home: HomePage(),
      ),
    );
  }
}
