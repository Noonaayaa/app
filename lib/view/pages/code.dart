
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:votando/core/constant.dart';

class code extends StatelessWidget {
  const code({Key? key}) : super(key: key);

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
              Text('Enter Your code',style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.black,
                fontSize: 18,
              ),),
              SizedBox(height: 30,),
              login_Textfield(
                  text: "code",
                  control: email,
                  type: TextInputType.phone),
              SizedBox(
                height: 30,
              ),
              login_eve_button(
                  function: () {
                    // login.Login(email: email,context: context);
                    Navigator.pushReplacementNamed(context, 'changepass');
                  },
                  text: "submit",
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
