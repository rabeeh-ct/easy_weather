import 'package:flutter/material.dart';

import '../di/di.dart';
import '../presentation/theme/theme.dart';

setupApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Dependency Injection
  DependencyInjection.init();
  setSystemOverlay();
}
