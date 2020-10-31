import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:razorpay_flutter/razorpay_flutter.dart';

import 'package:fluttertoast/fluttertoast.dart';

class Payment extends StatefulWidget {
  int amount;
  Payment(this.amount);

  @override
  _PaymentState createState() => _PaymentState(amount);
}

class _PaymentState extends State<Payment> {
  static const platform = const MethodChannel("razorpay_flutter");
  int amount;
  _PaymentState(this.amount);

  Razorpay _razorpay;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Confirmation'),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Proceed to checkout"),
                  RaisedButton(onPressed: openCheckout, child: Text('Okay')),
                  RaisedButton(onPressed: () => Navigator.pop(context), child: Text('Cancel'))
                ])),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_1DP5mmOlF5G5ag',
      'amount': amount,
      'name': 'Lucian Danescu',
      'description': 'Shopping cart',
      'prefill': {'contact': '0735783680', 'email': 'lucidanescu28@yahoo.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e);
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
      msg: "SUCCESS: " + response.paymentId, );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
      msg: "ERROR: " + response.code.toString() + " - " + response.message,);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
      msg: "EXTERNAL_WALLET: " + response.walletName, );
  }
}