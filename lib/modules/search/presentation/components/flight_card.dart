import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:samh_task/core/extensions/local_extension.dart';
import 'package:samh_task/core/ui/ticket_widget.dart';
import 'package:samh_task/modules/search/domain/flights_model.dart';

class FlightCard extends StatelessWidget {
  const FlightCard({super.key, required this.flight});

  final FlightsModel flight;

  @override
  Widget build(BuildContext context) {
    return TicketWidget(
      color: Colors.white,
      isCornerRounded: true,
      child: Container(
        padding: EdgeInsets.all(34),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  flight.companyName,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Image.asset(
                  flight.image,
                  width: 100,
                ),
                Text(
                  flight.price,
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.tr.depart,
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      flight.departureTime,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 16),
                Expanded(
                  child: DottedLine(
                    dashColor: Colors.grey.withOpacity(0.5),
                  ),
                ),
                DottedBorder(
                  radius: Radius.circular(24),
                  borderType: BorderType.RRect,
                  padding: EdgeInsets.all(8),
                  color: Colors.grey.withOpacity(0.5),
                  dashPattern: [4, 4],
                  child: Text(
                    flight.flightDuration,
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: DottedLine(
                    dashColor: Colors.grey.withOpacity(0.5),
                  ),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      context.tr.arrive,
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      flight.arrivalTime,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: () {},
              child: Text(context.tr.viewMore),
            ),
          ],
        ),
      ),
    );
  }
}
