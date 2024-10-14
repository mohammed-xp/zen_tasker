import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zen_tasker/constants.dart';
import 'package:zen_tasker/core/models/task_model.dart';
import 'package:zen_tasker/core/services/custom_bloc_observer.dart';
import 'package:zen_tasker/core/services/get_it_service.dart';
import 'package:zen_tasker/core/services/prefs.dart';
import 'package:zen_tasker/core/utils/app_colors.dart';
import 'package:zen_tasker/features/splash/presentation/views/splash_view.dart';
import 'core/helper_function/on_generate_routes.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();

  await Hive.initFlutter();

  await Hive.openBox<TaskModel>(kTasksBox);

  Hive.registerAdapter<TaskModel>(TaskModelAdapter());

  Bloc.observer = CustomBlocObserver();

  setupGetIt();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zen Tasker',
      locale: const Locale('en'),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData(
        fontFamily: 'Cairo',
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
    );
  }
}
