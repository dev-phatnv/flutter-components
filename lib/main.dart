import 'package:flutter/material.dart';
import 'package:flutterComponents/components/checkbox.dart';
import 'package:flutterComponents/components/modalBottomSheet.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.deepOrange),
        home: ModalBottomSheet(),
      );
}
