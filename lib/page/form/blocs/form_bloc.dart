import 'package:bloc_demo/page/form/model/form_model.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_demo/page/form/repository/form_repository.dart';

/// - Event
@immutable
abstract class FormEvent {}

//请求
class FormDataRequestEvent extends FormEvent {}

//更新时间
class FormUpdateTimeEvent extends FormEvent {
  final String start;
  final String end;
  FormUpdateTimeEvent({this.start, this.end});
}

//更新类型
class FormUpdateTypeEvent extends FormEvent {
  final int selectIndex;
  FormUpdateTypeEvent({@required this.selectIndex});
}

/// - State
@immutable
abstract class FormDataState {}

class FormInitState extends FormDataState {}

class FormLoadedState<T> extends FormDataState {
  final FormModel data;
  final FormSubmit initSubmit; //初始化提交模型
  FormLoadedState({this.data, this.initSubmit});

  FormLoadedState copyWith({
    FormModel data,
    FormSubmit initSubmitModel,
  }) {
    return FormLoadedState(
      data: data ?? this.data,
      initSubmit: initSubmitModel ?? this.initSubmit,
    );
  }
}

class FormFailureState extends FormDataState {
  final String error;
  FormFailureState({@required this.error});
}

class FormInProgressState extends FormDataState {}

/// - Bloc
class FormBloc extends Bloc<FormEvent, FormDataState> {
  @override
  FormDataState get initialState => FormInitState();

  final FormRepository repo;
  FormBloc({@required this.repo}) : assert(repo != null);

  @override
  Stream<FormDataState> mapEventToState(
      FormEvent event,
      ) async* {
    //请求
    if (event is FormDataRequestEvent) {
      yield FormInProgressState();
      try {
        final model = await repo.fetchFormData();
        yield FormLoadedState(data: model, initSubmit: model.toSubmit());
      } catch (error) {
        yield FormFailureState(error: error.toString());
      }
    }
    //更新类型
    if (event is FormUpdateTypeEvent) {
      if (state is FormLoadedState) {
        var model = (state as FormLoadedState).data;
        model.types.forEach((e) => e.selected = false );
        model.types[event.selectIndex].selected = true;
        yield (state as FormLoadedState).copyWith(data: model);
      }
    }
    //更新时间
    if (event is FormUpdateTimeEvent) {
      if (state is FormLoadedState) {
        var model = (state as FormLoadedState).data;
        model.time.start = event.start;
        model.time.end = event.end;
        yield (state as FormLoadedState).copyWith(data: model);
      }
    }
  }
}