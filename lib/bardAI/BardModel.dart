
class BardModel {
  String? system;
  String? message;

  BardModel({this.system, this.message});

  BardModel.fromJson(Map<String, dynamic> json) {
    if(json["system"] is String) {
      system = json["system"];
    }
    if(json["message"] is String) {
      message = json["message"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["system"] = system;
    _data["message"] = message;
    return _data;
  }
}