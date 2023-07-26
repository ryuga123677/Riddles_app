import 'dart:async';
import 'dart:convert';
import 'answer.dart';

import'package:flutter/material.dart';
import 'package:gym_app/riddlesmodel.dart';
import 'package:http/http.dart'as http;
class mainscreen extends StatefulWidget {
  const mainscreen({super.key});

  @override
  State<mainscreen> createState() => _mainscreenState();
}

class _mainscreenState extends State<mainscreen> {
  List<Riddlesmodel> allriddles=[];
  Color x=Colors.white;

  Future<List<Riddlesmodel>> getriddles()async{
final response=await http.get(Uri.parse('https://api.api-ninjas.com/v1/riddles'));
var data=jsonDecode(response.body.toString());
if(response.statusCode==200)
  {
    for(Map i in data)
      {
        allriddles.add(Riddlesmodel.fromJson(i));
      }
    return allriddles;
  }
else
  {
    return allriddles;
  }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blueAccent,
        title: Text('Riddles'),centerTitle: true,
      ),
      body: FutureBuilder(future: getriddles(),
      builder: (context,AsyncSnapshot<List<Riddlesmodel>> snapshot){
        if(!snapshot.hasData)
          {
            return Center(child: CircularProgressIndicator());
          }
        else
          {
            return Stack(

              children: [
                Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: Image.asset('images/4561977.jpg',fit: BoxFit.cover,)),
                Center(
                child: ListView.builder(
                    itemCount: allriddles.length,
                    itemBuilder: (context,index)
                {return Center(
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: [SizedBox(height: 250,),

                          Text(snapshot.data![index].title.toString(),style: TextStyle(color: Colors.red,fontSize: 20),
                          ),
                          SizedBox(height: 10,),
                          Text(snapshot.data![index].question.toString(),style: TextStyle(fontSize: 20,color: Colors.white),),



                          TextButton(onPressed: (){
String ans=snapshot.data![index].answer.toString();
Navigator.push(context, MaterialPageRoute(builder: (context)=>answer(ans: ans,)));




                                allriddles.clear();
                                setState(() {

                                });




                          }, child: Text('Answer?',style: TextStyle(fontSize: 20,color: Colors.greenAccent),))
                        ],
                    ),
                  );

                }),
              ),]
            );
          }
      },),
    );
  }
}
