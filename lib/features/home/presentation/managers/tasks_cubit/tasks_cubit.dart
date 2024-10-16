import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:zen_tasker/constants.dart';
import 'package:zen_tasker/core/services/prefs.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(TasksInitial());

  void getSavedLanguage(BuildContext context) async {
    final String languageCode = _getLanguageCode();

    emit(TasksChangeLanguage(locale: Locale(languageCode)));
  }

  void changeLanguage(BuildContext context) async {
    String languageCode = Localizations.localeOf(context).languageCode;
    if (languageCode == 'en') {
      languageCode = 'ar';
    } else {
      languageCode = 'en';
    }

    _saveLanguageCode(languageCode);
    emit(TasksChangeLanguage(locale: Locale(languageCode)));
  }

  /// This function retrieves the language code from shared preferences.
  /// If the retrieved language code is empty, it extracts the language code from the platform locale name.
  String _getLanguageCode() {
    String languageCode = Prefs.getString(kLanguageCode);
    if (languageCode.isEmpty) {
      languageCode = Platform.localeName.split('_').first;
    }
    return languageCode;
  }

  void _saveLanguageCode(String languageCode) {
    Prefs.setString(kLanguageCode, languageCode);
  }
}
