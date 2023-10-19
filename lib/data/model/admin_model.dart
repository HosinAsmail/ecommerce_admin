class AdminModel {
  String? adminId;
  String? adminEmail;
  String? adminName;
  String? adminPhone;

  AdminModel({this.adminId, this.adminEmail, this.adminName, this.adminPhone});

  AdminModel.fromJson(Map<String, dynamic> json) {
    adminId = json['admin_id'];
    adminEmail = json['admin_email'];
    adminName = json['admin_name'];
    adminPhone = json['admin_phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['admin_id'] = this.adminId;
    data['admin_email'] = this.adminEmail;
    data['admin_name'] = this.adminName;
    data['admin_phone'] = this.adminPhone;
    return data;
  }
    // Singleton pattern implementation
  static AdminModel? _instance;

  static AdminModel get instance {
    return _instance!;
  }

  static bool get isInitialized => _instance != null;

  static Future<void> init(dynamic data) async {
    if (_instance != null) {
      throw Exception("AdminModel is already initialized.");
    }
    var jsonDateBase = data[0];
    _instance = AdminModel(
      adminEmail: jsonDateBase['admin_email'],
      adminId: jsonDateBase['admin_id'],
      adminPhone: jsonDateBase['admin_phone'],
      adminName: jsonDateBase['admin_name'],
    );
  }

}