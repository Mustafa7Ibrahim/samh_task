import 'package:flutter/material.dart';
import 'package:samh_task/modules/book/presentation/components/background_widget.dart';
import 'package:samh_task/modules/book/presentation/components/book_form.dart';
import 'package:samh_task/modules/book/presentation/components/from_to_home_widget.dart';
import 'package:samh_task/modules/book/presentation/components/header_text_widget.dart';
import 'package:samh_task/modules/book/presentation/components/logo_widget.dart';
import 'package:samh_task/modules/book/presentation/components/map_widget.dart';
import 'package:samh_task/modules/book/presentation/components/trip_tabs_widget.dart';

class BookScreen extends StatelessWidget {
  const BookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundWidget(),
          MapWidget(isBook: true),
          FromToHomeWidget(),
          LogoWidget(),
          HeaderTextWidget(),
          TripsTabs(),
          BookForm(),
        ],
      ),
    );
  }
}
