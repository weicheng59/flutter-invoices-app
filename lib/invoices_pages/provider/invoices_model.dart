import 'dart:convert';

T? asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }
  return null;
}

class Invoice {
  Invoice({
    required this.id,
    required this.createdat,
    required this.paymentdue,
    required this.description,
    required this.paymentterms,
    required this.clientname,
    required this.clientemail,
    required this.status,
    required this.senderaddress,
    required this.clientaddress,
    required this.items,
    required this.total,
  });

  factory Invoice.fromJson(Map<String, dynamic> json) {
    final List<Items>? items = json['items'] is List ? <Items>[] : null;
    if (items != null) {
      for (final dynamic item in json['items']!) {
        if (item != null) {
          items.add(Items.fromJson(asT<Map<String, dynamic>>(item)!));
        }
      }
    }
    return Invoice(
      id: asT<String>(json['id'])!,
      createdat: asT<String>(json['createdAt'])!,
      paymentdue: asT<String>(json['paymentDue'])!,
      description: asT<String>(json['description'])!,
      paymentterms: asT<int>(json['paymentTerms'])!,
      clientname: asT<String>(json['clientName'])!,
      clientemail: asT<String>(json['clientEmail'])!,
      status: asT<String>(json['status'])!,
      senderaddress: Senderaddress.fromJson(
          asT<Map<String, dynamic>>(json['senderAddress'])!),
      clientaddress: Clientaddress.fromJson(
          asT<Map<String, dynamic>>(json['clientAddress'])!),
      items: items!,
      total: asT<double>(json['total'])!,
    );
  }

  String id;
  String createdat;
  String paymentdue;
  String description;
  int paymentterms;
  String clientname;
  String clientemail;
  String status;
  Senderaddress senderaddress;
  Clientaddress clientaddress;
  List<Items> items;
  double total;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'createdAt': createdat,
        'paymentDue': paymentdue,
        'description': description,
        'paymentTerms': paymentterms,
        'clientName': clientname,
        'clientEmail': clientemail,
        'status': status,
        'senderAddress': senderaddress,
        'clientAddress': clientaddress,
        'items': items,
        'total': total,
      };
}

class Senderaddress {
  Senderaddress({
    required this.street,
    required this.city,
    required this.postcode,
    required this.country,
  });

  factory Senderaddress.fromJson(Map<String, dynamic> json) => Senderaddress(
        street: asT<String>(json['street'])!,
        city: asT<String>(json['city'])!,
        postcode: asT<String>(json['postCode'])!,
        country: asT<String>(json['country'])!,
      );

  String street;
  String city;
  String postcode;
  String country;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'street': street,
        'city': city,
        'postCode': postcode,
        'country': country,
      };
}

class Clientaddress {
  Clientaddress({
    required this.street,
    required this.city,
    required this.postcode,
    required this.country,
  });

  factory Clientaddress.fromJson(Map<String, dynamic> json) => Clientaddress(
        street: asT<String>(json['street'])!,
        city: asT<String>(json['city'])!,
        postcode: asT<String>(json['postCode'])!,
        country: asT<String>(json['country'])!,
      );

  String street;
  String city;
  String postcode;
  String country;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'street': street,
        'city': city,
        'postCode': postcode,
        'country': country,
      };
}

class Items {
  Items({
    required this.name,
    required this.quantity,
    required this.price,
    required this.total,
  });

  factory Items.fromJson(Map<String, dynamic> json) => Items(
        name: asT<String>(json['name'])!,
        quantity: asT<int>(json['quantity'])!,
        price: asT<double>(json['price'])!,
        total: asT<double>(json['total'])!,
      );

  String name;
  int quantity;
  double price;
  double total;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'quantity': quantity,
        'price': price,
        'total': total,
      };
}

class InvoicesRouteArguments {
  int index;
  bool isCreatingNew;

  InvoicesRouteArguments({
    required this.index,
    required this.isCreatingNew,
  });
}
