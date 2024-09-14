import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:samh_task/core/resource/resource.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({
    super.key,
    this.isBook = false,
  });
  final bool isBook;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: isBook ? size.height * 0.4 : size.height * 0.36,
      width: size.width,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: SvgPicture.asset(R.ASSETS_MAP_SVG, width: size.width),
    );
  }
}
