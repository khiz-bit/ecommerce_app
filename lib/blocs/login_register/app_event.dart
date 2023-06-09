part of 'app_bloc.dart';

@immutable
abstract class AppEvent extends Equatable{
  const AppEvent();
}

@immutable
class AppEventLogOut extends AppEvent {
  const AppEventLogOut();

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

@immutable
class AppEventLogIn extends AppEvent {
  final String email;
  final String password;
  const AppEventLogIn({
    required this.email, required this.password
});

  @override
  // TODO: implement props
  List<Object?> get props => [email, password];
}

@immutable
class AppEventRegister extends AppEvent {
  final String email;
  final String password;
  const AppEventRegister({
    required this.email, required this.password
  });

  @override
  // TODO: implement props
  List<Object?> get props => [email, password];
}

@immutable
class AppEventResetPassword extends AppEvent {
  final String email;
  const AppEventResetPassword({
    required this.email, });

  @override
  // TODO: implement props
  List<Object?> get props => [email];
}
