class NoInternetException implements Exception {
  final String errorMessage;

  NoInternetException([this.errorMessage = ""]);
}

class FetchMoviesException implements Exception {
  final String errorMessage;

  FetchMoviesException([this.errorMessage = ""]);
}
