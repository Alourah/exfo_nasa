import 'package:nasa_workshop/core/constants/text_constants.dart';
import 'package:nasa_workshop/data/model/apod_model.dart';
import 'package:nasa_workshop/domain/repository/apod_service.dart';

class FetchApodUseCase {
  FetchApodUseCase(this._apodService);
  final ApodService _apodService;

  Future<List<ApodModel>> fetchApodList(FetchApodUseCaseParams params) async {
    //TODO: not try catch , return one line
    try {
      return await _apodService.getRangeOfApod(params.startDate, params.endDate);
    } catch (error) {
      throw Exception('${TextConstants.failedToFetchApodDataException} $error');
    }
  }
}

class FetchApodUseCaseParams {
  FetchApodUseCaseParams({required this.endDate, required this.startDate});
  DateTime startDate;
  DateTime endDate;
}
