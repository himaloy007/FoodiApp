import 'package:flutter/material.dart';

class MyContainerBox extends StatelessWidget {
  final String str;
  final Color color;
  const MyContainerBox({super.key, required this.str, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(children: [Text(str)]),
    );
  }
}
