import 'package:flutter/material.dart';
import 'package:samh_task/core/extensions/local_extension.dart';

enum Countries {
  egypt,
  saudiArabia,
  unitedStates,
  unitedKingdom,
  canada,
  australia,
  japan,
  china;

  String name(BuildContext context) {
    return switch (this) {
      Countries.egypt => context.tr.egy,
      Countries.saudiArabia => context.tr.saudiArabia,
      Countries.unitedStates => context.tr.unitedStates,
      Countries.unitedKingdom => context.tr.unitedKingdom,
      Countries.canada => context.tr.canada,
      Countries.australia => context.tr.australia,
      Countries.japan => context.tr.japan,
      Countries.china => context.tr.china,
    };
  }

  String get shortName {
    return switch (this) {
      Countries.egypt => 'EGY',
      Countries.saudiArabia => 'SAU',
      Countries.unitedStates => 'USA',
      Countries.unitedKingdom => 'GBR',
      Countries.canada => 'CAN',
      Countries.australia => 'AUS',
      Countries.japan => 'JPN',
      Countries.china => 'CHN',
    };
  }
}
