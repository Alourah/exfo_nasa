import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nasa_workshop/core/resources/images.dart';
import 'package:nasa_workshop/core/theme/app_colors.dart';
import 'package:nasa_workshop/core/theme/app_gaps.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final String formattedDate;
  final bool isAnImage;
  final VoidCallback onTap;

  const CustomListTile({
    super.key,
    required this.title,
    required this.isAnImage,
    required this.description,
    required this.imageUrl,
    required this.formattedDate,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(color: AppColors.mauveGris4, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        description,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
      ),
      leading: CircleAvatar(
        radius: 25,
        child: ClipOval(child: _tileImage()),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(formattedDate, style: const TextStyle(fontSize: 12, color: AppColors.gris4)),
          AppGaps.s00,
          const Icon(Icons.navigate_next, color: AppColors.gris4),
        ],
      ),
      onTap: onTap,
    );
  }

  Widget _tileImage() {
    return isAnImage
        ? CachedNetworkImage(
            imageUrl: imageUrl,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
            progressIndicatorBuilder: (_, __, downloadProgress) {
              return CircularProgressIndicator(
                value: downloadProgress.progress,
              );
            },
            errorWidget: (_, __, error) {
              return const Icon(Icons.error);
            },
          )
        : Image.asset(Images.iconVideo, width: 50, height: 50);
  }
}
