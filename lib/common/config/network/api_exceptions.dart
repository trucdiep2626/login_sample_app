class ApiExceptions implements Exception {
  final int? status;
  final String? type;
  final String? description;
  final String? message;
  final List<dynamic>? errorValidate;

  ApiExceptions([
    this.status,
    this.type,
    this.description,
    this.message,
    this.errorValidate,
  ]);
}

class ValidateException extends ApiExceptions {
  ValidateException([
    int? status,
    String? message,
    List<dynamic>? errorValidate,
  ]) : super(status, 'error', '', message, errorValidate);
}

class PostFileException extends ApiExceptions {
  PostFileException([
    int? status,
    String? message,
  ]) : super(status, 'error', '', message);
}

class BadRequestException extends ApiExceptions {
  BadRequestException([int? status, String? message])
      : super(status, 'error', '', message);
}

class NoInternetException extends ApiExceptions {
  NoInternetException([int? status, String? message])
      : super(status, 'error', '', message);
}

class FetchDataException extends ApiExceptions {
  FetchDataException([int? status, String? message])
      : super(status, 'error', '', message);
}

class ApiNotRespondingException extends ApiExceptions {
  ApiNotRespondingException([int? status, String? message])
      : super(status, 'error', '', message);
}

class UnauthorizedException extends ApiExceptions {
  UnauthorizedException([int? status, String? message])
      : super(status, 'error', '', message);
}

class NotFoundException extends ApiExceptions {
  NotFoundException([int? status, String? message])
      : super(status, 'error', '', message);
}
