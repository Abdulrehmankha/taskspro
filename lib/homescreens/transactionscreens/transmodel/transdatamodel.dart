class TransactionsModel {
  String? date;
  String? amount;
  String? type;
  String? currencyCode;
  String? iban;
  String? description;
  String? bic;
  String? id;

  TransactionsModel({
    this.date,
    this.amount,
    this.type,
    this.currencyCode,
    this.iban,
    this.description,
    this.bic,
    this.id,
  });

  TransactionsModel.fromJson(Map<String, dynamic> json) {
    date = json['date'] as String?;
    amount = json['amount'] as String?;
    type = json['type'] as String?;
    currencyCode = json['currencyCode'] as String?;
    iban = json['iban'] as String?;
    description = json['description'] as String?;
    bic = json['bic'] as String?;
    id = json['id'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['date'] = date;
    json['amount'] = amount;
    json['type'] = type;
    json['currencyCode'] = currencyCode;
    json['iban'] = iban;
    json['description'] = description;
    json['bic'] = bic;
    json['id'] = id;
    return json;
  }
}