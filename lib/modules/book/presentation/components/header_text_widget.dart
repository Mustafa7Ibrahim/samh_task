import 'package:flutter/material.dart';
import 'package:samh_task/core/extensions/local_extension.dart';

class HeaderTextWidget extends StatelessWidget {
  const HeaderTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.4,
      alignment: context.isRTL ? Alignment.centerRight : Alignment.centerLeft,
      padding: EdgeInsets.only(
        left: context.isRTL ? 0 : 24,
        right: context.isRTL ? 24 : 0,
        top: size.height * 0.02,
      ),
      child: Text(
        context.tr.bookYourFlight,
        style: TextStyle(
          color: Colors.white,
          fontSize: 42,
          height: 1.2,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
