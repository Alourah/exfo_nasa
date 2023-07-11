import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:nasa_workshop/data/model/apod_model.dart';

void main() {
  group('ApodModel', () {
    late ApodModel apodModel;
    final mockJson = {
      'date': '2023-07-11',
      'explanation': 'explanation',
      'media_type': 'image',
      'title': 'title',
      'url': 'https://nasa.com/soleil.jpg',
      'hdurl': 'https://nasa.com/soleil_hd.jpg',
      'copyright': 'NASA',
    };

    setUp(() {
      apodModel = ApodModel.fromJson(mockJson);
    });

    test('Test formattedDate', () {
      final formattedDate = DateFormat.yMMMd().format(DateTime.parse(mockJson['date']!));
      expect(apodModel.formattedDate, formattedDate);
    });

    test('Test isAnImage', () {
      expect(apodModel.isAnImage, true);
    });

    test('Test ApodModel properties', () {
      expect(apodModel.date, DateTime.parse(mockJson['date']!));
      expect(apodModel.explanation, 'explanation');
      expect(apodModel.mediaType, MediaType.image);
      expect(apodModel.title, 'title');
      expect(apodModel.url, 'https://nasa.com/soleil.jpg');
      expect(apodModel.hdurl, 'https://nasa.com/soleil_hd.jpg');
      expect(apodModel.copyRight, 'NASA');
    });

    test('Test ApodModel factory method', () {
      final model = ApodModel.fromJson(mockJson);
      expect(model.date, DateTime.parse(mockJson['date']!));
      expect(model.explanation, 'explanation');
      expect(model.mediaType, MediaType.image);
      expect(model.title, 'title');
      expect(model.url, 'https://nasa.com/soleil.jpg');
      expect(model.hdurl, 'https://nasa.com/soleil_hd.jpg');
      expect(model.copyRight, 'NASA');
    });
  });
}
