import 'package:rs_test/domain/entities/image_media_entity.dart';
import 'package:rs_test/domain/repositories/image_repository.dart';

class ImageUseCase {
  final ImageRepository imageRepository;
  ImageUseCase({required this.imageRepository});

  Future<List<ImageMediaEntity>> getImages(int pageNo) => imageRepository.getImages(pageNo);

}
