import 'package:get_it/get_it.dart';

import '../../features/di/home_di.dart';

var sl = GetIt.instance;

abstract class AppDiHandler {
  static Future<void> init() async {
    // AuthDi.setUp();
    HomeDi.setUp();
  }
}
