import 'package:rs_test/data/remote_data_source/image_remote_data_source.dart';
import 'package:rs_test/domain/entities/image_media_entity.dart';
import 'package:rs_test/domain/repositories/image_repository.dart';

 class ImageRepositoryImpl implements ImageRepository {
  final ImageRemoteDataSource imageRemoteDataSource;

  ImageRepositoryImpl({required this.imageRemoteDataSource});

  Future<List<ImageMediaEntity>> getImages(int pageNo) async {
    final images = await imageRemoteDataSource.getImages(pageNo);
    return images;
  }
}
