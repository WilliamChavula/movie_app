import 'package:flutter/material.dart';

abstract class AppColors {
  const AppColors._();

  /// e.g. used for body content
  static const bodyColorDark = Color(0XFFFFFEFF);
  static const bodyColorLight = Color(0XFF000D22);
  static const hintTextColor = Color(0XFF7A8491);
  static const hintTextColorLight = Color(0XFF3F72AF);
  static const inputSuffixIconColor = Color(0XFFF4F7FD);
  static final inputFillColorLight = const Color(0XFFD4E3FD).withOpacity(0.3);

  /// e.g. used for primary heading
  static const primaryColor = Color(0XFFFFFEFF);

  /// e.g. used for secondary heading
  static const primaryColorAccent = Color(0XFFFDFFFF);
  static const borderColor = Color(0XFF2D394E);
  static const chipBackgroundColor = Color(0XFF142038);
  static final chipBackgroundColorLight =
      AppColors.lightThemeSwatch[100]!.withOpacity(0.6);
  static const chipLabelColor = Color(0XFF3F72AF);

  /// e.g used for buttons
  static const accentColor = Color(0XFFE4CE08);

  static const loadingIndicatorColor = Color(0XFF347579);

  static final foregroundDecorationDark = BoxDecoration(
    gradient: LinearGradient(
      colors: <Color>[
        Colors.transparent,
        Colors.transparent,
        AppColors.lightThemeSwatch[900]!,
      ],
      stops: const [0.25, 0.7, 1.0],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  );

  static const foregroundDecorationLight = BoxDecoration(
    gradient: LinearGradient(
      colors: <Color>[
        Colors.transparent,
        Colors.black38,
        Colors.black87,
      ],
      stops: [0.25, 0.7, 1.0],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  );

  /// color swatch
  static const lightThemeSwatch = <int, Color>{
    50: Color(0XFFFDFFFF),
    100: Color(0XFFb7d0fa),
    200: Color(0XFF87b0f7),
    300: Color(0XFF5991f6),
    400: Color(0XFFB0B7C7),
    500: Color(0XFF414B57),
    600: Color(0XFF2D394E),
    700: Color(0XFF1F2A3D),
    800: Color(0XFF142038),
    900: Color(0XFF000D22),
  };

  static const darkThemeSwatch = <int, Color>{
    900: Color(0XFFe3ebff),
    800: Color(0XFFb2c1ff),
    700: Color(0XFF7f94ff),
    600: Color(0XFF4c63ff),
    500: Color(0XFF1a2fff),
    400: Color(0XFF000de6),
    300: Color(0XFF0015b4),
    200: Color(0XFF001782),
    100: Color(0XFF001350),
    50: Color(0XFF000921),
  };
}
