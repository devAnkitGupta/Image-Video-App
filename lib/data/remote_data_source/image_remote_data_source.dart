import 'dart:convert';

import 'package:http/http.dart' as Client;
import 'package:rs_test/data/models/image_media_model.dart';
import 'package:rs_test/api_key.dart';

class ImageRemoteDataSource {
  Future<List<ImageMediaModel>> getImages(int pageNo) async {
    final result = await Client.get(
        Uri.parse('https://api.pexels.com/v1/curated?page=$pageNo&per_page=15'),
        headers: {"Authorization": apiKey});

    final data = jsonDecode(result.body);
    List<dynamic> photos = data['photos'];
    return photos.map((e) => ImageMediaModel.fromMap(e)).toList();
  }
}
