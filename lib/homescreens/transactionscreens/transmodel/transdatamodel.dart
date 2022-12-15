class TransModel {
  TransModel(
    this.date,
    this.amount,
    this.type,
    this.currencyCode,
    this.iban,
    this.description,
    this.bic,
    this.id,
  );

  var date;
  String? amount;
  var type;
  String? currencyCode;
  String? iban;
  String? description;
  String? bic;
  String? id;

  // factory TransModel.fromJson(Map<String, dynamic> json) => TransModel(
  //   date: json["date"],
  //   amount: json["amount"],
  //   type: json["type"],
  //   currencyCode: json["currencyCode"],
  //   iban: json["iban"],
  //   description: json["description"],
  //   bic: json["bic"],
  //   id: json["id"],
  // );
  //
  // Map<String, dynamic> toJson() => {
  //   "date": date,
  //   "amount": amount,
  //   "type": type,
  //   "currencyCode": currencyCode,
  //   "iban": iban,
  //   "description": description,
  //   "bic": bic,
  //   "id": id,
  // };
}
