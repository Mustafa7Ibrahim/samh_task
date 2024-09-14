import 'package:flutter/material.dart';
import 'package:samh_task/core/extensions/local_extension.dart';

enum TripTravelers {
  adult,
  child,
  infant;

  String title(BuildContext context) {
    switch (this) {
      case TripTravelers.adult:
        return context.tr.adult;
      case TripTravelers.child:
        return context.tr.child;
      case TripTravelers.infant:
        return context.tr.infant;
    }
  }
}
