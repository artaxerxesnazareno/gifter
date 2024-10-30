import 'app_exception.dart';

class MessageException extends AppException {
  MessageException([String message = 'Ocorreu um erro inesperado'])
      : super(message);
}

