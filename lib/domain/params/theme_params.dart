import 'package:equatable/equatable.dart';

class ThemeParams extends Equatable {
  final int themeMode;

//system mode 0
//light mode 1
//dark mode 2
  const ThemeParams({required this.themeMode});

  @override
  // TODO: implement props
  List<Object?> get props => [themeMode];

  Map<String, dynamic> toMap() {
    return {
      'themeMode': themeMode,
    };
  }
}
