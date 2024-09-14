import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:samh_task/app.dart';
import 'package:talker_riverpod_logger/talker_riverpod_logger_observer.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ProviderScope(
      observers: [TalkerRiverpodObserver()],
      child: MyApp(),
    ),
  );
}
