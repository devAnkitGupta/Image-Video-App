// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  @override
  void _configureBlocs() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton((c) => DashboardBloc());
    container
        .registerSingleton((c) => PhotosBloc(photosUseCase: c<ImageUseCase>()));
    container
        .registerSingleton((c) => VideosBloc(videoUseCase: c<VideoUseCase>()));
    container.registerSingleton((c) => FavoriteBlocBloc());
  }

  @override
  void _configureUseCase() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory(
        (c) => ImageUseCase(imageRepository: c<ImageRepository>()));
    container.registerFactory(
        (c) => VideoUseCase(videoRepository: c<VideoRepository>()));
  }

  @override
  void _configureRepositories() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory<ImageRepository>((c) =>
        ImageRepositoryImpl(imageRemoteDataSource: c<ImageRemoteDataSource>()));
    container.registerFactory<VideoRepository>((c) =>
        VideoRepositoryImpl(videoRemoteDataSource: c<VideoRemoteDataSource>()));
  }

  @override
  void _configureRemoteDataSource() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory((c) => ImageRemoteDataSource());
    container.registerFactory((c) => VideoRemoteDataSource());
  }
}
