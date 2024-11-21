import 'package:freezed_annotation/freezed_annotation.dart';

part 'registration_request_model.freezed.dart';
part 'registration_request_model.g.dart';

@freezed
class RegistrationRequestModel with _$RegistrationRequestModel {
  const factory RegistrationRequestModel({
    required String name,
    required String email,
    required String password,
  }) = _RegistrationRequestModel;

  factory RegistrationRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RegistrationRequestModelFromJson(json);

  factory RegistrationRequestModel.initial() => const RegistrationRequestModel(
        name: '',
        email: '',
        password: '',
      );
}
