export 'account_bind.dart';
export 'auth_data.dart';
export 'lesson.dart';
export 'request_check-login.dart';
export 'request_login.dart';
export 'response_check-login.dart';
export 'response_lessons_get.dart';
export 'response_login.dart';
export 'response_sign_up.dart';
export 'sign_up_request.dart';
export 'subject.dart';
export 'timetable.dart';
export 'user.dart';
import 'package:quiver/core.dart';

T? checkOptional<T>(Optional<T?>? optional, T? def) {
  // No value given, just take default value
  if (optional == null) return def;

  // We have an input value
  if (optional.isPresent) return optional.value;

  // We have a null inside the optional
  return null;
}
