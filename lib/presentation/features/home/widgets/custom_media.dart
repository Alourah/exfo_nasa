import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nasa_workshop/core/resources/images.dart';
import 'package:nasa_workshop/data/model/apod_model.dart';

class CustomMedia extends StatelessWidget {
  const CustomMedia({super.key, required this.isAnImage, required this.apod});

  final bool isAnImage;
  final ApodModel apod;

  @override
  Widget build(BuildContext context) {
    return isAnImage
        ? CachedNetworkImage(
            imageUrl: apod.hdurl ?? apod.url,
            placeholder: (context, url) =>
                const Padding(padding: EdgeInsets.only(top: 20), child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          )
        : Image.asset(Images.videoImage, width: 300);
  }
}
