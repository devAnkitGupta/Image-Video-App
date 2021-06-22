import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:rs_test/di/injector.dart';
import 'package:rs_test/domain/entities/image_media_entity.dart';
import 'package:rs_test/presentation/dashboard/favorite/bloc/favorite_bloc_bloc.dart';
import 'package:rs_test/presentation/dashboard/photos/bloc/photos_bloc.dart';
import 'package:rs_test/presentation/dashboard/photos/photo_card.dart';
import 'package:rs_test/presentation/widgets/bottom_error_indicator.dart';
import 'package:rs_test/presentation/widgets/error_indicator.dart';

class Photos extends StatefulWidget {
  const Photos({Key? key}) : super(key: key);

  @override
  _PhotosState createState() => _PhotosState();
}

class _PhotosState extends State<Photos> {
  late PhotosBloc _photosBloc;
  late FavoriteBlocBloc _favoriteBloc;
  late PagingController<int, ImageMediaEntity> _pagingController;

  @override
  void initState() {
    _photosBloc = Injector.resolve<PhotosBloc>();
    _favoriteBloc = Injector.resolve<FavoriteBlocBloc>();
    _pagingController =
        PagingController(firstPageKey: _photosBloc.state.pageNo);
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  _fetchPage(int pageNo) {
    _photosBloc.add(PhotosFetchEvent(pageNo: pageNo));
  }

  _listenPhotoState(context, PhotosState state) {
    if (state is PhotosFetchSuccess) {
      _pagingController.appendPage(state.photos, state.pageNo);
    }
    if (state is PhotosFetchFailed) {
      _pagingController.error = state.error;
    }
  }

  @override
  Scaffold build(BuildContext context) => _buildScaffold();

  Scaffold _buildScaffold() {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBlocListener(),
    );
  }

  BlocListener<PhotosBloc, PhotosState> _buildBlocListener() =>
      BlocListener<PhotosBloc, PhotosState>(
        bloc: _photosBloc,
        listener: _listenPhotoState,
        child: _buildPhotoBuilder(),
      );

  BlocBuilder<PhotosBloc, PhotosState> _buildPhotoBuilder() =>
      BlocBuilder<PhotosBloc, PhotosState>(
        bloc: _photosBloc,
        builder: (context, state) {
          return _buildRefreshPhotoPage();
        },
      );

  RefreshIndicator _buildRefreshPhotoPage() => RefreshIndicator(
        onRefresh: () => Future.sync(
          () => _pagingController.refresh(),
        ),
        child: _buildContentList(),
      );

  PagedListView<int, ImageMediaEntity> _buildContentList() =>
      PagedListView.separated(
        addAutomaticKeepAlives: true,
        pagingController: _pagingController,
        padding: const EdgeInsets.all(16),
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
        builderDelegate: PagedChildBuilderDelegate<ImageMediaEntity>(
          itemBuilder: (context, entity, index) => Container(
            child: PhotoCard(
              imageMediaEntity: entity,
              bloc: _favoriteBloc,
              showButton: true,
            ),
          ),
          firstPageErrorIndicatorBuilder: (context) => ErrorIndicator(
            error: _pagingController.error,
            onTryAgain: () => _pagingController.refresh(),
          ),
          newPageErrorIndicatorBuilder: (context) => BottomErrorIndicator(
            error: _pagingController.error,
            onTryAgain: () => _pagingController.retryLastFailedRequest(),
          ),
        ),
      );

  AppBar _buildAppBar() => AppBar(
        title: Text('Photos'),
      );
}
