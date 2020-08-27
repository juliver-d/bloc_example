import 'package:bloc_demo/config/gaps.dart';
import 'package:bloc_demo/page/form/model/form_model.dart';
import 'package:flutter/material.dart';

typedef IndexCallback = void Function(int index);

class TypeItem extends StatefulWidget {
  TypeItem({
    @required this.items,
    this.onIndexTap,
  });

  ///数据
  final List<SelectValueItem> items;
  ///点击
  final IndexCallback onIndexTap;

  @override
  _TypeItemState createState() => _TypeItemState();
}

class _TypeItemState extends State<TypeItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      padding: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildTitle(),
          Gaps.vGap15,
          _buildList(),
        ],
      ),
    );
  }

  ///标题
  Widget _buildTitle() {
    return Text(
      '选择类型',
      style: TextStyle(
        fontSize: 14,
        color: Color(0xFF031A1F),
      ),
    );
  }

  ///列表
  Widget _buildList() {
    return ListView.builder(
      padding: EdgeInsets.all(0),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: widget.items.length,
      itemBuilder: (ctx, idx) {
        return _buildListItem(idx);
      },
    );
  }

  ///列表项
  Widget _buildListItem(idx) {
    final item = widget.items[idx];
    final itemIcon = item.selected
        ? 'assets/image/icon_small_cycle_select.png'
        : 'assets/image/icon_small_cycle_normal.png';
    final itemText = item.name;

    return GestureDetector(
      onTap: () => widget.onIndexTap(idx),
      child: Container(
        padding: EdgeInsets.only(bottom: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildItemIcon(itemIcon),
            Gaps.hGap8,
            _buildItemText(itemText),
          ],
        ),
      ),
    );
  }

  ///
  _buildItemIcon(String iconName) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2),
      child: Image.asset(
        iconName,
        width: 16,
        height: 16,
      ),
    );
  }

  ///
  _buildItemText(String text) {
    return Expanded(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          color: Color(0xFF031A1F),
        ),
      ),
    );
  }
}
