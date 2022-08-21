import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:invoice_app/invoices_pages/provider/invoices_model.dart';

class InvoicesPagesData with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  /// 0 - euro, 1 - usd
  int currencyFlag = 0;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }

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
}
