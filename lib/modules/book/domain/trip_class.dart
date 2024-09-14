import 'package:flutter/material.dart';
import 'package:samh_task/core/extensions/local_extension.dart';

enum TripClass {
  economy,
  business,
  firstClass;

  String title(BuildContext context) {
    switch (this) {
      case TripClass.economy:
        return context.tr.economy;
      case TripClass.business:
        return context.tr.business;
      case TripClass.firstClass:
        return context.tr.firstClass;
    }
  }
}
