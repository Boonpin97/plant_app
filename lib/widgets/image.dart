import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_database/firebase_database.dart';

bool streamingBool = true;
int disconnectThreshold = 30;
bool flag = false;
int frameValue = 0;
DateTime now = DateTime.now();

class FirestoreImageDisplay extends StatefulWidget {
  const FirestoreImageDisplay({super.key});

  @override
  State<FirestoreImageDisplay> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<FirestoreImageDisplay> {
  late String imageUrl;
  final storage = FirebaseStorage.instance;
  DatabaseReference refreshRef = FirebaseDatabase.instance.ref("refresh");
  DatabaseReference frameRef = FirebaseDatabase.instance.ref("frame");

  int refresh = 0;
  @override
  void initState() {
    super.initState();
    // Set the initial value of imageUrl to an empty string
    imageUrl = '';
    //Retrieve the imge grom Firebase Storage
    getImageUrl();
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        int delta_time = now.difference(DateTime.now()).inSeconds.abs();
        if (delta_time > disconnectThreshold) {
          streamingBool = false;
          setState(() {});
        }
      },
    );
  }

  void _refresh() async {
    flag = true;
    await refreshRef.set(1);
    // print("Set as 1 !!");
    // setState(() {});
    // await Future.delayed(const Duration(milliseconds: 1000));
    // while (flag) {
    //   final snapshot = await refreshRef.get();
    //   final data = snapshot.value;
    //   flag = data == 1;
    // }
    // flag = false;
    // print("Done!!!!!");
    // getImageUrl();
    //setState(() {});
  }

  Future<void> getImageUrl() async {
    // Get the feference to the image file in Firebase Storage
    final ref = storage.ref().child('photo.jpg');
    // Get teh inageUrl to download URL
    final url = await ref.getDownloadURL();
    setState(() {
      imageUrl = url;
    });
  }

  void listeners() {
    refreshRef.onValue.listen((DatabaseEvent event) {
      print("Changed!!!!!!!!");
      if (refresh != event.snapshot.value as int) {
        refresh = event.snapshot.value as int;
        if (refresh == 0) {
          flag = false;
          print("Done!!!!!");
          getImageUrl();
        }
        setState(() {});
      }

      //updateStarCount(data);
    });

    frameRef.onValue.listen((DatabaseEvent event) {
      if (frameValue != event.snapshot.value as int) {
        frameValue = event.snapshot.value as int;
        if (streamingBool == false) {
          streamingBool = true;
          setState(() {});
        }
        now = DateTime.now();
      }
      //updateStarCount(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    listeners();

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          alignment: Alignment.topCenter,
          width: double.infinity,
          child: Image(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 10,
          width: double.infinity,
        ),
        SizedBox(
          height: 50,
          width: flag
              ? 250
              : streamingBool
                  ? 170
                  : 250,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
            onPressed: !streamingBool || flag ? null : () => _refresh(),
            child: Text(
              flag
                  ? "Refreshing..."
                  : streamingBool
                      ? "Refresh"
                      : "Disconnected",
              style: TextStyle(fontSize: 30),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        // BlinkText(
        //   streamingBool ? "Disconnected" : "Live Streaming...",
        //   beginColor: streamingBool ? Colors.red : Colors.black,
        //   endColor: Colors.transparent,
        //   duration: Duration(seconds: 1),
        //   style: TextStyle(
        //     fontSize: 30,
        //     fontStyle: FontStyle.italic,
        //   ),
        // ),
      ],
    );
  }
}
