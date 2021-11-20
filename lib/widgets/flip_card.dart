import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlipCardWidget extends StatelessWidget {
  String fronttext;
  String backtext;
  FlipCardWidget({required this.fronttext, required this.backtext});

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      alignment: Alignment.center,
      fill: Fill
          .fillBack, // Fill the back side of the card to make in the same size as the front.
      direction: FlipDirection.HORIZONTAL, // default
      front: Container(
         margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        height: 100,
        width: double.infinity,
        child: Center(
            child: Text(fronttext,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    fontFamily: 'Poppins'))),
      ),
      back: Container(
        color: Colors.blue.shade200,
        child: Center(
            child: Text(backtext,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    fontFamily: 'Poppins'))),
      ),
    );
  }
}
