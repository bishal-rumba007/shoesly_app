import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String message;
  final int? statusCode;
  final dynamic error;

  const Failure({
    required this.message,
    this.statusCode,
    this.error,
  });

  @override
  List<Object?> get props => [message, statusCode, error];
}