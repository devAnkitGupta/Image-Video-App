class VideoMediaEntity {
  final int id;
  final int width;
  final int height;
  final int duration;
  final String url;
  final String image;
  final UserEntity user;
  final List<VideoFilesEntity> videoFiles;
  bool isSelected;

  VideoMediaEntity({
    required this.id,
    required this.width,
    required this.height,
    required this.duration,
    required this.url,
    required this.image,
    required this.user,
    required this.videoFiles,
    this.isSelected = false,
  });
}

class UserEntity {
  final int id;
  final String name;
  final String url;

  UserEntity({
    required this.id,
    required this.name,
    required this.url,
  });
}

class VideoFilesEntity {
  final int id;
  final String quality;
  final String fileType;
  final int width;
  final int height;
  final String link;

  VideoFilesEntity({
    required this.id,
    required this.quality,
    required this.fileType,
    required this.width,
    required this.height,
    required this.link,
  });
}
