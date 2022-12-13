import 'package:flutter/material.dart';

mytextfield(){
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: SizedBox(
      height: 60,
      child: TextFormField(
         decoration: InputDecoration(
          label: const Text("Search in Thousend of Products"),
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20)
          )
         ),
      ),
    ),
  );
}


myAddressWidget(context){
  return SizedBox(
    width: MediaQuery.of(context).size.width / 2.3,
    child: Card(
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 199, 182, 182),
                        borderRadius: BorderRadius.circular(12)
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: const Text("Home Address",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                        ),
                        const Text("mostafa st.dff",style: TextStyle(fontSize: 8,),),
                    
                      ],
                    )
                  ],
                ),
              ),
  );
}


myCategoryWidget(String name,color){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(20)
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Text(name,style: const TextStyle(fontSize: 12),)
                    ],),
  );
}


myProductWidget(String name,String price,color){
  return Card(
             child: Row( children: [
                        Stack(children: [
                           Container(
                            height: 100,
                            width: 100,
                            margin: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: color,
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
                            child: IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border)),
                          )
  
                        ],
                          
                        ),
                        Column(
                          children: [
                            const SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(name,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                            ),
                            Text(price,style: const TextStyle(fontSize: 14,),),
        
                            ElevatedButton(child: const Text("Add to Card",style: TextStyle(fontSize: 12,)),
                            onPressed: (){
                        
                            },
                            style: ElevatedButton.styleFrom(

                              fixedSize: const Size(100, 15)
                            ),
                            )
                          ],
                        )
                      ],
                    ),
  );


}

mySuperDiscount(context){
  return Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 140,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 241, 203, 200),
                borderRadius: BorderRadius.circular(30)
              ),       
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                const Text("Mega",style: TextStyle(color: Colors.red,fontSize: 14,fontWeight: FontWeight.bold),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:const [
                    Text("            WHPP",style: TextStyle(color: Color.fromARGB(255, 41, 19, 138),fontSize: 35,fontWeight: FontWeight.bold),),
                    Text("E",style: TextStyle(color: Color.fromARGB(255, 240, 145, 57),fontSize: 35,fontWeight: FontWeight.bold),),
                    Text("R",style: TextStyle(color: Color.fromARGB(255, 41, 19, 138),fontSize: 35,fontWeight: FontWeight.bold),),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const[
                    Text("               \$ 17 ",style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.bold),),
                    SizedBox(width: 30,),
                    Text("\$ 32",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold,decoration: TextDecoration.lineThrough),),
                  ],
                ),
                    const Text("                                    * Available until 24 December",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),),

              ],),
            );
}