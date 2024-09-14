import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:samh_task/core/extensions/local_extension.dart';
import 'package:samh_task/core/resource/resource.dart';
import 'package:samh_task/core/router/routes/app_router.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    required this.navigationShell,
    required this.children,
    super.key,
  });

  final StatefulNavigationShell navigationShell;
  final List<Widget> children;

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = navigationShell.currentIndex;
    return Scaffold(
      body: IndexedStack(index: currentIndex, children: children),
      floatingActionButton: FloatingActionButton(
        onPressed: () => EmptyRoute().go(context),
        child: SvgPicture.asset(R.ASSETS_FLIGHT_SVG),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      extendBody: true,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        color: Theme.of(context).colorScheme.primary,
        height: 70,
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                overlayColor: WidgetStateProperty.all(Colors.transparent),
                onTap: () => _onTap(context, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 40.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(R.ASSETS_BOOK_SVG),
                      Text(
                        context.tr.book,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                overlayColor: WidgetStateProperty.all(Colors.transparent),
                onTap: () => _onTap(context, 1),
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(end: 40.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(R.ASSETS_SEARCH_SVG),
                      Text(
                        context.tr.search,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
