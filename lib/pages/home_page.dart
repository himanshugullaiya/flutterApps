import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First App"),
        centerTitle: true,
      ),
      body: Center(
          child: Container(
              child: Text("Welcome Hero", style: TextStyle(fontSize: 30)))),
      drawer: MyDrawer(),
    );
  }
}
