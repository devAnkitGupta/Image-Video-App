part of 'videos_bloc.dart';

@immutable
abstract class VideosState {
  final int pageNo;
  final List<VideoMediaEntity> videos;
  VideosState({
    required this.pageNo,
    required this.videos,
  });
}

class VideosInitial extends VideosState {
  VideosInitial() : super(pageNo: 1, videos: []);
}

class VideosFetchSuccess extends VideosState {
  VideosFetchSuccess({
    required int pageNo,
    required List<VideoMediaEntity> videos,
  }) : super(pageNo: pageNo, videos: videos);
}

class VideosFetchFailed extends VideosState {
  final String error;
  VideosFetchFailed(
    this.error, {
    required int pageNo,
    required List<VideoMediaEntity> videos,
  }) : super(pageNo: pageNo, videos: videos);
}
