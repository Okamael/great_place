import 'package:flutter/material.dart';
import 'package:great_place/screens/place_form_screen.dart';
import 'package:great_place/screens/places_list_screen.dart';
import 'package:great_place/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.indigo,
          primaryColor: Colors.amber,
          accentColor: Colors.amber),
      home: const PlacesListScreen(),
      routes: {
        AppRoutes.PLACE_FORM: (context) => PlaceFormScreen(),
      },
    );
  }
}
