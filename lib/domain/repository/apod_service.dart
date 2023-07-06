import 'package:nasa_workshop/data/model/apod_model.dart';

abstract class ApodService {
  Future<List<ApodModel>> getRangeOfApod([DateTime startDate, DateTime endDate]);
}
