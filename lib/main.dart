import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:votando/bloc_obser.dart';
import 'package:votando/network/dio_helper.dart';
import 'package:votando/view/pages/change_pass.dart';
import 'package:votando/view/pages/code.dart';
import 'package:votando/view/pages/login.dart';
import 'package:votando/view/pages/otp.dart';
import 'package:votando/view/pages/p_view/SignUp.dart';
import 'package:votando/view/pages/p_view/p_view.dart';

void main() async {

  Bloc.observer = MyBlocObserver();

  await DioHelper.init();{
  runApp( MaterialApp(
    routes: {
      'login':(context)=>login(),
      'changepass':(context)=>change_pass(),
      'code':(context)=>code(),
      'otp':(context)=>Otp(),
      'signUp':(context)=>SignUp_Screen()
    },
    debugShowCheckedModeBanner: false,
    home: p_view(),));
}}



