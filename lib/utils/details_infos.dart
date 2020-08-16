  import 'package:flutter/material.dart';

Widget schedule() {
    return Row(
      children: [
        Icon(Icons.schedule, color: Colors.white),
        Text(" 15 jours", style: TextStyle(color: Colors.white),)
      ],
    );
  }

  Widget position() {
    return Row(
      children: [
        Icon(Icons.flag, color : Colors.white),
        Text(" 900 kms", style: TextStyle(color: Colors.white),)
      ],
      );
  }


  Widget back_button(BuildContext context) {
    return Positioned(
            child:GestureDetector(
              child: Icon(Icons.arrow_back, color: Colors.white, size: 40,),
              onTap: () {
              Navigator.pop(context);
            }
          ),
          top: 40,
          left: 10
          );
}