import 'package:flutter/material.dart';
import '/widgets/image.dart';
import '/widgets/data.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[100],
        appBar: AppBar(
          backgroundColor: Colors.green[400],
          title: const Text(
            "Venus Fly Trap",
            style: TextStyle(
              fontSize: 40,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              FirestoreImageDisplay(),
              displayData(),
            ],
          ),
        ));
  }
}
