import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:votando/model_view/signUpCubit/sign_up_states.dart';
import 'package:votando/network/dio_helper.dart';

import '../../model/sign_up_model.dart';


class SignUpCubit extends Cubit<SignUpStates>{
  SignUpCubit() : super(InitialState());

  SignUpCubit get(context)=> BlocProvider.of(context);

  TextEditingController firstNameController = TextEditingController();


  TextEditingController email=TextEditingController();
  TextEditingController lastNameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController userNameController=TextEditingController();
  TextEditingController number=TextEditingController();
  TextEditingController imageController=TextEditingController();
  TextEditingController idCardImageController=TextEditingController();
  TextEditingController IdController=TextEditingController();
  TextEditingController countryController =TextEditingController();
  TextEditingController biryhnum=TextEditingController();
  TextEditingController cityController =TextEditingController();
  TextEditingController addressController=TextEditingController();
  TextEditingController birthdayDateController =TextEditingController();
  // late SignUpModel model ;
  Future signUpUse() async{
     emit(SignUpLoadingState());

    SignUpModel model = SignUpModel(
        first_name: firstNameController.text,
        last_name: lastNameController.text,
        email: email.text,
        password: passwordController.text,
        userName: userNameController.text,
        image: imageController.text,
        idCardImage: idCardImageController.text,
        nationalId:IdController.text ,
        country: countryController.text,
        city: cityController.text,
        address: addressController.text,
        birthdayDate: birthdayDateController.text,
    );

    DioHelper.postData(
      url: '/api/register',
      data: model.toMap(),).then((value){
      // model = SignUpModel.fromMap(value.data);
      print('Register success');
      emit(SignUpSuccessState());
    }).catchError((error){
      print('Error when Sign up : ${error.toString()}');
      emit(SignUpErrorState());
    });

  }

}