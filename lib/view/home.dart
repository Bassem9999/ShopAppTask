import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:task/components.dart';
import 'package:task/controller/homecontroller.dart';
import 'package:task/view/favourites.dart';
import 'package:task/view/orders.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetX<HomeController>(
        init: HomeController(),
        builder: (controller) {
   
     changeScreen(int index){
      switch(index){
       case 0 : return GroseryPage(controller: controller,);
       case 1 : return GroseryPage(controller: controller,);
       case 2 : return FavouritesPage(controller: controller);
       case 3 : return OrdersPage(controller: controller,);
      }
    }
    
    return Scaffold(

     floatingActionButton: FloatingActionButton(
      child: Column(
        children: [
          const SizedBox(height: 5,),
          Text("${controller.totalPrice.value}\$"),
          const Icon(Icons.shopping_cart_checkout)
        ],
      ),
      onPressed: () { controller.currentindex.value = 3; },
     ),
     floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

     bottomNavigationBar: BottomNavigationBar(
      currentIndex: controller.currentindex.value,
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      onTap: (value) {
        controller.changeBottomIndex(value);
      },
      items: const[
        BottomNavigationBarItem(
          icon: Icon(Icons.store_mall_directory_outlined),
          label: "Grosery"
          ),

          BottomNavigationBarItem(
          icon: Icon(Icons.notifications_none),
          label: "News",
          ),

          BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: "Favourites"
          ),

          BottomNavigationBarItem(
          icon: Icon(Icons.wallet),
          label: "Cart"
          ),
      ],
     ),
      body: changeScreen(controller.currentindex.value),
      );
  }
    );
  }
}



// class GroseryPage extends StatefulWidget{
//   final controller;
//   const GroseryPage({this.controller});

//   @override
//   State<GroseryPage> createState() => _GroseryPageState();
// }

class GroseryPage extends StatefulWidget {
  final controller;
   const GroseryPage({this.controller});

  @override
  State<GroseryPage> createState() => _GroseryPageState();
}

class _GroseryPageState extends State<GroseryPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
       // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
           mytextfield(),

           Row(
            children: [
            const SizedBox(width: 10,),
            myAddressWidget(context),
            const SizedBox(width: 30,),
            myAddressWidget(context),
           ],),
           const Padding(
             padding: EdgeInsets.all(5.0),
             child: Text("Explore By Category",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
           ),

         //  Text(controller.totalPrice.value.toString()),

            SizedBox(
              height: 90,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  myCategoryWidget("Steak",Color.fromARGB(255, 243, 182, 178)),
                  myCategoryWidget("Vegetables",Color.fromARGB(255, 238, 237, 166)),
                  myCategoryWidget("Beverages",Color.fromARGB(255, 209, 187, 238)),
                  myCategoryWidget("Fish",Color.fromARGB(255, 182, 220, 241)),
                  myCategoryWidget("Juice",Color.fromARGB(255, 229, 168, 189)),
                  myCategoryWidget("checkin",Color.fromARGB(255, 183, 235, 198)),
                  
                
                ],),
            ),

            const Padding(
             padding: EdgeInsets.all(3.0),
             child: Text("Deals of the Day",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
           ),

            SizedBox(height: 150,
            child: FutureBuilder(
          future: widget.controller.getData(),
          builder: ((BuildContext context,AsyncSnapshot snapshot) { 
           if(snapshot.hasData){
            return ListView.builder(
              scrollDirection: Axis.horizontal,
            itemCount: snapshot.data.length,
            itemBuilder: ((context, i)=> Card(
             child: Row( children: [
                        Stack(children: [
                           Container(
                            height: 110,
                            width: 110,
                            margin: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 236, 190, 186),
                              borderRadius: BorderRadius.circular(20)
                            ),
                          ),
  
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)
                            ),
                            child: IconButton(onPressed: (){
                         
                              if(widget.controller.favourites.contains(snapshot.data[i]['name'],))
                              { 
                               setState(() {
                                  widget.controller.favourites.remove(snapshot.data[i]['name'],);
                                });
                              }
                              else{
                              setState(() {
                                widget.controller.favourites.add(snapshot.data[i]['name'],);
                              });                                
                                 }
                       
                                    },
                              
                             //print(controller.favourites);
                            
                            //icon: Icon(Icons.ac_unit_rounded),
                              icon: widget.controller.favourites.contains(snapshot.data[i]['name'],)? const Icon(Icons.favorite,color: Colors.red,): const Icon(Icons.favorite_border)
                             ),
                                                      )
  
                        ],
                          
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 5,),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0,bottom: 5),
                              child: Text(snapshot.data[i]['name'],style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left:8.0,bottom: 5),
                              child: Text(snapshot.data[i]['number'],style: const TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.grey),),
                            ),

                            Row(
                              children: [
                                SizedBox(width: 5,),
                                Icon(Icons.location_on_outlined,size: 17,),
                                Text(snapshot.data[i]['address'],style: const TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.grey),),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0,bottom: 2,top: 5),
                              child: Row(
                                children: [
                                  Text("\$ " + snapshot.data[i]['price'],style: const TextStyle(fontSize: 14,color: Colors.red),),
                                  SizedBox(width: 15),
                                  Text("\$ " + snapshot.data[i]['oldPrice'],style: const TextStyle(fontSize: 14,color: Colors.grey,decoration:TextDecoration.lineThrough),),
                                   SizedBox(width: 15),
                                ],
                              ),
                            ),
  
                            ElevatedButton(child: const Text("Add to Cart",style: TextStyle(fontSize: 9,)),
                            onPressed: widget.controller.orderstatus.contains(snapshot.data[i]['name'],)? (){}
                            :(){
                           widget.controller.orderstatus.add(snapshot.data[i]['name'],);
                           widget.controller.orders.add({
                              'name' : snapshot.data[i]['name'],
                              'price' : snapshot.data[i]['price'],
                              'oldPrice' : snapshot.data[i]['oldPrice'],
                              'address' : snapshot.data[i]['address'],
                              'number' : snapshot.data[i]['number'],
                              'quantity' : snapshot.data[i]['quantity'],
                             });
                            widget.controller.totalPrice.value = widget.controller.totalPrice.value + int.parse(snapshot.data[i]['price']) ;
                               print(widget.controller.orders);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: widget.controller.orderstatus.contains(snapshot.data[i]['name'],)? Colors.grey : Colors.deepOrange,
                              fixedSize: const Size(80, 15)
                            ),
                            )
                          ],
                        )
                      ],
                    ),
  )
              ));
              }
              else{
                return const Center(child: CircularProgressIndicator(),);
              }
              }),
       ),
            ),  

            SizedBox(height: 15,),

            mySuperDiscount(context),
          ],
        );
  }
}