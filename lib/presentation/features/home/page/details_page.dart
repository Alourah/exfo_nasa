import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nasa_workshop/core/constants/padding_constants.dart';
import 'package:nasa_workshop/core/theme/app_gaps.dart';
import 'package:nasa_workshop/data/model/apod_model.dart';
import 'package:nasa_workshop/presentation/features/home/widgets/video_header.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key, required this.apod}) : super(key: key);

  final ApodModel apod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(apod.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (apod.mediaType == MediaType.image)
              Center(
                child: CachedNetworkImage(
                  imageUrl: apod.hdurl ?? apod.url,
                  placeholder: (_, __) => const Padding(
                      padding: EdgeInsets.only(top: PaddingConstants.defaultPadding),
                      child: CircularProgressIndicator()),
                  errorWidget: (_, __, ___) => const Padding(
                    padding: EdgeInsets.only(top: PaddingConstants.defaultPadding),
                    child: Icon(Icons.error),
                  ),
                ),
              ),
            if (apod.mediaType == MediaType.video) VideoHeader(videoUrl: apod.url),
            Padding(
              padding: PaddingConstants.defaultPaddingEdgeInsets,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    apod.title,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  AppGaps.s01,
                  if (apod.mediaType == MediaType.video) AppGaps.s01,
                  Text(
                    apod.formattedDate,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  AppGaps.s02,
                  Text(apod.explanation, style: const TextStyle(fontSize: 18)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
