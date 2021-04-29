import 'package:carousel_pro/carousel_pro.dart';
import 'package:cogent_ecomm_app/InsideApp/Categories/fruits.dart';
import 'package:cogent_ecomm_app/InsideApp/slideIn.dart';
import 'package:flutter/material.dart';
import 'package:cogent_ecomm_app/InsideApp/bottomNavigation.dart';
import 'package:getwidget/getwidget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cogent_ecomm_app/InsideApp/categories.dart';
import 'package:cogent_ecomm_app/InsideApp/Categories/devices.dart';
import 'package:cogent_ecomm_app/InsideApp/Categories/shoes.dart';
import 'package:cogent_ecomm_app/InsideApp/Categories/toys.dart';

int _currentIndex = 0;
class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  final CollectionReference _productRef=FirebaseFirestore.instance.collection('Products');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: 800,
          width: 800,
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
                            width: MediaQuery.of(context).size.width * 0.75,
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
                //MyCarousel(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: MediaQuery.removePadding(
                      context: context,
                      //removeTop: true,
                      removeBottom: true,
                      child: ListView(
                        //scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.zero,
                        children: [
                          SizedBox(
                            height: 200,
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: Carousel(
                              dotSize: 4,
                              dotIncreasedColor: Color(0xff4D53F0),
                              dotBgColor:Colors.transparent,
                              images: [
                                Stack(
                                  children: <Widget>[
                                    Padding(
                                    padding: EdgeInsets.symmetric(vertical: 20),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(topRight: Radius.circular(50)),
                                        child: Image.asset('assets/carousel1.png',
                                          fit: BoxFit.cover,
                                          width: 1000.0,
                                      ),
                                    ),
                                  ),
                                    Center(child: Text('Grab the best deals',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25),
                                    ))
                                  ],
                                ),
                                Stack(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.symmetric(vertical: 20),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(topRight: Radius.circular(50)),
                                        child: Image.asset('assets/Carousel2.png',
                                        fit: BoxFit.cover,
                                        width: 1000.0,
                                      ),
                                    ),
                                  ),
                                    Center(child: Text('Wide variety of products',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25),
                                    ),)
                                  ],
                                ),
                              ]
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text('Categories'),
                    Spacer(),
                    GestureDetector(
                      child: Row(
                        children: [
                          Text('View items  '),
                          Icon(Icons.arrow_forward_outlined)
                        ],
                      ),
                      onTap: (){},
                    ),
                  ],
                ),
              ),
                SizedBox(
                  height: 250,
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    removeBottom: true,
                    //removeBottom: true,
                    child: ListView(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      children: [
                        SizedBox(
                        //height: 100,
                          child: Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextButton(
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => fruits()));
                                },
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: <Widget>[
                                    Image.asset('assets/Categories/box1.png'),
                                    Positioned(
                                        top: 0,
                                        right: 40,
                                        child: Image.asset('assets/Categories/fruits.png')
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(top: 5),
                                          child: Text('Fruits',style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.white
                                          ),),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(vertical: 12),
                                          child: SizedBox(
                                              width: 100,
                                              child: Text("Fresh fruits and vegetables available",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(color: Colors.white),
                                              )
                                          ),
                                        ),
                                        Text('40',style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white
                                        ),),
                                        Text('items',style: TextStyle(color: Colors.white),),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              TextButton(
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => shoes()));
                                },
                              child: Stack(
                                alignment: Alignment.center,
                                children: <Widget>[
                                  Image.asset('assets/Categories/box2.png'),
                                  Positioned(
                                      top: -8,
                                      right: 40,
                                      child: Image.asset('assets/Categories/shoes.png')
                                  ),
                                  Column(
                                    //crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: 5),
                                        child: Text('Shoes',style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.white
                                        ),),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(vertical: 12),
                                        child: SizedBox(
                                            width: 100,
                                            child: Text("Branded shoes and flips available",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(color: Colors.white),
                                            )
                                        ),
                                      ),
                                      Text('400',style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white
                                      ),),
                                      Text('items',style: TextStyle(color: Colors.white),)
                                    ],
                                  ),
                                ],
                              ),
                              ),
                              TextButton(
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => devices()));
                                },
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: <Widget>[
                                    Image.asset('assets/Categories/box3.png'),
                                    Positioned(
                                        top: 0,
                                        right: 40,
                                        child: Image.asset('assets/Categories/device.png')
                                    ),
                                    Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 80,
                                            child: Text('Electronic appliances',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),)
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(vertical: 8),
                                          child: SizedBox(
                                              width: 100,
                                              child: Text("Laptops. mobile phones & more...",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(color: Colors.white),
                                              )
                                          ),
                                        ),
                                        Text('1500',style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          color: Colors.white
                                        ),),
                                        Text('items',style: TextStyle(color: Colors.white),)
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              TextButton(
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => toys()));
                                },
                                //style: ElevatedButton.styleFrom(c),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: <Widget>[
                                    Image.asset('assets/Categories/box1.png'),
                                    /*Positioned(
                                        top: 0,
                                        right: 40,
                                        child: SizedBox(
                                          width: 100,
                                            child: Image.asset('assets/Categories/toys.png',),
                                        ),
                                    ),*/
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('Toys',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.white
                                          ),),
                                        Padding(
                                          padding: EdgeInsets.symmetric(vertical: 15),
                                          child: SizedBox(
                                              width: 100,
                                              child: Text("Toys for all age groups available",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(color: Colors.white),
                                              )
                                          ),
                                        ),
                                        Text('100',style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          color: Colors.white
                                        ),),
                                        Text('items',style: TextStyle(color: Colors.white),)
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                            ),
                      ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text('Todays Deals'),
                      Spacer(),
                      GestureDetector(
                        child: Row(
                          children: [
                            Text('View items  '),
                            Icon(Icons.arrow_forward_outlined)
                          ],
                        ),
                        onTap: (){},
                      ),
                    ],
                  ),
                ),
          /*GFCarousel(
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  pauseAutoPlayOnTouch: Duration(seconds: 10),
                  height: MediaQuery.of(context).size.height / 5.2,
                  items: imageList.map(
                        (url) {
                      return Column(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                                child: AssetImage(imageList[_currentIndex],),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ).toList(),
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                CarouselSlider(
                    items: [
                      Image.asset('assets/carousel1.png'),
                      Image.asset('assets/Carousel2.png'),
                ], options: CarouselOptions(height: 400))*/
                /*Expanded(
                  child: ListView(
                    padding: EdgeInsets.all(0),
                    children: [
                      Container(
                        height: 400,
                        child: PageView(
                        children: [
                          Container(
                            child: Image.asset('assets/carousel1.png'),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomRight: Radius.circular(40))
                            ),
                          ),
                          Image.asset('assets/Carousel2.png'),
                        ],
                    ),
                      ),
                    ],
                  ),
                ),*/
              ],
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: slideIn(),
      ),
      drawerEdgeDragWidth: MediaQuery.of(context).size.width/5,
    );
  }
}
