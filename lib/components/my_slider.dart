import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../constants.dart';

class MySlider extends StatelessWidget {
    final int height;
    final Function onChanged;

    MySlider({this.height, this.onChanged});
  @override
  Widget build(BuildContext context) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
              Text(
                  'HEIGHT',
                  textAlign: TextAlign.center,
                  style: kLabelTextStyle,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                      Text(
                          height.toString(),
                          style: kNumberTextStyle,
                      ),
                      Text(
                          'cm',
                          style: kLabelTextStyle,
                      )
                  ],
              ),
              SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                      inactiveTrackColor: Color(0xFF8D8E98),
                  ),
                  child: Slider(
                      onChanged: onChanged,
                      value: height.toDouble(),
                      min: 0.0,
                      max: 1500.0,
                  ),
              )
          ],
      );
  }
}
