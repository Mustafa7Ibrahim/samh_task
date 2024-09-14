import 'package:flutter/material.dart';
import 'package:samh_task/core/resource/resource.dart';

class FromToHomeWidget extends StatelessWidget {
  const FromToHomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: 60, left: 20),
      height: size.height * 0.36,
      width: size.width,
      alignment: Alignment.topCenter,
      child: Image.asset(
        R.ASSETS_FROM_TO_HOME_PNG,
        width: size.width * 0.5,
      ),
    );
  }
}
