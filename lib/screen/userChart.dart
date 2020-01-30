import 'package:flutter/material.dart';
import 'package:shopjoy/screen/globalWidget/globalWidget.dart';
import 'package:shopjoy/screen/userCheckout.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        backgroundColor: Colors.amberAccent,
      ),
      body: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 15),
          Expanded(
            child: ListView.builder(
              itemCount: bag.length,
              itemBuilder: (ctx, i) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 25),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.white,
                          ),
                          child: Image.network(
                            "${bag[i].mainImage}",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "${bag[i].title}",
                              style: Theme.of(context).textTheme.title,
                            ),
                            Text(
                              "${bag[i].price}",
                            ),
                            SizedBox(height: 15),
                            MyCounter(),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Divider(),
          Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("TOTAL", style: Theme.of(context).textTheme.subtitle),
                    Text("IDR. 8.999.999",
                        style: Theme.of(context).textTheme.headline),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  height: 50,
                  child: RaisedButton(
                    child: Text(
                      "CHECKOUT",
                      style: Theme.of(context).textTheme.button.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    onPressed:() =>  Navigator.push(context, MaterialPageRoute(builder: (context) => new CheckoutPage())),
                    color: Colors.amber,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    ),
    );
  }
}

class MyCounter extends StatefulWidget {
  const MyCounter({
    Key key,
  }) : super(key: key);

  @override
  _MyCounterState createState() => _MyCounterState();
}

class _MyCounterState extends State<MyCounter> {
  int _currentAmount = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        GestureDetector(
          child: Container(
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
            ),
            child: Icon(
              Icons.remove,
              color: Colors.white,
            ),
          ),
          onTap: () {
            if(_currentAmount != 0){
            setState(() {
              _currentAmount -= 1;
            });
            }
            return _currentAmount;
          },
        ),
        SizedBox(width: 15),
        Text(
          "$_currentAmount",
          style: Theme.of(context).textTheme.title,
        ),
        SizedBox(width: 15),
        GestureDetector(
          child: Container(
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
            ),
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          onTap: () {
            setState(() {
              _currentAmount += 1;
            });
          },
        ),
      ],
    );
  }
}