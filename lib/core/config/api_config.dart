import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gifter/infrastructure/i18n/language_constants.dart';

class ApiConfig {
  // URLs base para Giphy
  static const String giphyBaseUrl = 'https://api.giphy.com/v1/gifs/';
  
  // Obtém a chave da API do arquivo .env
  static String get giphyApiKey => dotenv.env['GIPHY_API_KEY'] ?? '';

  // Endpoints específicos do Giphy
  static String getTrendingGifsUrl() {
    return '${giphyBaseUrl}trending?api_key=$giphyApiKey&limit=25&offset=0&rating=g&bundle=messaging_non_clips';
  }

  static String getSearchGifsUrl(String query,
      {String lang = LanguageConstantsOptionsSearch.defaultLanguage,
      int offset = 0}) {
    return '${giphyBaseUrl}search?api_key=$giphyApiKey&q=$query&limit=25&offset=$offset&rating=g&lang=$lang&bundle=messaging_non_clips';
  }
}
