import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:samh_task/core/router/nav_bar/nav_bar.dart';
import 'package:samh_task/modules/book/presentation/screens/book_screen.dart';
import 'package:samh_task/modules/search/presentation/screens/search_screen.dart';

part 'app_router.g.dart';
part 'book_route.dart';
part 'search_route.dart';
part 'empty_route.dart';

part '../branches/main_branches.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final globalContext = rootNavigatorKey.currentContext;

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  final router = GoRouter(
    debugLogDiagnostics: true,
    restorationScopeId: 'router',
    navigatorKey: rootNavigatorKey,
    initialLocation: BookRoute().location,
    routes: $appRoutes,
  );

  ref.onDispose(router.dispose);

  return router;
}
