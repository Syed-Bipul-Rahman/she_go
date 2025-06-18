import 'app_exception.dart';

class NetworkException extends AppException {
  NetworkException() : super(message: 'Network error occurred');
}
