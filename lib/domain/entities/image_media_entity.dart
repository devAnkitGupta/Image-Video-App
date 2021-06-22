class ImageMediaEntity {
  final int id;
  final String url;
  final String photographer;
  final String photographerUrl;
  final int photographerId;
  final SrcEntity src;
  bool isSelected;

  ImageMediaEntity({
    required this.id,
    required this.url,
    required this.photographer,
    required this.photographerId,
    required this.photographerUrl,
    required this.src,
    this.isSelected = false,
  });
}

class SrcEntity {
  final String large;
  final String medium;

  SrcEntity({
    required this.large,
    required this.medium,
  });
}
