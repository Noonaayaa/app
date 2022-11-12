import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/constant.dart';
import '../../../model_view/signUpCubit/sign_up_cubit.dart';
import '../../../model_view/signUpCubit/sign_up_states.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool bo=true;
    /// warp 1- bloc provider --> connect cubit
    /// warp 2- bloc consumer  --> listen event
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
    TextEditingController cityController =TextEditingController();
    TextEditingController addressController=TextEditingController();
    TextEditingController birthdayDateController =TextEditingController();
    return BlocProvider(
      create: (context)=> SignUpCubit(),
      child: BlocConsumer<SignUpCubit,SignUpStates>(
        listener: (context,state){},
        builder: (context,state) {
          var cubit = SignUpCubit().get(context);

          /// on pressed function
          // SignUpCubit().get(context).signUpUser(model).then((value) {
          //   if(state is SignUpSuccessState){
          //
          //   }
          //   else if(state is SignUpErrorState){
          //
          //   }
          // });

          return Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.white70,
                centerTitle: true,
                title: Text(
                  'Voter', style: TextStyle(
                  fontSize: 40,
                  color: Colors.indigo,

                ),
                )
            ),

            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Create New Account", style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,

                      ),),
                      Text("Please Fill In The Form ",
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.indigo,
                        ),),
                      SizedBox(
                        height: 20.0,
                      ),

                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: firstNameController,
                        decoration: InputDecoration(
                          labelText: 'First Name',
                          iconColor: Colors.black,
                          prefixIcon: Icon(
                            Icons.person,
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),

                      SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: lastNameController,

                        decoration: InputDecoration(
                          labelText: 'Last Name',
                          prefixIcon: Icon(
                            Icons.person,
                          ),
                          iconColor: Colors.indigo,

                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,

                        controller: email,
                        decoration: InputDecoration(
                          hintText: 'Enter your Email',
                          labelText: 'Email Address',
                          prefixIcon: Icon(
                            Icons.email,
                          ),

                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: bo,
                        decoration: InputDecoration(
                          hintText: 'Enter your Password',
                          labelText: 'Password',
                          suffixIcon: GestureDetector(
                            onTap: () {
                              bo = !bo;
                            },
                            child: Icon(
                                bo ? Icons.visibility : Icons.visibility_off),
                          ),
                          prefixIcon: Icon(
                            Icons.lock,
                          ),

                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: userNameController,
                        decoration: InputDecoration(
                          labelText: 'UserName',
                          iconColor: Colors.indigo,
                          prefixIcon: Icon(
                            Icons.person,
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,

                        controller: IdController,
                        decoration: InputDecoration(

                          labelText: 'National Id ',


                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),

                      TextFormField(
                        keyboardType: TextInputType.datetime,

                        controller: birthdayDateController,
                        decoration: InputDecoration(

                          labelText: 'Birthday',
                          prefixIcon: Icon(
                            Icons.date_range,
                          ),

                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),

                      TextFormField(
                        controller: cityController,

                        decoration: InputDecoration(

                          labelText: 'Your City',


                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        controller:addressController,

                        decoration: InputDecoration(
                          hintText: 'Enter your Address',
                          labelText: 'Address',
                          prefixIcon: Icon(
                            Icons.house,
                          ),

                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: idCardImageController,

                        decoration: InputDecoration(
                          labelText: 'Id Card of the image',

                          iconColor: Colors.indigo,

                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(

                        // width: double.infinity,
                        color: Colors.grey,
                        child: GestureDetector(
                          onTap: pickcamera,
                          child: MaterialButton(onPressed: () {
                            var image = ImagePicker().pickImage(
                                source: ImageSource.camera);
                            imageController.dispose();
                          },

                            child: Text('Take your photo', style: TextStyle(
                              color: HexColor("#625FC9"),
                              decorationColor: HexColor("#625FC9"),

                              fontSize: 20.0,
                            ),
                            ),

                          ),
                        ),
                      ),

                      SizedBox(
                        height: 6.0,
                      ),
                      Text("This Image will Save to Check When Voting ",
                        style: TextStyle(
                            fontSize: 17.0
                        ),),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        width: double.infinity,
                        color: Colors.grey,
                        child: login_eve_button(
                            function: () {
                              Navigator.pushReplacementNamed(context, 'login');
                              SignUpCubit().get(context).signUpUse().then((value) {
                                if(state is SignUpSuccessState){}
                                else if(state is SignUpErrorState){}});
                            },

                            text: "Sign Up",
                            Text_color: Colors.white,
                            border_color: Colors.white,
                            button_color: HexColor("#625FC9")),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'If you Already Have an Account ', style: TextStyle(
                              fontSize: 19.0
                          ),),

                          TextButton(onPressed: () {

                            Navigator.pushReplacementNamed(context, 'login');
                          }, child: Text('click here ', style: TextStyle(
                              fontSize: 19.0
                          ),))

                        ],
                      )


                    ]
                ),
              ),
            ),
          );
        }  ),
          );
  }
}
void pickcamera() async
{
  //var image = await ImagePicker().pickImage(source:ImageSource.camera);
}