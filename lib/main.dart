import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weight_provider_learn/screens/weight_page.dart';
import 'package:weight_provider_learn/state/weight_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => WeightState())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: WeightPage(),
      ),
    );
  }
}
