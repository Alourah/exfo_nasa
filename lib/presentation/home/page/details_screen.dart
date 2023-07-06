import 'package:flutter/material.dart';
import 'package:nasa_workshop/data/model/apod_model.dart';

class DetailsScreen extends StatelessWidget {
  final ApodModel apod;

  const DetailsScreen({Key? key, required this.apod}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(apod.title),
        ),
        body: const Center(
          child: Text('Details screen'),
        ));
  }
}
