

import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpState >
{
  SignUpCubit() : super(SignUpInitial());
  static SignUpCubit get(context)=>BlocProvider.of(context);}



abstract class SignUpState {}

class SignUpInitial extends SignUpState {}
class SignUpscess extends SignUpState {}
class SignUperror extends SignUpState {}
class ChangePasswordConfirmVisibilityState extends SignUpState {}
class ChangePasswordVisibilityState extends SignUpState {}
