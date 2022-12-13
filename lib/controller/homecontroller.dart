import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:task/view/home.dart';
import 'package:task/view/orders.dart';

class HomeController extends GetxController{

RxInt currentindex = 0.obs;
RxList orders = [].obs;
RxList orderstatus = [].obs;
RxList favourites = [].obs;
RxInt totalPrice = 0.obs;
RxInt mtotalPrice = 1.obs;
RxInt orderQuantity = 1.obs;

  changefavourite(name,price){
    
    if(orders.contains(name)== false){
              print("yes");
            }else{
              print("No");
            }
 //  favourite.value = !favourite.value;
  
  
 }



void changeBottomIndex(index){
  currentindex.value = index;
}


Future getData()async{
var url = "https://6395f70990ac47c680792ef0.mockapi.io/products";
var response = await http.get(Uri.parse(url));
var responsebody = jsonDecode(response.body);
return responsebody;
}

List mdata = [{
      'n1' : '1',
      'n2' : '2',
}, 
{
      'n1' : '3',
      'n2' : '4',
} 
  ];
test(){
 for(var i in mdata){
 var m = i.containsValue('3');
 print(m);
 if(m == true){
  print("yes");
 }else{
  print("no");
 }
}
}
// List dataList=[];

//  myData(){
//   var data = [{
//     'name' : "fish",
//     'price': "20",
//     'oldPrice' : "25",
//     'quantity' : '1'
//   },
//   {
//     'name' : "meat",
//     'price': "25",
//      'oldPrice' : "30",
//      'quantity' : '1'
//   },
//   {
//     'name' : "pizza",
//     'price': "35",
//      'oldPrice' : "45",
//      'quantity' : '1'
//   },
//   {
//     'name' : "rice",
//     'price': "10",
//      'oldPrice' : "15",
//      'quantity' : '1'
//   }
//   ];
//   dataList = data;
// }




 }