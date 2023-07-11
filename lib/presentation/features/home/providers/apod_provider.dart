import 'package:flutter/material.dart';
import 'package:nasa_workshop/data/model/apod_model.dart';
import 'package:nasa_workshop/domain/usecases/fetch_apod_usecase.dart';

class ApodProvider extends ChangeNotifier {
  final FetchApodUseCase _fetchApodUseCase;

  ApodProvider(this._fetchApodUseCase) {
    scrollController.addListener(scrollListener);
  }

  final int _itemsPerPage = 15;
  final ScrollController scrollController = ScrollController();
  List<ApodModel> _apodList = [];
  bool isLoading = true;
  bool isFetchingMore = false;
  bool _hasReachedEnd = false;

  List<ApodModel> get apodList => _apodList;
  bool get getIsLoading => isLoading;

  Future<void> fetchApodData() async {
    try {
      isLoading = true;
      notifyListeners();

      final startDate = DateTime.now().subtract(const Duration(days: 15));
      final endDate = DateTime.now();

      final apodList =
          await _fetchApodUseCase.fetchApodList(FetchApodUseCaseParams(startDate: startDate, endDate: endDate));
      _apodList = sortApodList(apodList);
      isLoading = false;
    } catch (e) {
      isLoading = false;
    } finally {
      notifyListeners();
    }
  }

  Future<void> fetchMoreData() async {
    if (isFetchingMore || _hasReachedEnd) return;

    try {
      isFetchingMore = true;
      notifyListeners();

      final startDate = DateTime.now().subtract(Duration(days: _apodList.length + 15));
      final endDate = DateTime.now().subtract(Duration(days: _apodList.length));

      final apodList =
          await _fetchApodUseCase.fetchApodList(FetchApodUseCaseParams(startDate: startDate, endDate: endDate));
      final sortedList = sortApodList(apodList);

      if (apodList.length < _itemsPerPage) {
        _hasReachedEnd = true;
      }
      _apodList.addAll(sortedList);
    } finally {
      isFetchingMore = false;
      notifyListeners();
    }
  }

  void scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent && !scrollController.position.outOfRange) {
      fetchMoreData();
    }
  }

  @override
  void dispose() {
    scrollController.removeListener(scrollListener);
    scrollController.dispose();
    super.dispose();
  }

  List<ApodModel> sortApodList(List<ApodModel> apodList) {
    apodList.sort((a, b) => b.date.compareTo(a.date));
    return apodList;
  }
}
