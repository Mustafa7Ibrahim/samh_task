part of '../routes/app_router.dart';

@TypedStatefulShellRoute<MainBranch>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    TypedStatefulShellBranch<BookBranch>(routes: BookRoute.routes),
    TypedStatefulShellBranch<SearchBranch>(routes: SearchRoute.routes),
  ],
)
class MainBranch extends StatefulShellRouteData {
  const MainBranch();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return navigationShell;
  }

  static const String $restorationScopeId = 'restorationScopeId';

  static Widget $navigatorContainerBuilder(
    BuildContext context,
    StatefulNavigationShell navigationShell,
    List<Widget> children,
  ) =>
      NavBar(navigationShell: navigationShell, children: children);
}

// book branch
class BookBranch extends StatefulShellBranchData {
  const BookBranch();

  static const String $restorationScopeId = 'restorationBookScopeId';
}

// search branch
class SearchBranch extends StatefulShellBranchData {
  const SearchBranch();

  static const String $restorationScopeId = 'restorationSearchScopeId';
}
