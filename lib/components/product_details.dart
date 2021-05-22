import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green_pedals/constants.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails(
      {@required this.productName,
      @required this.productType,
      @required this.productPrice,
      @required this.netImage});
  final String productName;
  final String productType;
  final String productPrice;
  final NetworkImage netImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 20,
          top: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productName,
                style: kCardTextStyle,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                productType,
                style: kCardSubTextStyle,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  productPrice,
                  textAlign: TextAlign.end,
                  style: TextStyle(color: Colors.orange, fontSize: 20),
                ),
              )
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          left: 0,
          right: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.7),
                    border: Border.all(color: kSecLightColor.withOpacity(0.8)),
                    borderRadius: BorderRadius.circular(10)),
                child: Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          child: Container(
            width: 100,
            height: 290,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: netImage,
                alignment: Alignment.topRight,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          right: 0,
          top: 140,
          left: 0,
        ),
      ],
    );
  }
}
