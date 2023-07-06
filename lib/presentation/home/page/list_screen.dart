import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nasa_workshop/data/model/apod_model.dart';
import 'package:nasa_workshop/data/repository/apod_service_impl.dart';
import 'package:nasa_workshop/domain/repository/apod_service.dart';
import 'package:nasa_workshop/presentation/home/page/details_screen.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  ListScreenState createState() => ListScreenState();
}

class ListScreenState extends State<ListScreen> {
  final ApodService _apodService = ApodServiceImpl(Dio());
  List<ApodModel> _apodList = [];
  bool _isLoading = true;
  bool _isFetchingMore = false;
  final int _itemsPerPage = 15;
  final ScrollController _scrollController = ScrollController();
  bool _hasReachedEnd = false;

  @override
  void initState() {
    super.initState();
    _fetchApodData();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _fetchApodData() async {
    try {
      final startDate = DateTime.now().subtract(const Duration(days: 15));
      final endDate = DateTime.now();

      final apodList = await _apodService.getRangeOfApod(startDate, endDate);
      apodList.sort((a, b) => b.date.compareTo(a.date));
      List<ApodModel> sortedList = apodList;

      setState(() {
        _apodList = sortedList;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _fetchMoreData() async {
    if (_isFetchingMore || _hasReachedEnd) return;

    try {
      setState(() {
        _isFetchingMore = true;
      });

      final startDate = DateTime.now().subtract(Duration(days: _apodList.length + 15));
      final endDate = DateTime.now().subtract(Duration(days: _apodList.length));

      final apodList = await _apodService.getRangeOfApod(startDate, endDate);
      apodList.sort((a, b) => b.date.compareTo(a.date));
      List<ApodModel> sortedList = apodList;

      setState(() {
        if (apodList.length < _itemsPerPage) {
          _hasReachedEnd = true;
        }
        _apodList.addAll(sortedList);
        _isFetchingMore = false;
      });
    } catch (e) {
      setState(() {
        _isFetchingMore = false;
      });
    }
  }

  Widget _buildLinearLoadingIndicator() {
    return const Center(
      child: LinearProgressIndicator(),
    );
  }

  Widget _buildLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  void _scrollListener() {
    if (_scrollController.offset >= _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      _fetchMoreData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Screen'),
      ),
      body: _isLoading ? _buildLoadingIndicator() : _buildApodList(),
    );
  }

  Widget _buildApodList() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _apodList.length + (_isFetchingMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index < _apodList.length) {
          final apod = _apodList[index];
          return ListTile(
            title: Text(apod.title),
            trailing: Text(apod.formattedDate),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailsScreen(apod: _apodList[index])),
            ),
          );
        } else {
          return _buildLinearLoadingIndicator();
        }
      },
    );
  }
}
