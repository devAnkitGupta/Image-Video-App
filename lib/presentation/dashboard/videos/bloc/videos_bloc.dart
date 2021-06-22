import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rs_test/domain/entities/video_media_entity.dart';
import 'package:rs_test/domain/usecases/video_use_case.dart';

part 'videos_event.dart';
part 'videos_state.dart';

class VideosBloc extends Bloc<VideosEvent, VideosState> {
  final VideoUseCase videoUseCase;

  VideosBloc({required this.videoUseCase}) : super(VideosInitial());

  @override
  Stream<VideosState> mapEventToState(
    VideosEvent event,
  ) async* {
    switch (event.runtimeType) {
      case FetchVideosEvent:
        yield* _handleFetchEvent(event as FetchVideosEvent);
        break;
    }
  }

  Stream<VideosState> _handleFetchEvent(FetchVideosEvent event) async* {
    try {
      final videos = await videoUseCase.getVideos(state.pageNo);
      final pageNo = event.pageNo + 1;
      yield VideosFetchSuccess(pageNo: pageNo, videos: videos);
    } on SocketException {
      yield VideosFetchFailed(
        '! No Internet',
        pageNo: event.pageNo,
        videos: [],
      );
    } catch (e) {
      yield VideosFetchFailed(
        'Something Went Wrong',
        pageNo: event.pageNo,
        videos: [],
      );
    }
  }
}
