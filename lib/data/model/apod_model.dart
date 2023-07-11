import 'package:intl/intl.dart';

enum MediaType { image, video }

class ApodModel {
  ApodModel({
    required this.date,
    required this.explanation,
    required this.mediaType,
    required this.title,
    required this.url,
    this.hdurl,
    this.copyRight,
  });

  final DateTime date;
  final String explanation;
  final MediaType mediaType;
  final String title;
  final String url;
  final String? hdurl;
  final String? copyRight;

  String get formattedDate => DateFormat.yMMMd().format(date);

  bool get isAnImage => mediaType == MediaType.image ? true : false;

  factory ApodModel.fromJson(Map<String, dynamic> json) {
    return ApodModel(
      date: DateTime.parse(json['date']),
      explanation: json['explanation'],
      mediaType: json['media_type'] == 'image' ? MediaType.image : MediaType.video,
      title: json['title'],
      url: json['url'],
      hdurl: json['hdurl'],
      copyRight: json['copyright'],
    );
  }
}
