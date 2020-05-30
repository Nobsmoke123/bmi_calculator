import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
    final Function onTap;
    final String label;

    BottomButton({this.onTap, this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            child: Center(
                child: Text(
                    label,
                    style: kLargeButtonTextStyle,
                ),
            ),
            padding: const EdgeInsets.only(bottom: 20.0),
            width: double.infinity,
            margin: const EdgeInsets.only(top: 10.0),
            color: kBottomContainerColor,
            height: kBottomContainerHeight,
        ),
    );
  }
}
