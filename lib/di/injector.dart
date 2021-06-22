import 'package:kiwi/kiwi.dart';
import 'package:rs_test/data/remote_data_source/image_remote_data_source.dart';
import 'package:rs_test/data/remote_data_source/video_remote_data_source.dart';
import 'package:rs_test/data/repositories/image_repository_impl.dart';
import 'package:rs_test/data/repositories/video_repository_impl.dart';
import 'package:rs_test/domain/repositories/image_repository.dart';
import 'package:rs_test/domain/repositories/video_repository.dart';
import 'package:rs_test/domain/usecases/image_use_case.dart';
import 'package:rs_test/domain/usecases/video_use_case.dart';
import 'package:rs_test/presentation/dashboard/bloc/dashboard_bloc.dart';
import 'package:rs_test/presentation/dashboard/favorite/bloc/favorite_bloc_bloc.dart';
import 'package:rs_test/presentation/dashboard/photos/bloc/photos_bloc.dart';
import 'package:rs_test/presentation/dashboard/videos/bloc/videos_bloc.dart';

part 'injector.g.dart';

abstract class Injector {
  static KiwiContainer container = KiwiContainer();

  static void setup() {
    container = KiwiContainer();
    final injector = _$Injector();
    injector._configure();
  }

  static final resolve = container.resolve;

  void _configure() {
    _configureBlocs();
    _configureUseCase();
    _configureRepositories();
    _configureRemoteDataSource();
  }

  @Register.singleton(DashboardBloc)
  @Register.singleton(PhotosBloc)
  @Register.singleton(VideosBloc)
  @Register.singleton(FavoriteBlocBloc)
  void _configureBlocs();

  @Register.factory(ImageUseCase)
  @Register.factory(VideoUseCase)
  void _configureUseCase();

  @Register.factory(
    ImageRepository,
    from: ImageRepositoryImpl,
  )
  @Register.factory(VideoRepository, from: VideoRepositoryImpl)
  void _configureRepositories();

  @Register.factory(ImageRemoteDataSource)
  @Register.factory(VideoRemoteDataSource)
  void _configureRemoteDataSource();
}
