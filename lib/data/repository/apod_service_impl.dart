import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:nasa_workshop/core/constants/api_constants.dart';
import 'package:nasa_workshop/core/constants/text_constants.dart';
import 'package:nasa_workshop/data/model/apod_model.dart';
import 'package:nasa_workshop/domain/repository/apod_service.dart';
import 'package:nasa_workshop/utils/network_info.dart';

class ApodServiceImpl implements ApodService {
  ApodServiceImpl(Dio dio, NetworkInfo networkInfo) {
    _dio = dio;
    _networkInfo = networkInfo;
  }

  late final Dio _dio;
  late final NetworkInfo _networkInfo;

  @override
  Future<List<ApodModel>> getRangeOfApod(DateTime startDate, DateTime endDate) async {
    String startDateParam = DateFormat('yyyy-MM-dd').format(startDate);
    String endDateParam = DateFormat('yyyy-MM-dd').format(endDate);

    if (!await _networkInfo.isConnected) {
      throw Exception(TextConstants.noInternetConnectionException);
    }

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
        return json.map((apod) => ApodModel.fromJson(apod)).toList();
      } else {
        throw Exception('${TextConstants.apiRequestFailCodeException} ${response.statusCode}');
      }
    } on DioException catch (error) {
      String? errorMessage = error.message;
      if (error.response != null && error.response?.data != null) {
        errorMessage = error.response!.data.toString();
      }
      throw Exception('${TextConstants.failedToFetchApodDataException} $errorMessage');
    } catch (error) {
      throw Exception('${TextConstants.failedToFetchApodDataException} $error');
    }
  }
}
