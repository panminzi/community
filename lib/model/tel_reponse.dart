class TelResponse {
  int? code;
  Result? result;
  String? msg;

  TelResponse({this.code, this.result, this.msg});

  TelResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    data['msg'] = this.msg;
    return data;
  }
}

class Result {
  String? name;
  String? postCode;
  String? prov;
  String? city;
  String? cityCode;
  int? num;
  String? provCode;
  String? areaCode;
  int? type;

  Result(
      {this.name,
      this.postCode,
      this.prov,
      this.city,
      this.cityCode,
      this.num,
      this.provCode,
      this.areaCode,
      this.type});

  Result.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    postCode = json['postCode'];
    prov = json['prov'];
    city = json['city'];
    cityCode = json['cityCode'];
    num = json['num'];
    provCode = json['provCode'];
    areaCode = json['areaCode'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['postCode'] = this.postCode;
    data['prov'] = this.prov;
    data['city'] = this.city;
    data['cityCode'] = this.cityCode;
    data['num'] = this.num;
    data['provCode'] = this.provCode;
    data['areaCode'] = this.areaCode;
    data['type'] = this.type;
    return data;
  }
}