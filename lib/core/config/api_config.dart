import 'package:gifter/infrastructure/i18n/language_constants.dart';

class ApiConfig {
  
  // URLs base para Giphy
  static const String giphyBaseUrl = 'https://api.giphy.com/v1/gifs/';
  static const String giphyApiKey = 'BrtO0JIC01JNI9r03z8EusShHjONqRE0';

  // Endpoints específicos do Giphy
  static String getTrendingGifsUrl() {
    return '${giphyBaseUrl}trending?api_key=$giphyApiKey&limit=25&offset=0&rating=g&bundle=messaging_non_clips';
  }

  static String getSearchGifsUrl(String query, {String lang = LanguageConstantsOptionsSearch.defaultLanguage}) {
    return '${giphyBaseUrl}search?api_key=$giphyApiKey&q=$query&limit=25&offset=0&rating=g&lang=$lang&bundle=messaging_non_clips';
  }
}