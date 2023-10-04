// ignore_for_file: public_member_api_docs, sort_constructors_first
class CustomException implements Exception {
  final String? message;
  CustomException({
    this.message = 'Something went wrong',
  });
  @override
  String toString() => 'CustomException: {message :$message}';
}
