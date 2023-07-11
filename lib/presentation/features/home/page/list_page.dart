import 'package:flutter/material.dart';
import 'package:nasa_workshop/core/constants/text_constants.dart';
import 'package:nasa_workshop/core/widgets/pendings/loading_indicator_widget.dart';
import 'package:nasa_workshop/core/widgets/pendings/loading_linear_indicator_widget.dart';
import 'package:nasa_workshop/domain/usecases/fetch_apod_usecase.dart';
import 'package:nasa_workshop/presentation/features/home/page/details_page.dart';
import 'package:nasa_workshop/presentation/features/home/providers/apod_provider.dart';
import 'package:nasa_workshop/presentation/features/home/widgets/custom_list_tile.dart';
import 'package:nasa_workshop/utils/di_container.dart';
import 'package:provider/provider.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  ListPageState createState() => ListPageState();
}

class ListPageState extends State<ListPage> {
  late ApodProvider _apodProvider;

  @override
  void initState() {
    super.initState();
    _apodProvider = ApodProvider(getIt<FetchApodUseCase>());
    _apodProvider.fetchApodData();
    _apodProvider.scrollController.addListener(_apodProvider.scrollListener);
  }

  @override
  void dispose() {
    _apodProvider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ApodProvider>.value(
      value: _apodProvider,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(TextConstants.listScreenLabel),
          ),
          body: Consumer<ApodProvider>(
            builder: (_, provider, __) {
              return provider.isLoading ? const LoadingIndicatorWidget() : _buildApodList(provider);
            },
          ),
        );
      },
    );
  }

  Widget _buildApodList(ApodProvider provider) {
    return ListView.builder(
      controller: provider.scrollController,
      itemCount: provider.apodList.length + (provider.isFetchingMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index < provider.apodList.length) {
          final apod = provider.apodList[index];
          return CustomListTile(
            title: apod.title,
            isAnImage: apod.isAnImage,
            description: apod.explanation,
            imageUrl: apod.url,
            formattedDate: apod.formattedDate,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailsPage(apod: apod)),
            ),
          );
        } else {
          return const LoadingLinearIndicatorWidget();
        }
      },
    );
  }
}
