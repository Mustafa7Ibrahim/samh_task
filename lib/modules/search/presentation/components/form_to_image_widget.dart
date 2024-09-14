import 'package:flutter/material.dart';
import 'package:samh_task/core/resource/resource.dart';

class FromToImageWidget extends StatelessWidget {
  const FromToImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: size.height * 0.07),
      height: size.height * 0.34,
      width: size.width,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: Image.asset(
        R.ASSETS_FROM_TO_PNG,
        width: size.width,
      ),
    );
  }
}
