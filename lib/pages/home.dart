import 'package:flutter/material.dart';
import '/widgets/image.dart';
import '/widgets/data.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

// 244, 223, 108, 1
// 143, 198, 64, 1
// 16, 106, 57, 1
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(244, 223, 108, 1),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(253, 187, 38, 1),
          title: const Text(
            "AgriLink",
            style: TextStyle(
              fontSize: 35,
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
