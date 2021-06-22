part of 'photos_bloc.dart';

@immutable
abstract class PhotosState {
  final int pageNo;
  final List<ImageMediaEntity> photos;
  PhotosState({
    required this.pageNo,
    required this.photos,
  });
}

class PhotosInitial extends PhotosState {
  PhotosInitial() : super(pageNo: 1, photos: []);
}

class PhotosFetchSuccess extends PhotosState {
  PhotosFetchSuccess({
    required int pageNo,
    required List<ImageMediaEntity> photos,
  }) : super(pageNo: pageNo, photos: photos);
}

class PhotosFetchFailed extends PhotosState {
  final String error;
  PhotosFetchFailed(this.error, {
    required int pageNo,
    required List<ImageMediaEntity> photos,
  }) : super(pageNo: pageNo, photos: []);
}
