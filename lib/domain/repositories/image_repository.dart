

import 'package:rs_test/domain/entities/image_media_entity.dart';

abstract class ImageRepository{

  Future<List<ImageMediaEntity>> getImages (int pageNo);
  
}