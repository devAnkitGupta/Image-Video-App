import 'package:rs_test/domain/entities/video_media_entity.dart';

abstract class VideoRepository {
  Future<List<VideoMediaEntity>> getVideos(int pageNo);
}
