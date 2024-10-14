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
import 'package:zen_tasker/features/home/data/repos/task_repo.dart';
import 'package:zen_tasker/features/home/presentation/managers/fetch_tasks_cubit/fetch_tasks_cubit.dart';
import 'package:zen_tasker/features/home/presentation/managers/update_task_cubit/update_task_cubit.dart';
import 'package:zen_tasker/features/splash/presentation/views/splash_view.dart';
import 'core/helper_function/on_generate_routes.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();

  await Hive.initFlutter();

  Hive.registerAdapter<TaskModel>(TaskModelAdapter());

  await Hive.openBox<TaskModel>(kTasksBox);

  Bloc.observer = CustomBlocObserver();

  setupGetIt();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FetchTasksCubit(getIt.get<TaskRepo>())..fetchAllTasks(),
        ),
        BlocProvider(
          create: (context) => UpdateTaskCubit(getIt.get<TaskRepo>()),
        ),
      ],
      child: MaterialApp(
        title: 'Zen Tasker',
        locale: const Locale('ar'),
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
      ),
    );
  }
}
