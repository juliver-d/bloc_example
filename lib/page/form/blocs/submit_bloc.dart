import 'package:bloc/bloc.dart';
import 'package:bloc_demo/bloc/network_state.dart';
import 'package:bloc_demo/page/form/model/form_model.dart';
import 'package:bloc_demo/page/form/repository/form_repository.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

/// - 提交

/// - Event
//提交
class SubmitEvent {
  SubmitEvent({this.submit});
  FormSubmit submit;
}

/// - State -> NetworkState


/// - Bloc
class SubmitBloc extends Bloc<SubmitEvent, NetworkState> {
  @override
  NetworkState get initialState => NetworkInitState();

  final FormRepository repo;
  SubmitBloc({@required this.repo}) : assert(repo != null);

  @override
  Stream<NetworkState> mapEventToState(
      SubmitEvent event,
      ) async* {
    yield NetworkInProgressState();
    try {
      bool result = await repo.saveForm(event.submit);
      yield NetworkSuccessState<bool>(data: result);
    } catch (error) {
      yield NetworkFailureState(error: error.toString());
    }
  }

  @override
  Stream<Transition<SubmitEvent, NetworkState>> transformEvents(Stream<SubmitEvent> events, transitionFn) {
    return super.transformEvents(events.throttleTime(Duration(milliseconds: 500)), transitionFn);
    /*
    防抖（debounce） 所谓防抖，就是指触发事件后在 n 秒内函数只能执行一次，如果在 n 秒内又触发了事件，则会重新计算函数执行时间。(连续输入搜索)
    节流（throttle） 所谓节流，就是指连续触发事件但是在 n 秒中只执行一次函数。节流会稀释函数的执行频率。(快速点击)
    */
  }
}