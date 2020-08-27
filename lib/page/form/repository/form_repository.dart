import 'dart:convert';
import 'package:bloc_demo/page/form/model/form_model.dart';
import 'package:flutter/services.dart' show rootBundle;

const _delay = Duration(milliseconds: 300);
Future<void> wait() => Future.delayed(_delay);

class FormRepository {

  /// 抓取表单数据
  Future<FormModel> fetchFormData() async {
    await wait();

    String jsonString = await rootBundle.loadString("assets/json/form_data.json");
    final jsonResult = json.decode(jsonString);
    FormModel model = FormModel.fromJson(jsonResult['data']);
    return model;
  }

  /// 表单保存
  Future<bool> saveForm(FormSubmit model) async {
    await wait();
    return true;
  }
}