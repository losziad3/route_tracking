import 'package:flutter/material.dart';
import 'package:route_tracking/views/google_map_view.dart';
// AIzaSyAcsQ9eVLdwWTqmaGs4EYj6Gp8X5cqIZH0
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GoogleMapView(),
    );
  }
}
