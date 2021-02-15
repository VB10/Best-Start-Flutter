import 'package:flutter/cupertino.dart';

class BorderConstats {
  static BorderConstats instance = BorderConstats._init();
  BorderConstats._init();

  final radiusAllCirculor = RoundedRectangleBorder(borderRadius: BorderRadius.circular(16));
}
