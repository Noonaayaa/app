
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:votando/core/constant.dart';

class change_pass extends StatelessWidget {
  const change_pass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: null,
        elevation: 0.0,
        leading: BackButton(
          onPressed: (){Navigator.pop(context);
          },
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(

        child: Container(
          margin: EdgeInsets.symmetric(vertical: 50,horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  Text('Forget password',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Text('Enter New Password',style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.black,
                fontSize: 18,
              ),),
              SizedBox(height: 30,),
              login_Textfield(
                  text: "new password",
                  control: email,
                  type: TextInputType.text),
              SizedBox(height: 30,),
              Text('confrime password',style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.black,
                fontSize: 18,
              ),),
              SizedBox(height: 30,),
              login_Textfield(
                  text: 'confrime password',
                  control: email,
                  type: TextInputType.text),
              SizedBox(
                height: 30,
              ),
              login_eve_button(
                  function: () {
                    Navigator.pushReplacementNamed(context, 'login');
                  },
                  text: "ok",
                  Text_color: Colors.white,
                  border_color: Colors.white,
                  button_color: HexColor("#625FC9")),

            ],
          ),
        ),
      ),
    );
  }
}
