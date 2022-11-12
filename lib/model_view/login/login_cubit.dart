import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:another_flushbar/flushbar.dart';
import 'package:votando/core/constant.dart';
import 'package:votando/model/login_model.dart';
import 'package:votando/network/dio_helper.dart';
import 'package:votando/view/pages/Home.dart';

import '../../network/end_points.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context)=>BlocProvider.of(context);



  Login_model? user;
   String massage='';

  Future<void> Login(
  {required  TextEditingController email,
     required TextEditingController pass,
    context,

}
      ) async {
    var json= {

      'email':email.text.toString(),
      'password':pass.text.toString(),
    };
     await DioHelper.postData(url: loginEndPoint, data: json).then((value) async {
       user=Login_model.fromJson(value.data);
       if(value.statusCode == 200){

         Token = user!.token.toString();
          // toast('welcom', context);
         Flushbar(
              onTap: (Flushbar) {
                Navigator.pop(context);
              },
              title: 'welcame',
              duration: Duration(seconds: 3),
              flushbarPosition: FlushbarPosition.TOP,
              titleColor: Colors.white,
              backgroundColor: Colors.green,
              messageText: SelectableText(
                ' ',
              ),
              borderRadius: BorderRadius.circular(10),
            ).show(context);


         // CacheHelper.saveString(key: "token", value: user!.data!.accessToken);
         Navigator.push(
             context, MaterialPageRoute(builder: (context) => Home()));
         print(value.data);
         emit(loginscessed());
       }


      
    }).catchError((e){
      print(e);
      emit(loginerror());
       });




  }
  IconData suffix = Icons.visibility_off_outlined;
  bool isPassword = true;
  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined ;

    emit(ChangePasswordVisibilityState());
  }

}
