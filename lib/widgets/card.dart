import 'package:flutter/material.dart';

class dataCard extends StatelessWidget {
  final String value;
  final String _name;
  final IconData _icons;
  final double _fontsize;
  final double _iconsize;
  dataCard(this._name, this.value, this._icons, this._fontsize, this._iconsize);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 10, width: double.infinity),
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
                  size: _iconsize,
                ),
              ),
              Expanded(
                flex: 6,
                child: Text(
                  _name,
                  style: TextStyle(fontSize: _fontsize, color: Colors.white),
                  textAlign: TextAlign.left,
                ),
              ),
              Expanded(
                flex: 8,
                child: Text(
                  value,
                  style: TextStyle(fontSize: _fontsize, color: Colors.white),
                  textAlign: TextAlign.right,
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
