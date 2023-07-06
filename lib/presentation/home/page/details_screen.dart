import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nasa_workshop/data/model/apod_model.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsScreen extends StatelessWidget {
  final ApodModel apod;

  const DetailsScreen({Key? key, required this.apod}) : super(key: key);

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
                  imageUrl: apod.url,
                  placeholder: (context, url) =>
                      const Padding(padding: EdgeInsets.only(top: 20), child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            if (apod.mediaType == MediaType.video)
              GestureDetector(
                onTap: () {
                  _launchVideo(apod.url);
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Center(
                      child: CachedNetworkImage(
                        imageUrl: apod.url,
                        placeholder: (context, url) => const CircularProgressIndicator(),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      ),
                    ),
                    const Icon(Icons.play_arrow, size: 72),
                  ],
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    apod.title,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  if (apod.mediaType == MediaType.video)
                    Text(
                      'Thumbnail URL: ${apod.url}',
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  const SizedBox(height: 8),
                  Text(
                    apod.formattedDate,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  Text(apod.explanation, style: const TextStyle(fontSize: 18)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _launchVideo(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch the video $url';
    }
  }
}
