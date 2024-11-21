import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_app/features/authentication/domain/registration_request_model.dart';
import 'package:restaurant_app/features/authentication/domain/token_model.dart';
import 'package:restaurant_app/features/authentication/infrastructure/authentication_repository.dart';

part 'authentication_cubit.freezed.dart';
part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final AuthenticationRepository _authenticationRepository;

  AuthenticationCubit(this._authenticationRepository)
      : super(const AuthLoading()) {
    checkAuthentication();
  }
  Future<void> checkAuthentication() async {
    print('Checking authentication');

    try {
      final token = await _authenticationRepository.getToken();
      if (token != null) {
        print('Token is not null');
        emit(const Authenticated());
        print('Emitted authenticated');
      } else {
        print('Token is null');
        emit(const Unauthenticated());
        print('Emitted unauthenticated');
      }
    } catch (error) {
      emit(const Unauthenticated()); // Hatalı durum için fallback
    }
  }

  Future<void> login(String email, String password) async {
    emit(const AuthLoading());
    final response = await _authenticationRepository.login(email, password);

    print('Cubit response: $response');
    response.pick(
      onError: (error) {
        // emit(AuthenticationState.error(error));
        print('Could not login');
      },
      onData: (data) {
        print('Logged in');
        emit(const Authenticated());
      },
    );
  }

  Future<void> createAccount(
      RegistrationRequestModel registrationRequestModel) async {
    emit(const AuthLoading());
    final response =
        await _authenticationRepository.createAccount(registrationRequestModel);

    response.pick(
      onError: (error) {
        // emit(AuthenticationState.error(error));
      },
      onData: (data) {
        emit(const Authenticated());
      },
    );
  }

  Future<void> logout() async {
    if (state is Authenticated) {
      print('state is authenticated');
      emit(const AuthLoading());
      final response = await _authenticationRepository.logout();

      response.pick(
        onError: (error) {
          print('Could not logout');
          // emit(AuthenticationState.error(error));
        },
        onData: (data) {
          print('Logged out');
          emit(const Unauthenticated());
        },
      );
    }
  }
}
