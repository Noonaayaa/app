import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:votando/core/constant.dart';
import 'package:votando/model_view/login/login_cubit.dart';
import 'package:votando/view/pages/forgetpass.dart';
import 'package:image_picker/image_picker.dart';

class  SignUp_Screen extends StatelessWidget {

  bool bo=true;


  @override
  Widget build(BuildContext context) {
    TextEditingController fnamecon =TextEditingController();
    var emailcon=TextEditingController();
    var passcon=TextEditingController();
    var lnamecon =TextEditingController();
    var unamecon=TextEditingController();
    var numbcon=TextEditingController();
    var phonecon=TextEditingController();
    var Addresscon=TextEditingController();
    var citycon =TextEditingController();
    var biryhnum=TextEditingController();

    create: (BuildContext context) {
      return LoginCubit();
    };
   // LoginCubit Sign = LoginCubit.get(context);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white70,
          centerTitle:true ,
          title: Text(
            'Voter',style: TextStyle(
            fontSize: 40,
            color: Colors.indigo,

          ),
          )
      ),
      body:Stack(

        children: [
         // Image(image: NetworkImage('https://th.bing.com/th/id/R.d767980b8b6ebbef3890ddbf27db99e1?rik=0S40f%2feklqgOPw&pid=ImgRaw&r=0') ,),
          Padding(

            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[

                    Text("Create New Account",style:TextStyle(
                      fontSize: 25.0,
                      fontWeight:FontWeight.bold ,
                      color: Colors.indigo,

                    ),),
                    Text("Please Fill In The Form ",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight:FontWeight.normal ,
                        color: Colors.indigo,
                      ),),
                    SizedBox(
                      height: 20.0,
                    ),

                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: fnamecon,
                      decoration: InputDecoration (
                        labelText: 'First Name',
                        iconColor:Colors.black ,
                        prefixIcon:Icon(
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
                      controller: lnamecon,

                      decoration: InputDecoration (
                        labelText: 'Last Name',
                        prefixIcon:Icon(
                          Icons.person,
                        ),
                        iconColor:Colors.indigo ,

                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,

                      controller: emailcon,
                      decoration: InputDecoration (
                        hintText:'Enter your Email',
                        labelText: 'Email Address',
                        prefixIcon:Icon(
                          Icons.email,
                        ),

                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: passcon,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText:bo,
                      decoration: InputDecoration (
                        hintText:'Enter your Password',
                        labelText: 'Password',
                        suffixIcon:GestureDetector(
                          onTap: (){
                            bo=!bo;},
                          child: Icon(bo ? Icons.visibility :Icons.visibility_off ),
                        ),
                        prefixIcon:Icon(
                          Icons.lock,
                        ),

                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height:15.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: unamecon,
                      decoration: InputDecoration (
                        labelText: 'UserName',
                        iconColor:Colors.indigo ,
                        prefixIcon:Icon(
                          Icons.person,
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height:15.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,

                      controller: numbcon,
                      decoration: InputDecoration (

                        labelText: 'National Id ',


                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height:15.0,
                    ),
                    Row(
                      children: [
                      ],
                    )
                    ,
                    TextFormField(
                      keyboardType: TextInputType.number,

                      controller: phonecon,
                      decoration: InputDecoration (

                        labelText: 'Phone number',
                        prefixIcon:Icon(
                          Icons.numbers,
                        ),

                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height:15.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.datetime,

                      controller: biryhnum,
                      decoration: InputDecoration (

                        labelText: 'Birthday',
                        prefixIcon:Icon(
                          Icons.date_range,
                        ),

                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height:15.0,
                    ),
                    TextFormField(
                      controller: citycon,

                      decoration: InputDecoration (

                        labelText: 'Your City',


                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height:15.0,
                    ),
                    TextFormField(
                      controller: Addresscon,

                      decoration: InputDecoration (
                        hintText:'Enter your Address',
                        labelText: 'Address',
                        prefixIcon:Icon(
                          Icons.house,
                        ),

                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height:15.0,
                    ),
                    Container(

                      // width: double.infinity,
                      color: Colors.grey,
                      child: GestureDetector(
                        onTap: pickcamera,
                        child: MaterialButton(onPressed: ()
                        {
                          var image =  ImagePicker().pickImage(source:ImageSource.camera);
                        },

                          child: Text('Take your photo',style: TextStyle(
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
                    Text("This Image will Save to Check When Voting ",style: TextStyle(
                        fontSize:17.0
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
                            //login.Login(email: email, pass: pass,context: context);
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
                        Text('If you Already Have an Account ',style: TextStyle(
                            fontSize: 19.0
                        ),),

                        TextButton(onPressed: ()
                        {
                          Navigator.pushReplacementNamed(context, 'login');
                        }, child: Text('click here ' ,style: TextStyle(
                            fontSize: 19.0
                        ),))

                      ],
                    )


                  ]
              ),
            ),
          ),
        ],
      ),


    );
  }

  void pickcamera() async
  {
    //var image = await ImagePicker().pickImage(source:ImageSource.camera);
  }
}

