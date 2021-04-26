import 'package:flutter/material.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25)
                ),
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: <Color>[
                      Colors.blueAccent[100],
                      Color(0xff4D53F0),
                    ]
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Row(
                        children: [
                          Text('Welcome, Jen',style: TextStyle(
                            fontSize: 18,
                            color: Colors.white
                          ),),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 7),
                            child: Icon(Icons.shopping_cart_outlined, color: Colors.white,),
                          ),
                          Icon(Icons.segment, color: Colors.white,),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: SizedBox(
                        width: 30,
                        child: Divider(
                          height: 2,
                          thickness: 5,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 50,bottom: 20),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text('Explore wide varieties of Grocery, fresh fruits and vegetables, electronic appliances,'
                            ' kitchen sets, gardening sets and much more',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),),
                      ),
                    ),
                    Container(
                      width: 270,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.black45,
                            blurRadius: 1.0,
                            offset: Offset(0.0,0.75)
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Icon(Icons.search, color: Colors.grey[700],),
                            ),
                            Text('search over 1500 products',
                              style: TextStyle(
                                color: Colors.grey[700],
                              ),),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: ,
    );
  }
}
