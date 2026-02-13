part of 'app_auth_cubit.dart';

@immutable
abstract class AppAuthState {}

class AppAuthInitial extends AppAuthState {}

class AppAuthLoading extends AppAuthState {}

class AppAuthSuccess extends AppAuthState {}

class AppAuthError extends AppAuthState {
  final String errorMessage;

  AppAuthError(this.errorMessage);
}
