import 'dart:convert';

 List<SanctionModel> userFromJson(String str) => List<SanctionModel>.from(json.decode(str).map((x) => SanctionModel.fromJson(x)));

/*
 class SanctionModel
  {
  String? schemeCode;
  String? stateCode;
  String? agencyUniqueCode;
  String? financialYear;
  String? sanctionNo;
  String? transactionId;
  String? sanctionDate;
  double? sanctionAmount;
  String? controllerName;
  String? grantNo;
  String? functionHead;
  String? objectHead;
  String? aPIResponseStatus;

  SanctionModel(
      {this.schemeCode,
        this.stateCode,
        this.agencyUniqueCode,
        this.financialYear,
        this.sanctionNo,
        this.transactionId,
        this.sanctionDate,
        this.sanctionAmount,
        this.controllerName,
        this.grantNo,
        this.functionHead,
        this.objectHead,
        this.aPIResponseStatus});

  SanctionModel.fromJson(Map<String, dynamic> json) {
    schemeCode = json['SchemeCode'];
    stateCode = json['StateCode'];
    agencyUniqueCode = json['AgencyUniqueCode'];
    financialYear = json['FinancialYear'];
    sanctionNo = json['SanctionNo'];
    transactionId = json['TransactionId'];
    sanctionDate = json['SanctionDate'];
    sanctionAmount = json['SanctionAmount'];
    controllerName = json['ControllerName'];
    grantNo = json['GrantNo'];
    functionHead = json['FunctionHead'];
    objectHead = json['ObjectHead'];
    aPIResponseStatus = json['APIResponseStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SchemeCode'] = this.schemeCode;
    data['StateCode'] = this.stateCode;
    data['AgencyUniqueCode'] = this.agencyUniqueCode;
    data['FinancialYear'] = this.financialYear;
    data['SanctionNo'] = this.sanctionNo;
    data['TransactionId'] = this.transactionId;
    data['SanctionDate'] = this.sanctionDate;
    data['SanctionAmount'] = this.sanctionAmount;
    data['ControllerName'] = this.controllerName;
    data['GrantNo'] = this.grantNo;
    data['FunctionHead'] = this.functionHead;
    data['ObjectHead'] = this.objectHead;
    data['APIResponseStatus'] = this.aPIResponseStatus;
    return data;
  }

 }*/


class SanctionModel
{
 final String? schemeCode;
 final String? stateCode;
 final String? agencyUniqueCode;
 final String? financialYear;
  final String? sanctionNo;
 final String? transactionId;
 final String? sanctionDate;
 final double? sanctionAmount;
 final String? controllerName;
  final String? grantNo;
 final String? functionHead;
 final String? objectHead;
  final String? aPIResponseStatus;

  SanctionModel(
      {required this.schemeCode,
        required this.stateCode,
        required this.agencyUniqueCode,
       required this.financialYear,
        required this.sanctionNo,
        required this.transactionId,
        required this.sanctionDate,
       required this.sanctionAmount,
        required this.controllerName,
        required this.grantNo,
        required this.functionHead,
        required this.objectHead,
        required this.aPIResponseStatus});

  factory SanctionModel.fromJson(Map<String, dynamic> json) {
    return SanctionModel(    schemeCode :json['SchemeCode'],
    stateCode : json['StateCode'],
    agencyUniqueCode : json['AgencyUniqueCode'],
    financialYear : json['FinancialYear'],
    sanctionNo : json['SanctionNo'],
    transactionId : json['TransactionId'],
    sanctionDate : json['SanctionDate'],
    sanctionAmount : json['SanctionAmount'],
    controllerName : json['SontrollerName'],
    grantNo : json['GrantNo'],
    functionHead : json['FunctionHead'],
    objectHead : json['ObjectHead'],
    aPIResponseStatus : json['APIResponseStatus']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SchemeCode'] = this.schemeCode;
    data['StateCode'] = this.stateCode;
    data['AgencyUniqueCode'] = this.agencyUniqueCode;
    data['FinancialYear'] = this.financialYear;
    data['SanctionNo'] = this.sanctionNo;
    data['TransactionId'] = this.transactionId;
    data['SanctionDate'] = this.sanctionDate;
    data['SanctionAmount'] = this.sanctionAmount;
    data['ControllerName'] = this.controllerName;
    data['GrantNo'] = this.grantNo;
    data['FunctionHead'] = this.functionHead;
    data['ObjectHead'] = this.objectHead;
    data['APIResponseStatus'] = this.aPIResponseStatus;
    return data;
  }

}






