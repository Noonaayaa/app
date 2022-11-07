import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:votando/core/constant.dart';

class p_view extends StatefulWidget {
  const p_view({Key? key}) : super(key: key);

  @override
  State<p_view> createState() => _p_viewState();
}

class _p_viewState extends State<p_view> {
  int current_index=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(alignment: Alignment.topCenter, children: [
            PageView(
              onPageChanged: (val){
                setState(() {
                 current_index=val;
                 if(current_index==2)
                   Navigator.pushReplacementNamed(context, 'login');

                });
              },
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: ExactAssetImage('images/vector_1.png'),
                  )),
                  margin: EdgeInsets.only(
                      top: 140, left: 20, right: 10, bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sign Up',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: HexColor("#625FC9")),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        '  Create An Account To Cast Your Vote',
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                            color: HexColor("#625FC9")),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: ExactAssetImage('images/vector_3.png'),
                  )),
                  margin: EdgeInsets.only(
                      top: 140, left: 20, right: 10, bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Vote',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: HexColor("#625FC9")),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        '  Vote For Your Preffered Candidate',
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                            color: HexColor("#625FC9")),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: ExactAssetImage('images/chart.jpg'),
                  )),
                  margin: EdgeInsets.only(
                      top: 140, left: 20, right: 10, bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'View Election Result',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: HexColor("#625FC9")),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        '  View Election Result of various candidates',
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                            color: HexColor("#625FC9")),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Votando App\n\n',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: HexColor("#625FC9"),
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Text(
                    ' How To Use The App?\n\n',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: HexColor("#625FC9"),
                    ),
                  ),
                ]),

                SizedBox(
                  height: 450,
                ),
                Center(
                  child: indicator(current_index),),
                login_eve_button(
                    text: 'Get Started',
                    Text_color: Colors.white,
                    border_color: Colors.white,
                    button_color: HexColor("#625FC9"),
                    function: () {
                      Navigator.pushReplacementNamed(context, 'login');
                    })
              ],
            )
          ]),
        ));
  }
}
class indicator extends StatelessWidget {

final int index;

  const indicator(  this.index);

  @override

  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        buildContainer(index==0? HexColor("#625FC9"):Colors.grey),
        SizedBox(width: 5,),
        buildContainer(index==1? HexColor("#625FC9"):Colors.grey),
        SizedBox(width: 5,),
        buildContainer( index==2? HexColor("#625FC9"):Colors.grey),

      ],
    );
  }

  Container buildContainer(Color color) {
    return Container(
    height: 15,
    width: 15,
    decoration: BoxDecoration(
      color: color,
      shape: BoxShape.circle,
    ),
  );
  }
}

