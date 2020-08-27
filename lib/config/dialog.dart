import 'package:bloc_demo/config/theme.dart';
import 'package:flutter/material.dart';
import 'gaps.dart';

class JLDialog {
  ///确定取消dialog
  static Future<bool> cancelConfirmDialog(
    BuildContext context, {
    String title = "提醒",
    String cancelTitle = "取消",
    String actionText = "确定",
    Widget child,
  }) async {
    bool confirm = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        var childContainer =
        Stack(
          children: <Widget>[
            Positioned(
              right: 16.0,
              top: 16.0,
              child: GestureDetector(
                child: Image.asset(
                  'assets/image/icon_close.png',
                  width: 22,
                  height: 22,
                ),
                onTap: () {
                  Navigator.of(context).pop(false);
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 40, left: 26, right: 26, bottom: 40),
              child: Stack(
                children: <Widget>[
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(
                            color: Color(0xFF031a1f),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      child,
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: GestureDetector(
                                child: Container(
                                    height: 44,
                                    decoration: ShapeDecoration.fromBoxDecoration(
                                      BoxDecoration(
                                        border: Border.all(
                                            color: JLColors.orange,
                                            style: BorderStyle.solid,
                                            width: 0.5),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(
                                            4,
                                          ),
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        cancelTitle,
                                        style: TextStyle(
                                            fontSize: 16, color: JLColors.orange),
                                      ),
                                    )),
                                onTap: () {
                                  Navigator.of(context).pop(false);
                                },
                              )),
                          Gaps.hGap16,
                          Expanded(
                            child: Container(
                              height: 44,
                              child: FlatButton(
                                color: JLColors.orange,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    4,
                                  ),
                                ),
                                child: Text(
                                  actionText,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop(true);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        );
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          child: Container(
            child: childContainer,
          ),
        );
      },
    );
    return Future.value(confirm ?? false);
  }

  ///文本确定取消dialog
  static Future<bool> cancelConfirmTextDialog(
    BuildContext context, {
    String title = "提醒",
    String cancelTitle = "取消",
    String actionText = "确定",
    String content = "",
  }) async {
    return JLDialog.cancelConfirmDialog(
      context,
      title: title,
      cancelTitle: cancelTitle,
      actionText: actionText,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 24),
        child: Center(
          child: Text(
            content,
            style: TextStyle(color: JLColors.black, fontSize: 14),
          ),
        ),
      ),
    );
  }
}
