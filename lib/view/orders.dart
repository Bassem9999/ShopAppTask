
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:task/controller/homecontroller.dart';

class OrdersPage extends StatelessWidget {
   final controller;
  const OrdersPage({this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        const SizedBox(height: 28,),
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


       Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.only(left: 8,top: 5),
        child: const Text("Cart",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),


        SizedBox(
          height: MediaQuery.of(context).size.height - 170,
          child: ListView.builder(
                  itemCount: controller.orders.length,
                  itemBuilder: ((context, i)=> Card(
                   child: Row( children: [
                      Container(
                      height: 100,
                      width: 100,
                      margin: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 236, 190, 186),
                        borderRadius: BorderRadius.circular(20)
                      ),
                    ),

                    SizedBox(width: 10,),
                  
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30,),
                      
                      Text(controller.orders[i]['name'],style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      const SizedBox(height: 10,),
                      Text(controller.orders[i]['number'],style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey),),
                      Row(
                        children: [
                          Text("\$ " + controller.orders[i]['price'],style: const TextStyle(fontSize: 18,color: Colors.red),),
                          SizedBox(width: 60,),
                          
                          InkWell(
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                              Container(
                                height: 30,
                                width: 30,
                                alignment: Alignment.topCenter,
                                // padding: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(20)
                              ),  
                              ),
                          
                              Text("-",style: TextStyle(fontSize: 40),textAlign: TextAlign.center,)
                            ],
                            ),
                            onTap: (){
                                 if(controller.orders[i]['quantity'] !="1") {
                                controller.orders[i]['quantity'] = (int.parse(controller.orders[i]['quantity']) - 1).toString();
                                controller.totalPrice.value = controller.totalPrice.value - int.parse(controller.orders[i]['price']);
                                print(controller.orders[i]['quantity']);
                              }  
                             
                              },
                              
                          ),

                          Padding(
                            padding:  EdgeInsets.all(8.0),
                            child: Text("${controller.orders[i]['quantity']}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          ),

                          InkWell(
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                              Container(
                                height: 30,
                                width: 30,
                                alignment: Alignment.topCenter,
                                // padding: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(20)
                              ),  
                              ),
                          
                              Text("+",style: TextStyle(fontSize: 30),textAlign: TextAlign.center,)
                            ],
                            ),
                            onTap: (){
                                controller.orders[i]['quantity'] = (int.parse(controller.orders[i]['quantity']) + 1).toString();
                                controller.totalPrice.value = controller.totalPrice.value + int.parse(controller.orders[i]['price']);
                                print(controller.orders[i]['quantity']); 
                            },
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          SizedBox(width: 90,),
                          ElevatedButton(child: const Text("Remove",style: TextStyle(fontSize: 13,)),
                          onPressed: (){
                            //widget.controller.totalPrice.value = widget.controller.totalPrice.value - int.parse(widget.controller.orders[i]['price']) ;
                            controller.totalPrice.value = controller.totalPrice.value - (int.parse(controller.orders[i]['price']) * int.parse(controller.orders[i]['quantity']));
                            controller.orders.remove(controller.orders[i]);
                             controller.orderstatus.remove(controller.orderstatus[i]);
                              print(controller.orders);
                          }, 
                          style: ElevatedButton.styleFrom(

                            fixedSize: const Size(100, 15)
                          ),
                          ),
                        ],
                                  )
                                ],
                              )
                            ],
                          ),)
                    )
          ),
        ),
      ],
    );            
    
  }
}