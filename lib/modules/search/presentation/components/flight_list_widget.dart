import 'package:flutter/material.dart';
import 'package:samh_task/modules/search/domain/flights_model.dart';
import 'package:samh_task/modules/search/presentation/components/flight_card.dart';

class FlightsListWidget extends StatelessWidget {
  const FlightsListWidget({
    super.key,
    required this.flights,
  });

  final List<FlightsModel> flights;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.36,
      left: 0,
      right: 0,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.56,
        child: ListView.separated(
          itemCount: flights.length,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          shrinkWrap: true,
          separatorBuilder: (_, __) => SizedBox(height: 16),
          itemBuilder: (BuildContext context, int index) {
            return FlightCard(flight: flights[index]);
          },
        ),
      ),
    );
  }
}
