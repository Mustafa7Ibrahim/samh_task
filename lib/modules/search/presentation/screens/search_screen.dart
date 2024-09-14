import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:samh_task/core/extensions/local_extension.dart';
import 'package:samh_task/modules/book/presentation/components/background_widget.dart';
import 'package:samh_task/modules/book/presentation/components/map_widget.dart';
import 'package:samh_task/modules/search/presentation/components/flight_available_widget.dart';
import 'package:samh_task/modules/search/presentation/components/flight_list_widget.dart';
import 'package:samh_task/modules/search/presentation/components/form_to_image_widget.dart';
import 'package:samh_task/modules/search/presentation/components/from_to_text_widget.dart';
import 'package:samh_task/modules/search/presentation/providers/flights_provider.dart';

class SearchScreen extends HookConsumerWidget {
  const SearchScreen({
    super.key,
    required this.from,
    required this.to,
  });

  final String from;
  final String to;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flightsAsync = ref.watch(flightsProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(context.tr.searchResults),
      ),
      body: flightsAsync.when(
        data: (flights) => Stack(
          children: [
            BackgroundWidget(),
            MapWidget(),
            FromToImageWidget(),
            FromToTextWidget(from: from, to: to),
            FlightsAvailableWidget(flightsAvailable: flights.length),
            FlightsListWidget(flights: flights),
          ],
        ),
        error: (error, stack) => Center(child: Text(error.toString())),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
