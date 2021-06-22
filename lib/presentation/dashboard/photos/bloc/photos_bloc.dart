import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rs_test/domain/entities/image_media_entity.dart';
import 'package:rs_test/domain/usecases/image_use_case.dart';

part 'photos_event.dart';
part 'photos_state.dart';

class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  final ImageUseCase photosUseCase;

  PhotosBloc({required this.photosUseCase}) : super(PhotosInitial());

  @override
  Stream<PhotosState> mapEventToState(
    PhotosEvent event,
  ) async* {
    switch (event.runtimeType) {
      case PhotosFetchEvent:
        yield* _handleFetchEvent(event as PhotosFetchEvent);
        break;
    }
  }

  Stream<PhotosState> _handleFetchEvent(PhotosFetchEvent event) async* {
    try {
      final photos = await photosUseCase.getImages(state.pageNo);
      final pageNo = event.pageNo + 1;
      yield PhotosFetchSuccess(pageNo: pageNo, photos: photos);
    } on SocketException {
      yield PhotosFetchFailed(
        '! No Internet',
        pageNo: event.pageNo,
        photos: [],
      );
    } catch (e) {
      yield PhotosFetchFailed(
        'Something Went Wrong',
        pageNo: event.pageNo,
        photos: [],
      );
    }
  }
}
