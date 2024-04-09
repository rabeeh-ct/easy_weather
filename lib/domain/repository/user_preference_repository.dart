import 'dart:ui';

import 'package:dartz/dartz.dart';
import '../entities/app_error.dart';

abstract class UserPreferencesRepository {
  Future<Either<AppError, Unit>> changeLocale(Locale locale);
}
