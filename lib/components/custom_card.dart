import 'package:flutter/material.dart';

//Class CustomCard
class CustomCard extends StatelessWidget {
    final Color colour;
    final Widget cardChild;
    final Function onPress;
//    Class Constructor
    CustomCard({ @required this.colour, this.cardChild, this.onPress });

    @override
    Widget build(BuildContext context) {
        // colour: Color(0xFF1D1E33)
        return GestureDetector(
            onTap: onPress,
          child: Container(
              margin: const EdgeInsets.all(15.0),
              child: cardChild,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: colour,
              ),
          ),
        );
    }
}