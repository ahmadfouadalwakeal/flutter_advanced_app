import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/login_request_body.dart';

part 'login_event.freezed.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.started(LoginRequestBody loginRequestBody) = Started;
}
