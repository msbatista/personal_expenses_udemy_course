import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      child: Card(
        color: Colors.amber,
        child: Text('CHART!'),
        elevation: 5,
      ),
    );
  }
}
