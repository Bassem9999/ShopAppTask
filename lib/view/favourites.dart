
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:task/controller/homecontroller.dart';

class FavouritesPage extends StatelessWidget {
 final controller;
  const FavouritesPage({this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        const SizedBox(height: 25,),
        Row(children: [
        Container(
        height: 40,
        width: 130,
        margin: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft:Radius.circular(30),
            topRight: Radius.circular(70),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(20)),
          color: Color.fromARGB(255, 223, 136, 130),
        ),
        child: Row(children: const[
           Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.location_on_outlined,size: 27,color: Colors.white,),
          ),

          Text("Mustafa st.",style: TextStyle(color: Colors.white),)
        ],),
        ),

         SizedBox(width: MediaQuery.of(context).size.width /3 + 20 ,),

        const CircleAvatar(radius: 25,backgroundColor: Color.fromARGB(255, 231, 212, 210),)
          ],),
      ],
    );              
             
    
  }
}