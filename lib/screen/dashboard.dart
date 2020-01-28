import 'package:flutter/material.dart';
import 'package:shopjoy/screen/globalWidget/productListItem.dart';
import 'package:shopjoy/screen/globalWidget/globalWidget.dart';
import 'package:shopjoy/screen/userCart.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
        title: Text(
          "PRODUCT LIST",
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          globalWidget.buttonIcon(Icon(Icons.favorite), 30, 'wish list', Colors.redAccent, (){}),
          globalWidget.buttonIcon(Icon(Icons.shopping_cart), 30, 'your chart', Colors.blueGrey, (){ Navigator.push(context, MaterialPageRoute( builder: (context) => new CartPage()));})
        ],
      ),
      body: Stack(
        children: <Widget>[ 
          _buildProductListPage(),
          _buildFilterWidgets(MediaQuery.of(context).size),
          _buildAdsImagesWidgets()
        ],
      )    
    );
  }


  final globalWidget = new GlobalWidget();

  _buildAdsImagesWidgets() {
    TabController imagesController = TabController(length: 3, vsync: this);
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100]
      ),
      child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 150.0,
        child: Center(
          child: DefaultTabController(
            length: 3,
            child: Stack(
              children: <Widget>[
                TabBarView(
                  controller: imagesController,
                  children: <Widget>[
                    Image( image : AssetImage('lib/assets/img/ad/ad1.jpg')),
                    Image( image : AssetImage('lib/assets/img/ad/ad2.jpg')),
                    Image( image : AssetImage('lib/assets/img/ad/ad3.jpg'))
                  ],
                ),
                Container(
                  alignment: FractionalOffset(0.5, 0.95),
                  child: TabPageSelector(
                    controller: imagesController,
                    selectedColor: Colors.amberAccent,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
    );
    }
    
  _buildProductListPage() {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.grey[100],
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildFilterWidgets(screenSize);
          } else if (index == 4) {
            return globalWidget.sizedBox(12.0, 0);
          } else {
            return _dummyProductsList()[index];
          }
        },
      ),
    );
  }

  _buildFilterWidgets(Size screenSize) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100]
      ),
      margin: const EdgeInsets.fromLTRB(12, 180, 12,0),
      width: screenSize.width,
      child: Card(
        elevation: 4.0,
        child: Container(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              globalWidget.buttonIcon(Icon(Icons.menu), 40, "show all", Colors.amberAccent, (){}),
              globalWidget.buttonIcon(Icon(Icons.monetization_on), 40, "show all", Colors.amberAccent, (){}),
              globalWidget.buttonIcon(Icon(Icons.motorcycle), 40, "show all", Colors.amberAccent, (){}),
              globalWidget.buttonIcon(Icon(Icons.local_car_wash), 40, "show all", Colors.amberAccent, (){}),
              globalWidget.buttonIcon(Icon(Icons.local_mall), 40, "show all", Colors.amberAccent, (){}),
              globalWidget.buttonIcon(Icon(Icons.fastfood), 40, "show all", Colors.amberAccent, (){}),
            ],
          ),
        ),
      ),
    );
  }
  
  _dummyProductsList() {
    return [
      ProductsListItem(
        name: "Michael Kora",
        currentPrice: 524,
        originalPrice: 699,
        discount: 25,
        imageUrl:
            "https://n1.sdlcdn.com/imgs/c/9/8/Lambency-Brown-Solid-Casual-Blazers-SDL781227769-1-1b660.jpg",
      ),
      ProductsListItem(
        name: "Michael Kora",
        currentPrice: 524,
        originalPrice: 699,
        discount: 25,
        imageUrl:
            "https://n1.sdlcdn.com/imgs/c/9/8/Lambency-Brown-Solid-Casual-Blazers-SDL781227769-1-1b660.jpg",
      ),
      ProductsListItem(
        name: "David Klin",
        currentPrice: 249,
        originalPrice: 499,
        discount: 50,
        imageUrl:
            "https://images-na.ssl-images-amazon.com/images/I/71O0zS0DT0L._UX342_.jpg",
      ),
      ProductsListItem(
        name: "Nakkana",
        currentPrice: 899,
        originalPrice: 1299,
        discount: 23,
        imageUrl:
            "https://assets.myntassets.com/h_240,q_90,w_180/v1/assets/images/1304671/2016/4/14/11460624898615-Hancock-Men-Shirts-8481460624898035-1_mini.jpg",
      ),
      ProductsListItem(
        name: "David Klin",
        currentPrice: 249,
        originalPrice: 499,
        discount: 20,
        imageUrl:
            "https://images-na.ssl-images-amazon.com/images/I/71O0zS0DT0L._UX342_.jpg",
      ),
      ProductsListItem(
        name: "Nakkana",
        currentPrice: 899,
        originalPrice: 1299,
        discount: 23,
        imageUrl:
            "https://assets.myntassets.com/h_240,q_90,w_180/v1/assets/images/1304671/2016/4/14/11460624898615-Hancock-Men-Shirts-8481460624898035-1_mini.jpg",
      ),
    ];
  }
}
