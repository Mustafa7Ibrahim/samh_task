import 'package:flutter/material.dart';
import 'package:samh_task/core/extensions/local_extension.dart';

enum TripType {
  roundTrip,
  oneWay,
  multiCity;

  String title(BuildContext context) {
    switch (this) {
      case TripType.oneWay:
        return context.tr.oneWay;
      case TripType.roundTrip:
        return context.tr.roundTrip;
      case TripType.multiCity:
        return context.tr.multiCity;
    }
  }
}
