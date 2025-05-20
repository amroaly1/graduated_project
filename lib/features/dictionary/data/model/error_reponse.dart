class ErrorReponse {
  final String message;
  final bool isFirstTime;
  final bool problemFromInternrt;

  ErrorReponse(
      {required this.message,
      this.isFirstTime = false,
      this.problemFromInternrt = false});
}
