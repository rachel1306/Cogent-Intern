import 'package:cogent_ecomm_app/InsideApp/Categories/imageSwipe.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
class fruits extends StatefulWidget {
  @override
  _fruitsState createState() => _fruitsState();
}

class _fruitsState extends State<fruits> {
  final CollectionReference _fruits=FirebaseFirestore.instance.collection('Fruits');
  String documentid;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: FutureBuilder<QuerySnapshot>(
        future: _fruits.get(),
        builder: (context, snapshot){
          if(snapshot.hasError){
            return Scaffold(
              body: Center(
                child: Text("Error: ${snapshot.error}"),
              ),
            );
          }
          final fruitList = snapshot.data.docs;
          if(snapshot.connectionState == ConnectionState.done){
            //List imageList;
            //Map<String, dynamic> docData= snapshot.data.;
            return ListView(
                children: snapshot.data.docs.map((document){
                  List imageList=document.data()['image'];
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.9,
                    //width: MediaQuery.of(context).size.width,
                    child: Scaffold(
                      body: Padding(
                        padding: EdgeInsets.symmetric(vertical: 30,horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ImageSwipe(imageList: imageList,),
                            /*Center(
                              child: Container(
                                height: 200,
                                width: MediaQuery.of(context).size.width,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: PageView(
                                    children: [
                                      for(var i=0;i< imageList.length; i++)
                                      Container(
                                        child: Image.network("${document.data()['image'][i]}",
                                        fit: BoxFit.cover,),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),*/
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text('${document.data()['name']}',style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold
                              ),),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Text("Rs. ${document.data()['price']}",style: TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                              ),),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.85,
                                child: Text('${document.data()['description']}'),
                            ),
                            Spacer(),
                            Center(
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.symmetric(horizontal: 50,vertical: 15),
                                  backgroundColor: Colors.black
                                ),
                                  onPressed: (){},
                                  child: Text("Add to Cart",style: TextStyle(color: Colors.white),)
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 30),
                              child: Divider(color: Colors.black,),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
            );
          }
          return Scaffold(
            body: Center(child: CircularProgressIndicator(),),
          );
        },
      ),
    );
  }
}
