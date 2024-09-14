part of 'app_router.dart';

class BookRoute extends GoRouteData {
  BookRoute();

  static const routes = [
    TypedGoRoute<BookRoute>(
      path: '/book',
      routes: [...SearchFlightRoute.routes, ...EmptyRoute.routes],
    ),
  ];

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const BookScreen();
  }
}

class SearchFlightRoute extends GoRouteData {
  SearchFlightRoute({required this.from, required this.to});

  final String from;
  final String to;

  static const routes = [
    TypedGoRoute<SearchFlightRoute>(path: 'search-flight', routes: []),
  ];

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SearchScreen(from: from, to: to);
  }
}
