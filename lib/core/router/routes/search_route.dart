part of 'app_router.dart';

class SearchRoute extends GoRouteData {
  SearchRoute();

  static const routes = [
    TypedGoRoute<SearchRoute>(path: '/search', routes: []),
  ];

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Scaffold(
      body: Center(
        child: Text('Search Route'),
      ),
    );
  }
}
