import 'package:flutter/material.dart';

/// 间隔
class Gaps {
  /// 水平间隔
  static const Widget hGap4 = SizedBox(width: 4);
  static const Widget hGap5 = SizedBox(width: 5);
  static const Widget hGap6 = SizedBox(width: 6);
  static const Widget hGap7 = SizedBox(width: 7);
  static const Widget hGap8 = SizedBox(width: 8);
  static const Widget hGap10 = SizedBox(width: 10);
  static const Widget hGap12 = SizedBox(width: 12);
  static const Widget hGap15 = SizedBox(width: 15);
  static const Widget hGap16 = SizedBox(width: 16);
  static const Widget hGap18 = SizedBox(width: 18.5);
  static const Widget hGap20 = SizedBox(width: 20);
  static const Widget hGap24 = SizedBox(width: 24);

  /// 垂直间隔
  static const Widget vGap2 = SizedBox(height: 2);
  static const Widget vGap4 = SizedBox(height: 4);
  static const Widget vGap5 = SizedBox(height: 5);
  static const Widget vGap6 = SizedBox(height: 6);
  static const Widget vGap8 = SizedBox(height: 8);
  static const Widget vGap10 = SizedBox(height: 10);
  static const Widget vGap12 = SizedBox(height: 12);
  static const Widget vGap13 = SizedBox(height: 13);
  static const Widget vGap14 = SizedBox(height: 14);
  static const Widget vGap15 = SizedBox(height: 15);
  static const Widget vGap16 = SizedBox(height: 16);
  static const Widget vGap20 = SizedBox(height: 20);
  static const Widget vGap24 = SizedBox(height: 24);
  static const Widget vGap25 = SizedBox(height: 25);
  static const Widget vGap36 = SizedBox(height: 36);
  static const Widget vGap40 = SizedBox(height: 40);

  static const Widget gap0 = SizedBox(width: 0, height: 0);

  // 水平分割线
  static const Widget hLine1 = Divider(
    height: 1,
    indent: 15,
    endIndent: 15,
    color: Color(0xFFE3E7EB),
  );

  static const Widget empty = SizedBox.shrink();
}
