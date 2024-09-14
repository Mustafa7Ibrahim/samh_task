import 'package:flutter/material.dart';
import 'package:samh_task/core/extensions/local_extension.dart';

class FlightsAvailableWidget extends StatelessWidget {
  const FlightsAvailableWidget({
    super.key,
    required this.flightsAvailable,
  });

  final int flightsAvailable;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: size.height * 0.30),
      child: Text(
        '${context.tr.flightsAvailable(flightsAvailable)}',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}
