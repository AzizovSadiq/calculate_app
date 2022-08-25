import 'package:flutter/material.dart';

Widget textWidgetBtn(
      String value, Color valueTextColor, double valueSize, FontWeight weight) {
    return Container(
      padding: const EdgeInsets.only(right: 20, bottom: 20),
      child: Text(
        value,
        style: TextStyle(
            color: valueTextColor, fontSize: valueSize, fontWeight: weight),
      ),
    );
  }