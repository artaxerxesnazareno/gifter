import 'app_exception.dart';

class ServerException extends AppException {
  ServerException([String message = 'Ocorreu um erro no servidor'])
      : super(message);
}

