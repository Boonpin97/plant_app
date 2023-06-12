import 'package:flutter/material.dart';

class dataCard extends StatelessWidget {
  final String value;
  final String _name;
  final IconData _icons;
  dataCard(this._name, this.value, this._icons);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 13, width: double.infinity),
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Expanded(
                flex: 2,
                child: Icon(
                  _icons,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              Expanded(
                flex: 9,
                child: Text(
                  _name,
                  style: TextStyle(fontSize: 25, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                flex: 6,
                child: Text(
                  value,
                  style: TextStyle(fontSize: 25, color: Colors.white),
                  textAlign: TextAlign.center,
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
