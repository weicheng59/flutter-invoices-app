import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:invoice_app/invoices_pages/provider/invoices_model.dart';

import 'api_service.dart';

class InvoicesPagesData with ChangeNotifier {
  List<String> currencies = ['USD', 'EUR', 'MYR', 'CNY'];
  List<String> currenciesSymbols = ['\$', '\u20ac', 'RM', '\u00a5'];

  String get curCurrency => currencies[currencyFlag];

  String get curCurrencySymbol => currenciesSymbols[currencyFlag];

  /// 0 - usd, 1 - eur, 2 - myr, 3 - cny
  int currencyFlag = 0;

  double currencyConverRatio = 1;

  void refresh() {
    notifyListeners();
  }

  InvoicesPagesData() {
    processJson();
  }

  List<Invoice> invoices = [];

  processJson() async {
    var rawString = await loadAsset();
    var listOfInvoices = jsonDecode(rawString);
    for (var invoice in listOfInvoices) {
      invoices.add(Invoice.fromJson(invoice));
    }
    notifyListeners();
  }

  Future<String> loadAsset() async {
    return await rootBundle.loadString('assets/data.json');
  }

  Future<void> updateCurrencyConverRatio() async {
    if (curCurrency != 'USD') {
      currencyConverRatio =
          await ApiService().converPrice(curCurrency, 'USD', 1);
    } else {
      currencyConverRatio = 1;
    }
  }

  // add comma to amount
  String parseTotal(double amount, {bool showCurrency = true}) {
    String currencyTag = '';
    if (showCurrency) {
      currencyTag = '$curCurrencySymbol ';
    }
    return currencyTag +
        (amount * currencyConverRatio).toStringAsFixed(2).replaceAllMapped(
            RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
  }
}
