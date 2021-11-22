import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:valuet_space_app/screens/add_password_screen.dart';

class FlipCardWidget extends StatelessWidget {
  String fronttext;
  String backtext;
  Function onTap;
  FlipCardWidget(
      {required this.fronttext, required this.backtext, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      alignment: Alignment.center,
      fill: Fill
          .fillBack, // Fill the back side of the card to make in the same size as the front.
      direction: FlipDirection.HORIZONTAL, // default
      front: Container(
        decoration:BoxDecoration(

         color: Colors.blue.shade200,
         borderRadius: BorderRadius.circular(20),

        ),
        margin: const EdgeInsets.all(10),
        
        height: 80,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
                child: Text(fronttext,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'Poppins'))),

                         GestureDetector(
                onTap: () {
                  onTap();
                },
                child: Icon(Icons.edit)),
          ],
        ),
                    
      ),
      back: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
                child: Text(backtext,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'Poppins'))),
            GestureDetector(
                onTap: () {
                  onTap();
                },
                child: Icon(Icons.edit)),
          ],
        ),
      ),
    );
  }
}
