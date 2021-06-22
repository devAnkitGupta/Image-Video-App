import 'package:rs_test/data/remote_data_source/video_remote_data_source.dart';
import 'package:rs_test/domain/entities/video_media_entity.dart';
import 'package:rs_test/domain/repositories/video_repository.dart';

class VideoRepositoryImpl implements VideoRepository {
  final VideoRemoteDataSource videoRemoteDataSource;

  VideoRepositoryImpl({required this.videoRemoteDataSource});

  @override
  Future<List<VideoMediaEntity>> getVideos(int pageNo) async {
    final videos = await videoRemoteDataSource.getVideos(pageNo);
    return videos;
  }
}
