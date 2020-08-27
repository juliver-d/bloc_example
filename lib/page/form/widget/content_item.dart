import 'package:bloc_demo/config/gaps.dart';
import 'package:flutter/material.dart';

class ContentItem extends StatefulWidget {
  @override
  _ContentItemState createState() => _ContentItemState();

  ContentItem({
    Key key,
    @required this.title,
    this.content = '',
    this.hasArrow = false,
    this.onTap,
  }) : super(key: key);

  final String title;
  final String content;
  final bool hasArrow;
  final VoidCallback onTap;
}

class _ContentItemState extends State<ContentItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.all(15),
        color: Colors.white,
        child: Row(
          children: <Widget>[
            _buildTitle(),
            Gaps.hGap8,
            _buildContent(),
            Visibility(
              visible: widget.hasArrow,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Gaps.hGap8,
                  _buildArrow(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      widget.title,
      style: TextStyle(
        fontSize: 14,
        color: Color(0xFF031A1F),
      ),
    );
  }

  Widget _buildContent() {
    return Expanded(
      child: Text(
        widget.content,
        textAlign: TextAlign.right,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: TextStyle(
          fontSize: 14,
          color: Color(0xFF8D9799),
        ),
      ),
    );
  }

  Widget _buildArrow() {
    return Image.asset(
      'assets/image/icon_right_arrow.png',
      width: 12,
      height: 12,
    );
  }
}
