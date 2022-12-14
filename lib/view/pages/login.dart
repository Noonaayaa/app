import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:votando/core/constant.dart';
import 'package:votando/model_view/login/login_cubit.dart';
import 'package:votando/view/pages/forgetpass.dart';

class login extends StatelessWidget {
  const login({Key? key}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController pass = TextEditingController();
    return BlocProvider(
      create: (BuildContext context) {
        return LoginCubit();
      },
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          LoginCubit login = LoginCubit.get(context);
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0.0,
                title: null,

              ),
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(vertical: 30,horizontal: 20),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),

                    child: Column(

                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        SizedBox(
                          height: 30,
                        ),

                        Text("Login",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: HexColor("#625FC9"),
                              fontSize: 25,
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        login_Textfield(
                            text: "E-mail",
                            control: email,
                            type: TextInputType.emailAddress),
                        SizedBox(
                          height: 30,
                        ),
                        login_Textfield(

                          type: TextInputType.text,
                          text: "password",
                          control: pass,
                          suffix: login.suffix,
                          onSubmit: (value) {},
                          is_password: login.isPassword,
                          suffixPressed: () {
                            login.changePasswordVisibility();
                          },
                          Icon_color:HexColor("#625FC9"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>forgetpass()));
                          },
                          child: Text(
                            "forget password ?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: HexColor("#625FC9"),
                                fontSize: 15,
                                decoration: TextDecoration.underline,
                                decorationColor: HexColor("#625FC9")),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        login_eve_button(
                            function: () {
                              login.Login(email: email, pass: pass,context: context);
                            },
                            text: "Login",
                            Text_color: Colors.white,
                            border_color: Colors.white,
                            button_color: HexColor("#625FC9")),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't Have An Account ?"),
                            TextButton(onPressed: () {
                              Navigator.pushReplacementNamed(context, 'signUp');
                            },
                              child: Text('Register', style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: HexColor("#625FC9"),
                                  fontSize: 15,
                                  decoration: TextDecoration.underline,
                                  decorationColor: HexColor("#625FC9")),
                              ),),
                          ],
                        ),


                      ],
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
}

