import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:movie_app/core/di_handler/app_di_handler.dart';
import 'package:movie_app/core/route/app_route.dart';
import 'package:movie_app/core/route/route_name.dart';
import 'package:movie_app/core/theme/theme.dart';

import 'core/bloc_observe_handler/bloc_observer_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = BlocObserverHandler();
  AppDiHandler.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: TAppTheme.darkAppTheme,
      initialRoute: RouteNames.splash,
      onGenerateRoute: AppRouter.generateRoute,
      builder: EasyLoading.init(builder: BotToastInit()),
    );
  }
}
