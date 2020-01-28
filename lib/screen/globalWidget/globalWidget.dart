import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class GlobalWidget {
  Widget button(BuildContext context, String title, String nav) {
    return MaterialButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
            side: BorderSide(color: Colors.white, width: 5)),
        color: Colors.deepOrange,
        minWidth: 300,
        height: 70,
        onPressed: () {
          Navigator.pushReplacementNamed(context, nav);
        },
        child: Text(
          title,
          style: TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
        ));
  }

  Widget actionButton(BuildContext context, String title, Function action, Color color) {
    return MaterialButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
            side: BorderSide(color: Colors.white, width: 5)),
        color: color,
        minWidth: 300,
        height: 70,
        onPressed: action,
        child: Text(
          title,
          style: TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
        ));
  }

  Widget sizedBox(double height, double width) {
    return SizedBox(height: height, width: width);
  }

  Widget copyRight() {
    return Container(
        margin: EdgeInsets.only(top: 60),
        child: Text(
          'Copyright \u00a9 JoyShop by Iqbal & Brian est. 2020',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        ));
  }
  Widget progressHud(bool isLoading, Container container){
    return ModalProgressHUD(
          progressIndicator: Center(
              child: loadingIndicator()),
          color: Colors.black87,
          opacity: 0.6,
          inAsyncCall: isLoading,
          child: container);
  }

  Widget logoApp(String filePath, double height, double width) {
    return Container(
        margin: EdgeInsets.only(left: 30, top: 50),
        child: Center(
          child: Image(
            image: AssetImage(filePath),
            height: height,
            width: width,
          ),
        ));
  }

  Widget loadingIndicator(){
    return Center(child: Column(
      children: <Widget>[
        logoApp('lib/assets/img/push cart.gif', 150, 100),
        Text(
          "Please wait . . .",
          style: TextStyle(
            color: Colors.white
          )
          )
      ],
    ));
  }

  background(Color color1, Color color2, Color color3, Color color4) {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [color1, color2, color3, color4],
      ),
    );
  }

  inputDecoration(
      Color borderColor, Color labelColor, String labelText, double fontSize) {
    return InputDecoration(
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: borderColor)),
        labelText: labelText,
        labelStyle: TextStyle(fontSize: fontSize, color: labelColor));
  }

  showAlert(BuildContext context, String title, String desc, bool isSuccess){
    Alert(
      context: context,
      type:  isSuccess ? AlertType.success : AlertType.error,
      title: title,
      desc: desc,
      buttons: [
        DialogButton(
          child: Text(
            "Ok",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: Color.fromRGBO(0, 179, 134, 1.0),
        ),
        DialogButton(
          child: Text(
            "Cancel",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          gradient: LinearGradient(colors: [
            Color.fromRGBO(116, 116, 191, 1.0),
            Color.fromRGBO(52, 138, 199, 1.0)
          ]),
        )
      ],
    ).show();
  }

  buttonIcon(Widget myicon, double size, String tip, Color color, Function onpress){
    return
    IconButton(
            icon: myicon,
            iconSize: size,
            tooltip: tip,
            color: color,
            onPressed: onpress,
          );
  }
}

class Product {
  final String mainImage;
  final List<String> images;
  final List<String> tags;
  final List<Color> colors;
  final List<int> size;
  final String title;
  final String price;
  final double rating;
  Product({
    this.rating,
    this.price,
    this.mainImage,
    this.images,
    this.tags,
    this.colors,
    this.size,
    this.title,
  });
}

List<Product> bag = [
  Product(
    title: "Hand Bag",
    price: "IDR. 4.000.000.",
    images: [
      'http://www.pngall.com/wp-content/uploads/4/Leather-Bag-PNG.png',
      'https://www.stickpng.com/assets/images/580b57fbd9996e24bc43bf85.png',
      'https://img.favpng.com/23/4/0/tote-bag-red-leather-handbag-png-favpng-ki0rQC3dTsbB0fdQT3WvmvxrU.jpg',
    ],
    colors: [Colors.black, Colors.red, Colors.yellow],
    mainImage: 'http://www.pngall.com/wp-content/uploads/4/Leather-Bag-PNG.png',
    size: [1,2,3,4,5,6,7,8,9],
    tags: ['Product', 'Bag', 'HandBag', 'Price', 'Quality']
  ),
  Product(
    title: "Adidas Superstar",
    price: "IDR. 4.999.999",
    images: [
      'http://www.miss-blog.fr/media/import/Images/adida%20superstar-896uqv.jpg',
      'https://www.transparentpng.com/thumb/adidas-shoes/a4xO3G-adidas-shoes-adidas-shoe-kids-superstar-daddy-grade.png',
      'https://img.favpng.com/23/4/0/tote-bag-red-leather-handbag-png-favpng-ki0rQC3dTsbB0fdQT3WvmvxrU.jpg',
    ],
    colors: [Colors.black, Colors.red, Colors.yellow],
    mainImage: 'http://www.miss-blog.fr/media/import/Images/adida%20superstar-896uqv.jpg',
    size: [1,2,3,4,5,6,7,8,9],
    tags: ['Product', 'Shoe', 'Adidas', 'Price', 'Quality']
  ),
];
