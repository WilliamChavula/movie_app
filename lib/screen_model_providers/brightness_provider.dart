import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final brightnessProvider = StateProvider<bool>(
  (ref) {
    // Can be used in initState
    Brightness brightness =
        SchedulerBinding.instance!.platformDispatcher.platformBrightness;
    return brightness == Brightness.dark;
  },
);
