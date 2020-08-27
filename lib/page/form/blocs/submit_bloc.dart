import 'package:bloc/bloc.dart';
import 'package:bloc_demo/bloc/network_state.dart';
import 'package:bloc_demo/page/form/model/form_model.dart';
import 'package:bloc_demo/page/form/repository/form_repository.dart';
import 'package:flutter/material.dart';

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
}