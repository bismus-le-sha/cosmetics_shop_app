enum FailureType { serverError, cacheError }

class Failure {
  final FailureType type;
  final String message;

  const Failure(this.type, this.message);

  static const Map<FailureType, String> _defaultMessages = {
    FailureType.serverError: "Ошибка сервера",
    FailureType.cacheError: "Ошибка кэша",
  };

  factory Failure.fromType(FailureType type, {String? customMessage}) {
    return Failure(type, customMessage ?? _defaultMessages[type]!);
  }
}
