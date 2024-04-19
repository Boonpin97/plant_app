import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final int value;
  final String _name;
  final _functionHandler;
  final IconData _icons;
  Button(this._functionHandler, this._name, this.value, this._icons);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10, width: double.infinity),
        SizedBox(
          height: 50,
          width: 270,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: value == 1 ? Color.fromRGBO(92, 147, 72, 1) : Colors.red,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
            ),
            onPressed: _functionHandler,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 2,
                  child: Icon(
                    _icons,
                    size: 35,
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: Text(
                    _name,
                    style: TextStyle(fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Text(
                    value == 1 ? "ON" : "OFF",
                    style: TextStyle(fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: SizedBox(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
