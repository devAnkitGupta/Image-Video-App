import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:rs_test/di/injector.dart';
import 'package:rs_test/domain/entities/video_media_entity.dart';
import 'package:rs_test/presentation/dashboard/favorite/bloc/favorite_bloc_bloc.dart';
import 'package:rs_test/presentation/dashboard/videos/bloc/videos_bloc.dart';
import 'package:rs_test/presentation/dashboard/videos/video_cards.dart';
import 'package:rs_test/presentation/widgets/bottom_error_indicator.dart';
import 'package:rs_test/presentation/widgets/error_indicator.dart';

class Videos extends StatefulWidget {
  const Videos({Key? key}) : super(key: key);

  @override
  _VideosState createState() => _VideosState();
}

class _VideosState extends State<Videos> {
  late VideosBloc _videosBloc;
  late FavoriteBlocBloc _bloc;
  late PagingController<int, VideoMediaEntity> _pagingController;

  @override
  void initState() {
    _videosBloc = Injector.resolve<VideosBloc>();
    _bloc = Injector.resolve<FavoriteBlocBloc>();
    _pagingController =
        PagingController(firstPageKey: _videosBloc.state.pageNo);
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  _fetchPage(int pageNo) {
    _videosBloc.add(FetchVideosEvent(pageNo: pageNo));
  }

  _listenPhotoState(context, VideosState state) {
    if (state is VideosFetchSuccess) {
      _pagingController.appendPage(state.videos, state.pageNo);
    }
    if (state is VideosFetchFailed) {
      _pagingController.error = state.error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Videos'),
        ),
        body: _buildBlocListener());
  }

  BlocListener<VideosBloc, VideosState> _buildBlocListener() =>
      BlocListener<VideosBloc, VideosState>(
        bloc: _videosBloc,
        listener: _listenPhotoState,
        child: _buildPhotoBuilder(),
      );

  BlocBuilder<VideosBloc, VideosState> _buildPhotoBuilder() =>
      BlocBuilder<VideosBloc, VideosState>(
        bloc: _videosBloc,
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

  PagedListView<int, VideoMediaEntity> _buildContentList() =>
      PagedListView.separated(
        addAutomaticKeepAlives: true,
        pagingController: _pagingController,
        padding: const EdgeInsets.all(16),
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
        builderDelegate: PagedChildBuilderDelegate<VideoMediaEntity>(
          itemBuilder: (context, entity, index) => Container(
            child: VideoCard(
              videoMediaEntity: entity,
              bloc: _bloc,
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
}
