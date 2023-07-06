import 'package:flutter/material.dart';
import 'package:nasa_workshop/data/model/apod_model.dart';

class ListScreen extends StatelessWidget {
  final List<ApodModel> mockData = [
    ApodModel(
      title: 'Mocked Apod 1',
      date: DateTime(2023, 1, 1),
      explanation: 'This is the explanation of the img/video',
      mediaType: MediaType.image,
      url: 'imgurl',
    ),
    ApodModel(
      title: 'Mocked Apod 2',
      date: DateTime(2023, 1, 1),
      explanation: 'This is the explanation of the img/video',
      mediaType: MediaType.video,
      url: 'videourl',
    ),
  ];

  ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Screen'),
      ),
      body: ListView.builder(
        itemCount: mockData.length,
        itemBuilder: (context, index) {
          final apod = mockData[index];
          return ListTile(
            title: Text(apod.title),
            trailing: Text(apod.formattedDate),
          );
        },
      ),
    );
  }
}
