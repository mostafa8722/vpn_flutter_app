  import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vpn_flutter_app/constants/constants.dart';

import 'components/custom_clipper.dart';

  class HomeScreen extends StatefulWidget{
    @override
  State<StatefulWidget> createState() =>_HomeState();
  }
  class _HomeState extends State<HomeScreen>{

    bool isConnected = false;
    @override
  Widget build(BuildContext context) {

      return Scaffold(
        backgroundColor: bgColor,
        body: ListView(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              overflow: Overflow.visible,
              children: [
                upperCurveContainer(context),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                       margin:EdgeInsets.only(top: 30,left: 20) ,
                     padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: bgColor
                      ),
                      child: Center(
                        child:Row(children: [
                         SizedBox(height: 30,child:  Image.asset("assets/images/premiumcrown.png"),),
                          SizedBox(width: 4,),
                          Text("Go Premium",style: TextStyle(color: Colors.white),)
                        ],) ,
                      ),
                    ),
                    Container(
                      margin:EdgeInsets.only(top: 30,right: 20) ,
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: bgColor
                      ),
                      child: Center(
                        child:Row(children: [
                          Icon(Icons.tune,color:Colors.white,)
                        ],) ,
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 120),
                  child: Column(
                    children: [
                      Center(
                        child: Text("Satelite VPN",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                      )
                    ],
                  ),

                ),
                Container(
                  margin: EdgeInsets.only(top: 190,left: 30,right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Text("Upload \n  546kb/s",style: TextStyle(color: Colors.white60.withOpacity(0.5),fontSize: 13),),
                      Text("Download \n  62.3 mb/s",style: TextStyle(color: Colors.white60.withOpacity(0.5),fontSize: 13),),

                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 190),
                  child: Column(
                    children: [
                      _circleSection(),
                      SizedBox(height: 10,),
                      _statusSection(),
                      SizedBox(height: 10,),
                      Text("00:22:10",style: TextStyle(color: Colors.white60),),
                      SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 15,), Text("Rondom Location",style: TextStyle(color: Colors.white60),),
                          ],
                        ),
                      SizedBox(height: 10,),
                      _listBox(),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 15,),  Text("Select Location",style: TextStyle(color: Colors.white60),),
                        ],
                      ),
                      SizedBox(height: 10,),
                        _listBox(),
                      SizedBox(height: 20,),
                    ],
                  ),
                )

              ],
            )
          ],
        ),
      );
  }
  Widget upperCurveContainer(BuildContext context){
      return ClipPath(
        clipper: MyCustomClipper(),
        child: Container(
         padding: EdgeInsets.symmetric(horizontal: 32,vertical: 36),
         height: 260,
         width: MediaQuery.of(context).size.width,
         decoration: BoxDecoration(
           gradient: curveGradient
         ),
        ),
      );
  }

  Widget _circleSection(){
      return   Container(

          height: 200,
          width: 200,
          decoration: BoxDecoration(
              gradient: curveGradient,
              shape: BoxShape.circle
          ),
          child:
          Center(child:
          Container(
              height: 170,
              width: 170,
              decoration: BoxDecoration(
                  color: bgColor,
                  shape: BoxShape.circle
              ),
              child:
              Stack(
                children: [
                  Center(child:
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        print(isConnected);
                        isConnected = !isConnected;
                      });
                    },
                    child: Container(
                      height: 140,
                      width: 140,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle
                      ),
                      child:
                      Center(child: Icon(Icons.wifi_lock,color: Colors.white,),),
                    ),
                  ),
                  ),
                  Positioned(

                    child:Container(
                      height: 70,
                      width: 70,
                      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                      decoration: BoxDecoration(
                          color: bgColor,
                          shape: BoxShape.circle
                      ),
                      child: Image.asset("assets/images/canada.png",),


                    ) ,

                  )
                ],
              )

          ),
          )

      );
  }

  Widget _statusSection(){
      return      Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Text("Status : ",style: TextStyle(color: Colors.white,fontSize: 20),),
    Text(isConnected?"Connected":"disConnected",style: TextStyle(color: Colors.green,fontSize: 20),),
    ],
    );

  }

  Widget _listBox(){
     return Container(
       padding: EdgeInsets.symmetric(horizontal: 10),
       margin: EdgeInsets.symmetric(horizontal: 15),
       height: 40,
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(15),
         border: Border.all(color: Colors.white60,width: 1)
       ),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Row(

             children: [
              Container(
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child:  Image.asset("assets/images/canada.png"),
              ),
               Text("Canada",style: TextStyle(color: Colors.white60),)
             ],
           ),
           Icon(Icons.refresh,color: Colors.white60,)
         ],
       ),
     );
  }
  }