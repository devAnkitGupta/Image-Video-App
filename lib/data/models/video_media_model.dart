import 'package:rs_test/domain/entities/video_media_entity.dart';


class VideosMediaModel extends VideoMediaEntity {
  VideosMediaModel({
    required int id,
    required int width,
    required int height,
    required int duration,
    required String url,
    required String image,
    required UserModel user,
    required List<VideoFilesModel> videoFiles,
  }) : super(
          id: id,
          width: width,
          height: height,
          duration: duration,
          url: url,
          image: image,
          user: user,
          videoFiles: videoFiles,
        );

  factory VideosMediaModel.fromJson(Map<String, dynamic> json) => VideosMediaModel(
        id: json['id'],
        width: json['width'] ??0,
        height: json['height'] ?? 0,
        duration: json['duration'] ??0,
        url: json['url'] ?? '',
        image: json['image'] ?? '',
        user: UserModel.fromJson(json['user']),
        videoFiles: json['video_files']
            .map((e) => VideoFilesModel.fromJson(e))
            .toList().cast<VideoFilesModel>(),
      );
}

class UserModel extends UserEntity {
  UserModel({
    required int id,
    required String name,
    required String url,
  }) : super(
          id: id,
          name: name,
          url: url,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        name: json['name'],
        url: json['url'],
      );
}

class VideoFilesModel extends VideoFilesEntity {
  VideoFilesModel({
    required int id,
    required String quality,
    required String fileType,
    required int width,
    required int height,
    required String link,
  }) : super(
          id: id,
          quality: quality,
          fileType: fileType,
          width: width,
          height: height,
          link: link,
        );

  factory VideoFilesModel.fromJson(Map<String, dynamic> json) =>
      VideoFilesModel(
        id: json['id'],
        quality: json['quality'] ?? '',
        fileType: json['file_type'],
        width: json['width'] ?? 0,
        height: json['height'] ?? 0,
        link: json['link'] ?? '',
      );
}
