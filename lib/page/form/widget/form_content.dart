import 'package:bloc_demo/bloc/network_state.dart';
import 'package:bloc_demo/config/dialog.dart';
import 'package:bloc_demo/config/gaps.dart';
import 'package:bloc_demo/config/loading.dart';
import 'package:bloc_demo/config/toast.dart';
import 'package:bloc_demo/page/form/model/form_model.dart';
import 'package:bloc_demo/page/form/widget/section_picker.dart';
import 'package:bloc_demo/page/form/widget/content_item.dart';
import 'package:bloc_demo/page/form/widget/type_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/blocs.dart';

class FormContent extends StatefulWidget {
  @override
  _FormContentState createState() => _FormContentState();
}

class _FormContentState extends State<FormContent> {

  ///选择类型
  void _setType(int index) {
    BlocProvider.of<FormBloc>(context).add(FormUpdateTypeEvent(selectIndex: index));
  }
  ///选择区间
  void _setTime(String start, String end) {
    BlocProvider.of<FormBloc>(context).add(FormUpdateTimeEvent(start: start, end: end));
  }
  ///确定提交
  void _confirmSave() {
    if (BlocProvider.of<FormBloc>(context).state is FormLoadedState) {
      var model = (BlocProvider.of<FormBloc>(context).state as FormLoadedState).data;
      BlocProvider.of<SubmitBloc>(context).add(SubmitEvent(submit: model.toSubmit()));
    }
  }
  ///时间选择器
  void _showPicker(Time time) {
    JLPicker.showSectionPicker(context, time).then((newTime){
      if(newTime != null) { _setTime(newTime.start, newTime.end); }
    });
  }
  ///退出
  Future<bool> _exitPage(BuildContext context) async {
    var state = BlocProvider.of<FormBloc>(context).state;
    if (state is FormLoadedState) {
      if (state.data.toSubmit() != state.initSubmit) {
        //数据有变化, 弹窗
        JLDialog.cancelConfirmTextDialog(context, content: '内容已经变更，是否保存？').then((confirm){
          confirm ?  _confirmSave() : Navigator.of(context).pop();
        });
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormBloc, FormDataState>(
      builder: (context, state){
        return WillPopScope(
          onWillPop: () => _exitPage(context),
          child: Scaffold(
            appBar: AppBar(title: Text('设置'),),
            body: Container(
              color: Color(0xFFF6FAFF),
              child: BlocBuilder<FormBloc, FormDataState>(
                  builder: (context, state) {
                    if (state is FormInProgressState) {
                      return LoadingIndicator();
                    }
                    if (state is FormFailureState) {
                      ToastUtil.show(state.error);
                      return Container();
                    }
                    if (state is FormLoadedState) {
                      var model = state.data;
                      return SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            _sectionHeader(),
                            ContentItem(title: '选择区间', content: model.timeString, hasArrow: true, onTap: () => _showPicker(model.time),),
                            _divider(),
                            ContentItem(title: '选择地址', content: model.address, hasArrow: false,),
                            _sectionHeader(),
                            TypeItem(items: model.types ?? [], onIndexTap: (index) => _setType(index),),
                            _divider(),
                            ContentItem(title: '选择次数', content: model.counString, hasArrow: false,),
                            _buildSaveButton(),
                          ],
                        ),
                      );
                    }
                    return Container();
                  }),
            ),
          ),
        );
      },
    );
  }

  ///组头
  Widget _sectionHeader() => Container(color: Color(0xFFF6FAFF), height: 10);

  ///分割线
  Widget _divider() => Gaps.hLine1;

  ///保存按钮
  Widget _buildSaveButton() {
    return BlocListener<SubmitBloc, NetworkState>(
      listener: (ctx, state){
        if (state is NetworkSuccessState) {
          ToastUtil.show('保存成功!');
          Navigator.of(context).pop();
        }
        if (state is NetworkFailureState) {
          ToastUtil.show(state.error);
        }
      },
      child: Container(
        padding: EdgeInsets.only(top: 24, left: 15, right: 15, bottom: 16),
        child: GestureDetector(
          onTap: _confirmSave,
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: Color(0xFF00C0EB),
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            child: Center(
              child: Text("确定",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),),
            ),
          ),
        ),
      ),
    );
  }
}


