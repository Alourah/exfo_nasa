import 'package:flutter/material.dart';
import 'package:nasa_workshop/core/resources/images.dart';
import 'package:url_launcher/url_launcher.dart';

class VideoHeader extends StatelessWidget {
  const VideoHeader({super.key, required this.videoUrl});

  final String videoUrl;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => _launchVideo(videoUrl),
        child: Image.asset(Images.imgVideo, width: 300),
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
