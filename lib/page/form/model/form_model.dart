import 'package:equatable/equatable.dart';

class FormModel {
  ///时间
  Time time;
  ///地点
  String address;
  ///类型
  List<SelectValueItem> types;
  ///次数
  String count;

  ///help -
  get timeString => '${time.start}-${time.end}';
  get counString => '${count}次';

  FormSubmit toSubmit() {
    return FormSubmit(
      start: time.start,
      end: time.end,
      address: address,
      type: types.firstWhere((e) => e.selected, orElse: null)?.value ?? '0',
      count: count,
    );
  }

  FormModel({
    this.time,
    this.address,
    this.types,
    this.count,
  });

  factory FormModel.fromJson(Map<String, dynamic> json) {
    return FormModel(
      time: Time.fromJson(json['time']),
      address: json['address'].toString(),
      types: json['types'] != null
          ? (json['types'] as List).map((i) => SelectValueItem.fromJson(i)).toList()
          : null,
      count: json['count'].toString(),
    );
  }
}

///时间
class Time {
  String start;
  String end;

  Time({
    this.start,
    this.end,
  });

  factory Time.fromJson(Map<String, dynamic> json) {
    return Time(
      start: json['start_time'].toString(),
      end: json['end_time'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['start_time'] = this.start;
    data['end_time'] = this.end;
    return data;
  }
}


class SelectValueItem {
  /// 名称
  String name;
  ///值
  String value;
  ///是否选中
  bool selected;

  SelectValueItem({
    this.name,
    this.value,
    this.selected,
  });

  factory SelectValueItem.fromJson(Map<String, dynamic> json) {
    return SelectValueItem(
      name: json['name'],
      value: json['value'],
      selected: (json['selected'] as int) == 1,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['value'] = this.value;
    data['selected'] = this.selected ? 1 : 2;
    return data;
  }
}


///提交模型
class FormSubmit extends Equatable {
  ///起始时间
  final String start;
  ///结束时间
  final String end;
  ///地址
  final String address;
  ///类型
  final String type;
  ///次数
  final String count;

  FormSubmit({
    this.start,
    this.end,
    this.address,
    this.type,
    this.count,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this.start != null) { data['start_time'] = this.start; }
    if(this.end != null) { data['end_time'] = this.end; }
    if(this.address != null) { data['address'] = this.address; }
    if(this.type != null) { data['type'] = this.type; }
    if(this.count != null) { data['count'] = this.count; }
    return data;
  }

  @override
  List<Object> get props => [start, end, address, type, count];
}


