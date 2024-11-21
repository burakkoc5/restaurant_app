part of 'authentication_cubit.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState.authenticated() = Authenticated;

  const factory AuthenticationState.unauthenticated() = Unauthenticated;

  const factory AuthenticationState.loading() = AuthLoading;

  //const factory AuthenticationState.error(String message) = AuthError;
  //TODO: App level alert model to be created
}
