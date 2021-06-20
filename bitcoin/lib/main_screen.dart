import 'package:bitcoin/crypto_card.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'coin_data.dart';
import 'crypto_card.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void initState()  {
    super.initState();
    getData();
  }
  void getData() async{
    Map<String,String>data=await CoinData().getData(selectedCurrency);
    if(data.isEmpty){
      print('here');
      setState(() {
        BTCVal='?';
         ETHVal='?';
         LTCVal='?';
         isWaiting=false;
      });
      return;
    }
    else{
      setState(() {
        isWaiting=true;
      });
      setState(() {
        print(data['BTC']);
        BTCVal=data['BTC'];
        ETHVal=data['ETH'];
        LTCVal=data['LTC'];
        isWaiting=false;
      });
    }


  }
  String selectedCurrency='USD';
  String BTCVal='';
  String ETHVal='';
  String LTCVal='';
  bool isWaiting=true;

  DropdownButton<String> getDropDown(){
    List <DropdownMenuItem<String>> dropdownItems=[];
    for(var currency in currenciesList){
      var newItem=DropdownMenuItem<String>(
        value: currency,
        child: Text(currency),
      );
      dropdownItems.add(newItem);
    }
    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropdownItems,
      onChanged:(newVal) async{
        setState(()  {
          selectedCurrency=newVal;
        });
        getData();
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Center(child: Text('Crypto Market'))),
        body: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CryptoCard(text:isWaiting?'fetching Data...':'BTC=$BTCVal $selectedCurrency'),
                CryptoCard(text:isWaiting?'fetching Data...':'ETH=$ETHVal $selectedCurrency'),
                CryptoCard(text:isWaiting?'fetching Data...':'LTC=$LTCVal $selectedCurrency'),
              ],
            ),
            Container(
              alignment: Alignment.center,
              width:double.infinity,
              padding: EdgeInsets.only(bottom: 30.0),
              child:getDropDown(),
            )
          ],
        )));
  }
}
