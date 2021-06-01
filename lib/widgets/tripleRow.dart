import 'package:flutter/material.dart';

class TripleRow extends StatefulWidget {
  @override
  _TripleRowState createState() => _TripleRowState();

  String title1;
  double value1;
  String title2;
  double value2;
  String title3;
  double value3;

  Color colorVal1;
  Color colorVal2;
  Color colorVal3;
  TripleRow({
    @required this.title1,
    @required this.value1,
    @required this.title2,
    @required this.value2,
    @required this.title3,
    @required this.value3,
    this.colorVal1 = Colors.green,
    this.colorVal2 = Colors.green,
    this.colorVal3 = Colors.green,
  });
}

class _TripleRowState extends State<TripleRow> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      elevation: 4,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 12.0,
              right: 12.0,
              // bottom: 2,
              top: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title1,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "\$${widget.value1}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: widget.colorVal1,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 12.0,
              right: 12.0,
              // top: 8,
              // bottom: 8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title2,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "\$${widget.value2}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: widget.colorVal2,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 12.0,
              right: 12.0,
              // top: 5,
              bottom: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title3,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "\$${widget.value3}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: widget.colorVal3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
