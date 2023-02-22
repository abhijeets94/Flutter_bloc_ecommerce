import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(
    Bloc bloc,
    Object? event,
  ) {
    super.onEvent(bloc, event);
    debugPrint("${bloc.runtimeType} $event");
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint("${bloc.runtimeType} $error $stackTrace");
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    debugPrint("${bloc.runtimeType} $transition");
    super.onTransition(bloc, transition);
  }
}
