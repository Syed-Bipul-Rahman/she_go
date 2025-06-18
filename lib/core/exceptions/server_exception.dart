import 'app_exception.dart';

class ServerException extends AppException {
  ServerException() : super(message: 'Server returned an error');
}
