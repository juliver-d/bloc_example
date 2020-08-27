import 'package:flutter/material.dart';

@immutable
abstract class NetworkState {}

class NetworkInitState extends NetworkState {}

class NetworkSuccessState<T> extends NetworkState {
  final T data;
  NetworkSuccessState({this.data});
}

class NetworkFailureState extends NetworkState {
  final String error;
  NetworkFailureState({@required this.error});
}

class NetworkInProgressState extends NetworkState {}