import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:getapipoke/usermodel.dart';
import 'package:http/http.dart' as http;


class ApiCallPoke extends StatefulWidget {
  const ApiCallPoke({super.key});

  @override
  State<ApiCallPoke> createState() => _ApiCallPokeState();
}

class _ApiCallPokeState extends State<ApiCallPoke> {
  String url="https://jsonplaceholder.typicode.com/users";
  List<Usermodel>userList=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataList();
  }
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: userList.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            margin: EdgeInsets.all(8),
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.amber.shade200,
              
        
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("id:${userList[index].id}",style: TextStyle(fontSize: 14,color: Colors.black),),
                 Text("name:${userList[index].name}",style: TextStyle(fontSize: 14,color: Colors.black),),
                  Text("username:${userList[index].username}",style: TextStyle(fontSize: 14,color: Colors.black),),
                   Text("email:${userList[index].email}",style: TextStyle(fontSize: 14,color: Colors.black),),
                    Text("address:${userList[index].address.street}",style: TextStyle(fontSize: 14,color: Colors.black),),
                    Text("        ${userList[index].address.city}",style: TextStyle(fontSize: 14,color: Colors.black),),
                    Text("        ${userList[index].address.suite}",style: TextStyle(fontSize: 14,color: Colors.black),),
                    Text("        ${userList[index].address.zipcode}",style: TextStyle(fontSize: 14,color: Colors.black),),

                    

        
        
              ],
            ),
          ),
        );
      },
    );
  }
  
  void getDataList() async{
    var response=await http.get(Uri.parse(url));
    if(response.statusCode==200){
      userList=usermodelFromJson(response.body);
     log("response:${userList.length}");
     setState(() {
       
     });
    }

  }
}