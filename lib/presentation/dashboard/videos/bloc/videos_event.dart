part of 'videos_bloc.dart';

@immutable
abstract class VideosEvent {}

class FetchVideosEvent extends VideosEvent {
  final int pageNo;

  FetchVideosEvent({required this.pageNo});
}
