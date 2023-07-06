import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nasa_workshop/data/model/apod_model.dart';
import 'package:nasa_workshop/data/repository/apod_service_impl.dart';
import 'package:nasa_workshop/domain/repository/apod_service.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  ListScreenState createState() => ListScreenState();
}

class ListScreenState extends State<ListScreen> {
  final ApodService _apodService = ApodServiceImpl(Dio());
  final ScrollController _scrollController = ScrollController();

  List<ApodModel> _apodList = [];
  bool _isLoading = true;

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

  Widget _buildLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  void _scrollListener() {
    if (_scrollController.offset >= _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {}
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
      itemCount: _apodList.length,
      itemBuilder: (context, index) {
        final apod = _apodList[index];
        return ListTile(title: Text(apod.title), trailing: Text(apod.formattedDate), onTap: () {});
      },
    );
  }
}
