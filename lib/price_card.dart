import 'package:flutter/material.dart';

class PriceCard extends StatelessWidget {
  dynamic coinName, coinPrice, coinType;

  PriceCard({
    Key? key,
    required this.coinName,
    required this.coinPrice,
    required this.coinType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: double.infinity,
      child: Card(
        elevation: 7.0,
        // clipBehavior: Clip.antiAlias,
        shadowColor: Colors.brown,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "1" + " $coinName " + "=" + " $coinPrice" + " $coinType",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
