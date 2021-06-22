import 'dart:convert';

import 'package:http/http.dart' as Client;
import 'package:rs_test/api_key.dart';
import 'package:rs_test/data/models/video_media_model.dart';

class VideoRemoteDataSource {
  Future<List<VideosMediaModel>> getVideos(int pageNo) async {
    final result = await Client.get(
        Uri.parse(
            'https://api.pexels.com/videos/popular?page=$pageNo&per_page=10'),
        headers: {"Authorization": apiKey});

    final data = jsonDecode(result.body);
    List<dynamic> videos = data['videos'];
    return videos
        .map((e) => VideosMediaModel.fromJson(e))
        .toList()
        .cast<VideosMediaModel>();
  }
}
