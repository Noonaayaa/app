part of 'sign_up_cubit.dart';

abstract class SignUpState {}

class SignUpInitial extends SignUpState {}
class SignUpscess extends SignUpState {}
class SignUperror extends SignUpState {}
class ChangePasswordConfirmVisibilityState extends SignUpState {}
class ChangePasswordVisibilityState extends SignUpState {}
