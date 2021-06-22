part of 'photos_bloc.dart';

@immutable
abstract class PhotosEvent {}

class PhotosFetchEvent extends PhotosEvent {
  final int pageNo;
  PhotosFetchEvent({required this.pageNo});
}
