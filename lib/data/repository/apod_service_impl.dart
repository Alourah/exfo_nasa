import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:nasa_workshop/core/constants/api_constants.dart';
import 'package:nasa_workshop/data/model/apod_model.dart';
import 'package:nasa_workshop/domain/repository/apod_service.dart';

class ApodServiceImpl implements ApodService {
  late final Dio _dio;

  ApodServiceImpl() {
    _dio = Dio();
  }

  @override
  Future<List<ApodModel>> getRangeOfApod(DateTime startDate, DateTime endDate) async {
    String startDateParam = DateFormat('yyyy-MM-dd').format(startDate);
    String endDateParam = DateFormat('yyyy-MM-dd').format(endDate);

    try {
      final response = await _dio.get(
        ApiConstants.apodApiAddress,
        queryParameters: {
          'start_date': startDateParam,
          'end_date': endDateParam,
          'api_key': ApiConstants.apodApiKey,
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> json = response.data;
        final result = json.map((apod) => ApodModel.fromJson(apod)).toList();
        return result;
      } else {
        throw Exception('API request failed with status code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to fetch APOD data: $error');
    }
  }
}
