import 'dart:async';
import 'dart:convert';

import'package:flutter/material.dart';
import 'package:gym_app/mainscreen.dart';
import 'package:gym_app/riddlesmodel.dart';
import 'package:http/http.dart'as http;
class answer extends StatefulWidget {
  String ans;
   answer({super.key,required this.ans});

  @override
  State<answer> createState() => _answerState();
}

class _answerState extends State<answer> {
  List<Riddlesmodel> allriddles=[];
  Color x=Colors.white;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riddles'),
        backgroundColor: Colors.blue.shade400,
      ),
      body: Stack(
        children: [
          Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset('images/4561977.jpg',fit: BoxFit.cover,)),
          Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Answer - ${widget.ans}',style: TextStyle(fontSize: 20,color: Colors.white),),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>mainscreen()));
              }, child: Text('Next Riddle',style: TextStyle(fontSize: 20,color: Colors.greenAccent),))
            ],
          ),
        ),]
      )
    );
  }
}
