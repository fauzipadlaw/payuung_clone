class Profile {
  final int? id;
  final String? fullname;
  final String? dob;
  final String? sex;
  final String? email;
  final String? hp;
  final String? education;
  final String? maritalStatus;
  final String? nik;
  final String? ktpImage;
  final String? address;
  final String? province;
  final String? city;
  final String? distric;
  final String? kelurahan;
  final int? postalCode;
  final String? domicileAddress;
  final String? domicileProvince;
  final String? domicileCity;
  final String? domicileDistric;
  final String? domicileKelurahan;
  final String? domicilePostalCode;
  final String? company;
  final String? companyAddress;
  final String? position;
  final String? workDuration;
  final String? sourceIncome;
  final String? bankName;
  final String? bankBranch;
  final String? accountNumber;
  final String? accountHolder;

  Profile({
    this.id,
    this.fullname,
    this.dob,
    this.sex,
    this.email,
    this.hp,
    this.education,
    this.maritalStatus,
    this.nik,
    this.ktpImage,
    this.address,
    this.province,
    this.city,
    this.distric,
    this.kelurahan,
    this.postalCode,
    this.domicileAddress,
    this.domicileProvince,
    this.domicileCity,
    this.domicileDistric,
    this.domicileKelurahan,
    this.domicilePostalCode,
    this.company,
    this.companyAddress,
    this.position,
    this.workDuration,
    this.sourceIncome,
    this.bankName,
    this.bankBranch,
    this.accountNumber,
    this.accountHolder,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'],
      fullname: json['fullname'],
      dob: json['dob'],
      sex: json['sex'],
      email: json['email'],
      hp: json['hp'],
      education: json['education'],
      maritalStatus: json['marital_status'],
      nik: json['nik'],
      ktpImage: json['ktp_image'],
      address: json['address'],
      province: json['province'],
      city: json['city'],
      distric: json['distric'],
      kelurahan: json['kelurahan'],
      postalCode: json['postal_code'],
      domicileAddress: json['domicile_address'],
      domicileProvince: json['domicile_province'],
      domicileCity: json['domicile_city'],
      domicileDistric: json['domicile_city'],
      domicileKelurahan: json['domicile_kelurahan'],
      domicilePostalCode: json['domicile_postal_code'],
      company: json['company'],
      companyAddress: json['company_address'],
      position: json['position'],
      workDuration: json['work_duration'],
      sourceIncome: json['source_income'],
      bankName: json['bank_name'],
      bankBranch: json['bank_branch'],
      accountNumber: json['account_number'],
      accountHolder: json['account_holder'],
    );
  }
}
