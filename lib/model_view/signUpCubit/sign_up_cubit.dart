import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
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
  TextEditingController confirmPasswordController=TextEditingController();
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



  Future signUpUse() async{
     emit(SignUpLoadingState());

    SignUpModel model = SignUpModel(
        first_name: firstNameController.text,
        last_name: lastNameController.text,
        email: email.text,
        password: passwordController.text,
        userName: userNameController.text,
        image: galleryImage!,
        idCardImage: idCardImageController.text,
        nationalId:IdController.text ,
        country: countryController.text,
        city: cityController.text,
        address: addressController.text,
        birthdayDate: birthdayDateController.text,
    );

    if(galleryImage != null && passwordController.text==confirmPasswordController.text){
      DioHelper.postData(
        url: '/api/register',
        data: model.toMap(),
      ).then((value){
        // model = SignUpModel.fromMap(value.data);
        emit(SignUpSuccessState());
      }).catchError((error){
        print('Error when Sign up : ${error.toString()}');
        emit(SignUpErrorState());
      });
    }

  }

  bool isVisiable = false;

  void changePasswordState(){
    isVisiable = !isVisiable;
    emit(ChangePasswordState());
  }

  bool isVisiable2 = false;

  void changePasswordState2(){
    isVisiable2 = !isVisiable2;
    emit(ChangePasswordState());
  }





  File? cameraImage;
  var imagePicker = ImagePicker();

  Future <void> getCameraImage() async {
    final pickedFile = await imagePicker.pickImage(
      source: ImageSource.camera,
    );
    if(pickedFile != null) {
      cameraImage = File(pickedFile.path);
      emit(GetCameraImageSuccessState());
    }else {
      if (kDebugMode) {
        print('No Image selected.');
      }
      emit(GetCameraImageErrorState());
    }
  }

  File? galleryImage;
  var imagePicker2 = ImagePicker();

  Future <void> getGalleryImage() async {
    final pickedFile = await imagePicker2.pickImage(
      source: ImageSource.gallery,
    );
    if(pickedFile != null) {
      galleryImage = File(pickedFile.path);
      emit(GetGalleryImageSuccessState());
    }else {
      if (kDebugMode) {
        print('No Image selected.');
      }
      emit(GetGalleryImageErrorState());
    }
  }


  void showCalender (context){
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.parse('1900-01-01'),
      lastDate: DateTime.parse('2023-01-01'),
    ).then((value) {
      birthdayDateController.text = DateFormat.yMMMd().format(value!);
      emit(ShowDateState());
    });
  }




}