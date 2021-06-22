import 'package:rs_test/domain/entities/image_media_entity.dart';

class ImageMediaModel extends ImageMediaEntity {
  ImageMediaModel({
    required int id,
    required String url,
    required String photographer,
    required String photographerUrl,
    required int photographerId,
    required SrcModel src,
  }) : super(
          id: id,
          url: url,
          photographer: photographer,
          photographerId: photographerId,
          photographerUrl: photographerUrl,
          src: src,
        );

  factory ImageMediaModel.fromMap(Map<String, dynamic> data) =>
      ImageMediaModel(
        id: data['id'],
        url: data["url"],
        photographer: data["photographer"],
        photographerId: data["photographer_id"],
        photographerUrl: data["photographer_url"],
        src: SrcModel.fromMap(
          data["src"],
        ),
      );
}

class SrcModel extends SrcEntity {
  SrcModel({
    required String large,
    required String medium,
  }) : super(
          large: large,
          medium: medium,
        );

  factory SrcModel.fromMap(Map<String, dynamic> data) {
    return SrcModel(
      large: data["large"],
      medium: data["medium"],
    );
  }
}
