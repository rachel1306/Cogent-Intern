import 'package:carousel_pro/carousel_pro.dart';
import 'package:cogent_ecomm_app/InsideApp/slideIn.dart';
import 'package:flutter/material.dart';
import 'package:cogent_ecomm_app/InsideApp/bottomNavigation.dart';
import 'package:getwidget/getwidget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cogent_ecomm_app/InsideApp/categories.dart';

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
                  height: 100,
                    child: categories()
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
