part of 'app_router.dart';

class EmptyRoute extends GoRouteData {
  EmptyRoute();

  static const routes = [
    TypedGoRoute<EmptyRoute>(path: 'empty', routes: []),
  ];

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Scaffold(
      body: Center(
        child: Text('Empty Screen'),
      ),
    );
  }
}
