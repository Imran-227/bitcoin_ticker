import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'coin_data.dart';
import 'netHelper.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({super.key});

  @override
  PriceScreenState createState() => PriceScreenState();
}

class PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  String currentBTCPrice = '?';
  String currentETHPrice = '?';
  String currentLTCPrice = '?';

  DropdownMenu dropdownMenu() {
    List<DropdownMenuEntry<String>> L = [];
    for (String currency in currenciesList) {
      L.add(DropdownMenuEntry(value: currency, label: currency));
    }

    return DropdownMenu(
      menuHeight: 350.0,
      initialSelection: selectedCurrency,
      dropdownMenuEntries: L,
      onSelected: (value) {
        selectedCurrency = value;
        getPrices();
      },
    );
  }

  CupertinoPicker cupertinoPicker() {
    List<Text> L = [];
    for (String currency in currenciesList) {
      L.add(Text(currency));
    }

    return CupertinoPicker(
      itemExtent: 28.0,
      onSelectedItemChanged: (value) {
        selectedCurrency = currenciesList[value];
        getPrices();
      },
      children: L,
    );
  }

  getPrices() async {
    NetHelper bTCNetHelper =
        NetHelper(crypto: 'BTC', currency: selectedCurrency);
    NetHelper eTHNetHelper =
        NetHelper(crypto: 'ETH', currency: selectedCurrency);
    NetHelper lTCNetHelper =
        NetHelper(crypto: 'LTC', currency: selectedCurrency);
    String bTBValue = await bTCNetHelper.getDate();
    String eTHValue = await eTHNetHelper.getDate();
    String lTBValue = await lTCNetHelper.getDate();
    setState(() {
      currentBTCPrice = bTBValue;
      currentETHPrice = eTHValue;
      currentLTCPrice = lTBValue;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      getPrices();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 BTC = $currentBTCPrice $selectedCurrency',
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 ETH = $currentETHPrice $selectedCurrency',
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 LTC = $currentLTCPrice $selectedCurrency',
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? cupertinoPicker() : dropdownMenu(),
          ),
        ],
      ),
    );
  }
}
