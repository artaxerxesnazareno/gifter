import 'package:gifter/core/config/api_config.dart';
import 'package:gifter/domain/entities/image_gif.dart';
import 'package:gifter/infrastructure/adapters/http_adapter/http_adapter.dart';

class UsecaseGetImageGiftrending {
  static final httpAdapter = HttpAdapter();

  static Future<List<ImageGif>> getImageGiftrending() async {
    List<ImageGif> list = [];
    final response = await httpAdapter.get(ApiConfig.getTrendingGifsUrl());
    if (response.sucess) {
      for (var e in response.object['data']) {
        final result = {
          'url': e['images']['fixed_height']['url'],
          'title': e['title']
        };
        list.add(ImageGif.fromMap(result));
      }
      return list;
    }
    response.handleHttpResponse();
    return list;
  }
}
