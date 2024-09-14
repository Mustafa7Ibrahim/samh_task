import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:samh_task/core/extensions/local_extension.dart';
import 'package:samh_task/modules/book/domain/trip_type.dart';

class TripsTabs extends HookWidget {
  const TripsTabs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final selectedTripType = useState(TripType.roundTrip);
    return PositionedDirectional(
      start: 0,
      end: 0,
      top: size.height * 0.3,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (var tripType in TripType.values) ...[
              InkWell(
                onTap: () => selectedTripType.value = tripType,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.isRTL
                          ? tripType.title(context)
                          : tripType.title(context),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    if (selectedTripType.value == tripType)
                      SizedBox(
                        width: 30,
                        child: Divider(
                          color: Colors.white,
                          height: 4,
                        ),
                      )
                    else
                      SizedBox(height: 4),
                  ],
                ),
              )
            ]
          ],
        ),
      ),
    );
  }
}
