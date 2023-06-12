import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class logCard extends StatelessWidget {
  final String value;
  final String _name;
  logCard(this._name, this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 13, width: double.infinity),
          Row(
            children: <Widget>[
              // Expanded(
              //   flex: 1,
              //   child: SizedBox(),
              // ),
              Expanded(
                flex: 2,
                child: Text(
                  _name,
                  style: TextStyle(fontSize: 15, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                flex: 6,
                child: Text(
                  value + " on " + DateFormat('MM-dd – kk:mm').format(DateTime.now()),
                  style: TextStyle(fontSize: 15, color: Colors.white),
                  textAlign: TextAlign.left,
                ),
              ),
              Expanded(
                flex: 0,
                child: SizedBox(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
