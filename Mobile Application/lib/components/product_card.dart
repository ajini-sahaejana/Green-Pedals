import 'package:flutter/material.dart';
import 'package:green_pedals/components/product_details.dart';
import 'package:green_pedals/screens/bicycle_details.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width / 1.7,
        child: Card(
          elevation: 5,
          shadowColor: Colors.greenAccent,
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return BicycleDetails(
                      img:
                          "https://pngimg.com/uploads/bicycle/bicycle_PNG5374.png",
                    );
                  },
                ),
              );
            },
            child: ProductDetails(
              productName: 'Go Cycle',
              productType: 'TriCycle',
              productPrice: 'Rs. 100/=',
              netImage: NetworkImage(
                "https://buytricycle.com/wp-content/uploads/2020/03/black-bl22-768x563.jpg",
              ),
            ),
          ),
        ));
  }
}
