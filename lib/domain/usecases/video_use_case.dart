import 'package:rs_test/domain/entities/video_media_entity.dart';
import 'package:rs_test/domain/repositories/video_repository.dart';

class VideoUseCase {
  final VideoRepository videoRepository;
  VideoUseCase({required this.videoRepository});

  Future<List<VideoMediaEntity>> getVideos(int pageNo) =>
      videoRepository.getVideos(pageNo);
}
