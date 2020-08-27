import 'package:bloc_demo/page/form/model/form_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JLPicker {
  ///时间选择器
  static Future<Time> showSectionPicker(
    BuildContext context,
    Time time, {
    String cancel = "取消",
    String confirm = "确定",
  }) async {
    List<String> _timers = List.generate(24, (i) {
      return i + 1 < 10 ? '0${i + 1}:00' : '${i + 1}:00';
    });

    var _leftIdx = _timers.indexOf(time?.start ?? '');
    var _rightIdx = _timers.indexOf(time?.end ?? '');
    var _leftController =
        FixedExtentScrollController(initialItem: _leftIdx == -1 ? 0 : _leftIdx);
    var _rightController = FixedExtentScrollController(
        initialItem: _rightIdx == -1 ? 0 : _rightIdx);

    var _time = Time(start: time.start, end: time.end);

    ///头部
    Widget _header() {
      return Container(
        color: Color(0xFFF3F6F9),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              child: Text(
                cancel,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Color(0xFF031A1F),
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            GestureDetector(
              child: Text(
                confirm,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Color(0xFF00C0EB),
                ),
              ),
              onTap: () {
                Navigator.of(context).pop(_time);
              },
            ),
          ],
        ),
      );
    }

    ///文本
    Widget _makeText(String text, bool select) {
      return Center(
        child: DefaultTextStyle(
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            textAlign: TextAlign.center,
            style: select
                ? TextStyle(color: Color(0xFF031A1F), fontSize: 16)
                : TextStyle(color: Color(0xFFACB7BA), fontSize: 14),
            child: Text(text)),
      );
    }

    Widget _leftPicker() {
      return Expanded(
        child: Container(
          padding: EdgeInsets.all(15),
          child: StatefulBuilder(
            builder: (context, setState) {
              return CupertinoPicker.builder(
                scrollController: _leftController,
                backgroundColor: null,
                itemExtent: 50,
                diameterRatio: 2,
                childCount: _timers.length,
                onSelectedItemChanged: (i) {
                  _time.start = _timers[i];
                  _leftIdx = i;
                  setState(() {});
                  if (i > _rightController.selectedItem) {
                    _rightController.jumpToItem(i);
                  }
                },
                itemBuilder: (ctx, idx) {
                  return _makeText(_timers[idx], idx == _leftIdx);
                },
              );
            },
          ),
        ),
      );
    }

    Widget _rightPicker() {
      return Expanded(
        child: Container(
          padding: EdgeInsets.all(15),
          child: StatefulBuilder(
            builder: (context, setState) {
              return CupertinoPicker.builder(
                scrollController: _rightController,
                backgroundColor: null,
                itemExtent: 50,
                diameterRatio: 2,
                childCount: _timers.length,
                onSelectedItemChanged: (i) {
                  _time.end = _timers[i];
                  _rightIdx = i;
                  setState(() {});
                  if (i < _leftController.selectedItem) {
                    _leftController.jumpToItem(i);
                  }
                },
                itemBuilder: (ctx, idx) {
                  return _makeText(_timers[idx], idx == _rightIdx);
                },
              );
            },
          ),
        ),
      );
    }

    Widget _toText() {
      return Text(
        '到',
        style: TextStyle(
          fontSize: 16,
          color: Color(0xFF011B23),
        ),
      );
    }

    ///内容
    Widget _content() {
      return Container(
        height: 224,
        child: Row(
          children: <Widget>[
            _leftPicker(),
            _toText(),
            _rightPicker(),
          ],
        ),
      );
    }

    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _header(),
              _content(),
            ],
          ),
        );
      },
    );
  }
}
