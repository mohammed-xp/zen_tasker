// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Zen`
  String get zen {
    return Intl.message(
      'Zen',
      name: 'zen',
      desc: '',
      args: [],
    );
  }

  /// `Tasker`
  String get tasker {
    return Intl.message(
      'Tasker',
      name: 'tasker',
      desc: '',
      args: [],
    );
  }

  /// `Start organizing your day and managing your tasks with ease. Never miss a task again!`
  String get onBoardingSubTitle1 {
    return Intl.message(
      'Start organizing your day and managing your tasks with ease. Never miss a task again!',
      name: 'onBoardingSubTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to`
  String get welcomeTo {
    return Intl.message(
      'Welcome to',
      name: 'welcomeTo',
      desc: '',
      args: [],
    );
  }

  /// `Whether it is daily or weekly tasks, you can easily add tasks and set deadlines`
  String get onBoardingSubTitle2 {
    return Intl.message(
      'Whether it is daily or weekly tasks, you can easily add tasks and set deadlines',
      name: 'onBoardingSubTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Add your tasks easily`
  String get onBoardingTitle2 {
    return Intl.message(
      'Add your tasks easily',
      name: 'onBoardingTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Start Now`
  String get startNow {
    return Intl.message(
      'Start Now',
      name: 'startNow',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Smart Reminders`
  String get onBoardingTitle3 {
    return Intl.message(
      'Smart Reminders',
      name: 'onBoardingTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Get notifications to remind you of important tasks at the right time, and you will never miss a task`
  String get onBoardingSubTitle3 {
    return Intl.message(
      'Get notifications to remind you of important tasks at the right time, and you will never miss a task',
      name: 'onBoardingSubTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Complete your tasks and see your progress`
  String get onBoardingTitle4 {
    return Intl.message(
      'Complete your tasks and see your progress',
      name: 'onBoardingTitle4',
      desc: '',
      args: [],
    );
  }

  /// `Mark completed tasks and track your achievements day by day`
  String get onBoardingSubTitle4 {
    return Intl.message(
      'Mark completed tasks and track your achievements day by day',
      name: 'onBoardingSubTitle4',
      desc: '',
      args: [],
    );
  }

  /// `Ready to get started?`
  String get onBoardingTitle5 {
    return Intl.message(
      'Ready to get started?',
      name: 'onBoardingTitle5',
      desc: '',
      args: [],
    );
  }

  /// `Start organizing your life today and get more done easily!`
  String get onBoardingSubTitle5 {
    return Intl.message(
      'Start organizing your life today and get more done easily!',
      name: 'onBoardingSubTitle5',
      desc: '',
      args: [],
    );
  }

  /// `Good Morning`
  String get goodMorning {
    return Intl.message(
      'Good Morning',
      name: 'goodMorning',
      desc: '',
      args: [],
    );
  }

  /// `Good Evening`
  String get goodEvening {
    return Intl.message(
      'Good Evening',
      name: 'goodEvening',
      desc: '',
      args: [],
    );
  }

  /// `Find Your Task`
  String get findYourTask {
    return Intl.message(
      'Find Your Task',
      name: 'findYourTask',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
