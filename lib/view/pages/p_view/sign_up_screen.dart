import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../core/constant.dart';
import '../../../model_view/signUpCubit/sign_up_cubit.dart';
import '../../../model_view/signUpCubit/sign_up_states.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool bo=true;
    var formKey = GlobalKey<FormState>();
    /// warp 1- bloc provider --> connect cubit
    /// warp 2- bloc consumer  --> listen event
    ///
    return BlocProvider(
      create: (context)=> SignUpCubit(),
      child: BlocConsumer<SignUpCubit,SignUpStates>(
          listener: (context,state){},
          builder: (context,state) {
            var cubit = SignUpCubit().get(context);

            return Scaffold(
              appBar: AppBar(
                  backgroundColor: Colors.white70,
                  centerTitle: true,
                  title: const Text(
                    'Voter',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.indigo,
                    ),
                  )
              ),

              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Create New Account",
                            style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo,
                          ),
                          ),
                          const Text(
                            "Please Fill In The Form ",
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.normal,
                              color: Colors.indigo,
                            ),
                          ),

                          const SizedBox(
                            height: 20.0,
                          ),

                          TextFormField(
                            keyboardType: TextInputType.text,
                            autofocus: true,
                            controller: cubit.firstNameController,
                            validator: (value){
                              if(value!.isEmpty){
                                return "this field is required";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              labelText: 'First Name',
                              iconColor: Colors.black,
                              prefixIcon: Icon(
                                Icons.person,
                              ),
                              border: OutlineInputBorder(),
                            ),
                          ),

                          const SizedBox(
                            height: 15.0,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            controller: cubit.lastNameController,
                            validator: (value){
                              if(value!.isEmpty){
                                return "this field is required";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              labelText: 'Last Name',
                              prefixIcon: Icon(
                                Icons.person,
                              ),
                              iconColor: Colors.indigo,

                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            validator: (value){
                              if(value!.isEmpty){
                                return "this field is required";
                              }
                              return null;
                            },
                            controller: cubit.email,
                            decoration: const InputDecoration(
                              hintText: 'Enter your Email',
                              labelText: 'Email Address',
                              prefixIcon: Icon(
                                Icons.email,
                              ),

                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          TextFormField(
                            controller: cubit.passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value){
                              if(value!.isEmpty){
                                return "this field is required";
                              }
                              return null;
                            },
                            obscureText: !cubit.isVisiable,
                            decoration: InputDecoration(
                              hintText: 'Enter your Password',
                              labelText: 'Password',
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  cubit.changePasswordState();
                                },
                                child: Icon(
                                    cubit.isVisiable == true ? Icons.visibility : Icons.visibility_off),
                              ),
                              prefixIcon: const Icon(
                                Icons.lock,
                              ),

                              border: const OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          TextFormField(
                            controller: cubit.confirmPasswordController,
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value){
                              if(value!.isEmpty){
                                return "this field is required";
                              }
                              return null;
                            },
                            obscureText: !cubit.isVisiable2,
                            decoration: InputDecoration(
                              hintText: 'Confirm Password',
                              labelText: 'Confirm Password',
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  cubit.changePasswordState2();
                                },
                                child: Icon(
                                    cubit.isVisiable2 == true? Icons.visibility : Icons.visibility_off),
                              ),
                              prefixIcon: const Icon(
                                Icons.lock,
                              ),

                              border: const OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            controller: cubit.userNameController,
                            validator: (value){
                              if(value!.isEmpty){
                                return "this field is required";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              labelText: 'UserName',
                              iconColor: Colors.indigo,
                              prefixIcon: Icon(
                                Icons.person,
                              ),
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            validator: (value){
                              if(value!.isEmpty){
                                return "this field is required";
                              }
                              return null;
                            },
                            controller: cubit.IdController,
                            decoration: const InputDecoration(

                              labelText: 'National Id',


                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.datetime,
                            validator: (value){
                              if(value!.isEmpty){
                                return "this field is required";
                              }
                              return null;
                            },
                            onTap: (){
                              cubit.showCalender(context);
                            },
                            controller: cubit.birthdayDateController,
                            readOnly: true,
                            decoration: const InputDecoration(
                              labelText: 'Birthday',
                              prefixIcon: Icon(
                                Icons.date_range,
                              ),

                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          TextFormField(
                            controller: cubit.cityController,
                            validator: (value){
                              if(value!.isEmpty){
                                return "this field is required";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(

                              labelText: 'Your City',


                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          TextFormField(
                            controller:cubit.addressController,
                            validator: (value){
                              if(value!.isEmpty){
                                return "this field is required";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: 'Enter your Address',
                              labelText: 'Address',
                              prefixIcon: Icon(
                                Icons.house,
                              ),

                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            controller: cubit.idCardImageController,
                            validator: (value){
                              if(value!.isEmpty){
                                return "this field is required";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              labelText: 'Id Card of the image',

                              iconColor: Colors.indigo,

                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 20,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  // width: double.infinity,
                                  color: Colors.grey,
                                  child: MaterialButton(
                                    onPressed: () {
                                      cubit.getCameraImage();
                                    },
                                    child: Text('Take your photo', style: TextStyle(
                                      color: HexColor("#625FC9"),
                                      decorationColor: HexColor("#625FC9"),

                                      fontSize: 20.0,
                                    ),
                                    ),

                                  ),
                                ),
                                Container(
                                  color: Colors.grey,
                                  child: MaterialButton(
                                    onPressed: () {
                                      cubit.getGalleryImage();
                                    },
                                    child: Text(
                                      'Take id image',
                                      style: TextStyle(
                                      color: HexColor("#625FC9"),
                                      decorationColor: HexColor("#625FC9"),
                                      fontSize: 20.0,
                                    ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),

                          const SizedBox(
                            height: 10.0,
                          ),

                          const Text(
                            "This Image will Save to Check When Voting ",
                            style: TextStyle(
                                fontSize: 17.0,
                            ),
                          ),

                          const SizedBox(
                            height: 20.0,
                          ),

                          Container(
                            width: double.infinity,
                            color: Colors.grey,
                            child: login_eve_button(
                                function: () {
                                  if(formKey.currentState!.validate()){
                                    Navigator.pushReplacementNamed(context, 'login');
                                    SignUpCubit().get(context).signUpUse().then((value) {
                                      if(state is SignUpSuccessState){}
                                      else if(state is SignUpErrorState){}});
                                  }
                                },
                                text: "Sign Up",
                                Text_color: Colors.white,
                                border_color: Colors.white,
                                button_color: HexColor("#625FC9")),
                          ),

                          const SizedBox(
                            height: 10.0,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'If you Already Have an Account ',
                                style: TextStyle(
                                  fontSize: 14.0
                                ),
                              ),

                              TextButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(context, 'login');
                              },
                              child: const Text(
                                'click here',
                                style: TextStyle(
                                  fontSize: 14.0
                                ),
                              ),
                              ),

                            ],
                          )

                        ]
                    ),
                  ),
                ),
              ),
            );
          }  ),
    );
  }
}