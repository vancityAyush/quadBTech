class AppRepository {
  AppRepository._();
  static AppRepository? _repository;
  static AppRepository get instance => _repository ??= AppRepository._();
}
