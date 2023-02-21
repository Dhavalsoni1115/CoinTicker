import 'package:bitcoin_ticker/price_card.dart';
import 'package:card_loading/card_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'network.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({Key? key}) : super(key: key);

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  List<Text> getCurrencyData() {
    List<Text> currencyData = [];
    for (String currency in currnciesList) {
      currencyData.add(Text(currency));
    }
    return currencyData;
  }

  dynamic dropdownValue = 0, dropdownValue1 = 0;
  dynamic btcRate, ethRate, ltcRate, data = false;
  // @override
  // void initState() {
  //   // print(cryptoData);
  //   // print(data['rate']);
  //   //dropdownValue;
  //   getData();
  //   super.initState();
  // }

  Future<dynamic> getData() async {
    dynamic btcRate1 = await getCryptoApi(
        crypto: 'BTC', currency: currnciesList.elementAt(dropdownValue));
    dynamic ethRate1 = await getCryptoApi(
        crypto: 'ETH', currency: currnciesList.elementAt(dropdownValue));
    dynamic ltcRate1 = await getCryptoApi(
        crypto: 'LTC', currency: currnciesList.elementAt(dropdownValue));
    setState(() {
      btcRate = btcRate1;
      ethRate = ethRate1;
      ltcRate = ltcRate1;
    });

    return {
      'BTC': btcRate,
      'ETH': ethRate,
      'LTC': ltcRate,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🪙 Coin Ticker 🪙'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: btcRate?['rate'] != null
                ? PriceCard(
                    coinName: cryptoList[0],
                    coinPrice: btcRate?['rate'].round().toString(),
                    coinType: currnciesList.elementAt(dropdownValue),
                  )
                : CardLoading(
                    height: 70,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    margin: EdgeInsets.only(bottom: 10),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ethRate?['rate'] != null
                ? PriceCard(
                    coinName: cryptoList[1],
                    coinPrice: ethRate?['rate'].round().toString() ?? 0,
                    coinType: currnciesList.elementAt(dropdownValue),
                  )
                : CardLoading(
                    height: 70,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    margin: EdgeInsets.only(bottom: 10),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ltcRate?['rate'] != null
                ? PriceCard(
                    coinName: cryptoList[2],
                    coinPrice: ltcRate?['rate'].round().toString() ?? 0,
                    coinType: currnciesList.elementAt(dropdownValue),
                  )
                : CardLoading(
                    height: 70,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    margin: EdgeInsets.only(bottom: 10),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 280),
            child: SizedBox(
              height: 70,
              width: 250,
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Select Currency'),
                      content: SizedBox(
                        height: 200,
                        child: CupertinoPicker(
                          // backgroundColor: Colors.blue,
                          // looping: false,
                          diameterRatio: 1.0,
                          //offAxisFraction: 0.05,
                          squeeze: 2.5,
                          magnification: 2.5,
                          itemExtent: 30,
                          onSelectedItemChanged: (selectedIndex) {
                            setState(() {
                              dropdownValue1 = selectedIndex;
                            });
                          },
                          children: getCurrencyData(),
                        ),
                      ),
                      actions: [
                        MaterialButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('Cancel'),
                        ),
                        MaterialButton(
                          onPressed: () {
                            setState(() {
                              dropdownValue = dropdownValue1;
                              getData();
                              data = true;
                            });
                            //print(data);
                            Navigator.pop(context, data);
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                  child:
                  const Text('Show Dialog');
                },
                child: Card(
                  elevation: 7.0,
                  shadowColor: Colors.brown,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  color: Colors.blue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Change Currency",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
//  Padding(
//             padding: const EdgeInsets.only(top: 215.2),
//             child: Container(
//               height: 202,
//               width: double.infinity,
//               color: Colors.blue,
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(10),
//                     child: CupertinoPicker(
//                       backgroundColor: Colors.blue,
//                       // looping: false,
//                       diameterRatio: 2.0,
//                       //offAxisFraction: 0.05,
//                       squeeze: 1.5,
//                       magnification: 2.5,
//                       itemExtent: 30,
//                       onSelectedItemChanged: (selectedIndex) {
//                         setState(() {
//                           dropdownValue = selectedIndex;
//                           getData();
//                           // btcRate['rate'];
//                           // data2=ethRate['rate'];
//                           // data3=ltcRate['rate'];
//                           // print(data1);
//                           // print(data2);
//                           // print(data3);
//                           //print(dropdownValue);
//                         });

//                         // print(data1?['time']);
//                       },
//                       children: getCurrencyData(),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),