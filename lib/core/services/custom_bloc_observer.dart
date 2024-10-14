import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBlocObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    if (kDebugMode) {
      log('Change: $change');
    }
  }

  @override
  void onClose(BlocBase bloc) {
    if (kDebugMode) {
      log('Close: $bloc');
    }
  }

  @override
  void onCreate(BlocBase bloc) {
    if (kDebugMode) {
      log('Create: $bloc');
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    // TODO: implement onEvent
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
  }
}
