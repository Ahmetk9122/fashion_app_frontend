import 'dart:async';

import 'package:flutter/material.dart';

class Story extends StatefulWidget {
  const Story({Key? key}) : super(key: key);

  @override
  State<Story> createState() => _StoryState();
}

class _StoryState extends State<Story> {
  double percent =0.0;
  late Timer _timer;
  String url ="https://images.pexels.com/photos/2787341/pexels-photo-2787341.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";
  void startTimer()
  {
    _timer=Timer.periodic(Duration(milliseconds: 10), (timer)
    {
      setState(() {
        percent +=0.001;
        if(percent>1)
        {
          _timer.cancel();
          Navigator.pop(context);
        }
        
      });
    });
  }
  @override
  void initState() {
    startTimer();
    // TODO: implement initState


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(url),fit:BoxFit.cover),
              
            ),
           ),
          Padding(padding: EdgeInsets.symmetric(vertical: 36.0,horizontal: 8.0),
          child: 
          Column(
            children: [
              LinearProgressIndicator(
                color: Colors.white,
                backgroundColor: Colors.grey,
                value:percent ,
              ),
              SizedBox(height: 8.0,),
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/model1.jpeg"),
                    radius: 30 ,
                    ),
                  SizedBox(width:8.0,),
                  Text("Jeneffer Lorens",style: TextStyle(color: Colors.white,fontFamily:"Montserrat",fontSize:18,fontWeight: FontWeight.w600),)
                ],
              )
            ],
          ),),
        ],
      ),
    );
  }
}