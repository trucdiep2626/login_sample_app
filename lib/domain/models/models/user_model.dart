class UserModel {
  UserModel({
    this.id,
    this.name,
    this.firstname,
    this.lastname,
    this.username,
    this.email,
    this.emailsub,
    this.createdAt,
    this.updatedAt,
    this.jobtype,
    this.companyname,
    this.tradingname,
    this.companyweb,
    this.licensenumber,
    this.companyregistration,
    this.consortium,
    this.street,
    this.postcode,
    this.city,
    this.country,
    this.ifother,
    this.state,
    this.phone,
    this.fax,
    this.datebirth,
    this.gender,
    this.interests,
    this.status,
    this.secondName,
    this.phoneopt,
    this.emailopt,
    this.websiteopt,
    this.messenger,
    this.messegeropt,
    this.source,
    this.description,
    this.comment,
    this.photo,
    this.availablecheck,
    this.markcheck,
    this.typejob,
    this.salutation,
    this.contacttype,
    this.company,
    this.companycontact,
    this.usercreate,
    this.deleteview,
    this.department,
    this.postIsBusiness,
    this.countryPost,
    this.streetPost,
    this.cityPost,
    this.statePost,
    this.postcodePost,
    this.medical,
    this.bedding,
    this.emergency,
    this.bookingform,
    this.files,
    this.frequentFlyerNumber,
    this.onlinePortalAccess,
    this.phoneCountryCode,
    this.emergencyCountryCode,
    this.emergencyContactName,
    this.title,
    this.subWebsite,
    this.contactOf,
    this.teamLeadId,
    this.nationality,
    this.saleTargetWeek,
    this.saleTargetMonth,
    this.saleTargetQuarter,
    this.isInvestor,
    this.specialAssistance,
    this.dietaryRequest,
    this.emergencyRelationship,
    this.emergencyEmail,
    this.declarationName,
    this.declarationSignature,
    this.declarationDate,
  });

  final int? id;
  final String? name;
  final String? firstname;
  final String? lastname;
  final dynamic username;
  final String? email;
  final dynamic emailsub;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic jobtype;
  final dynamic companyname;
  final dynamic tradingname;
  final dynamic companyweb;
  final dynamic licensenumber;
  final dynamic companyregistration;
  final dynamic consortium;
  final dynamic street;
  final dynamic postcode;
  final dynamic city;
  final String? country;
  final dynamic ifother;
  final dynamic state;
  final String? phone;
  final dynamic fax;
  final String? datebirth;
  final dynamic gender;
  final dynamic interests;
  final dynamic status;
  final dynamic secondName;
  final dynamic phoneopt;
  final dynamic emailopt;
  final dynamic websiteopt;
  final dynamic messenger;
  final dynamic messegeropt;
  final dynamic source;
  final dynamic description;
  final dynamic comment;
  final String? photo;
  final dynamic availablecheck;
  final dynamic markcheck;
  final dynamic typejob;
  final String? salutation;
  final int? contacttype;
  final dynamic company;
  final dynamic companycontact;
  final dynamic usercreate;
  final int? deleteview;
  final dynamic department;
  final int? postIsBusiness;
  final dynamic countryPost;
  final dynamic streetPost;
  final dynamic cityPost;
  final dynamic statePost;
  final dynamic postcodePost;
  final String? medical;
  final String? bedding;
  final String? emergency;
  final dynamic bookingform;
  final dynamic files;
  final dynamic frequentFlyerNumber;
  final dynamic onlinePortalAccess;
  final String? phoneCountryCode;
  final String? emergencyCountryCode;
  final String? emergencyContactName;
  final dynamic title;
  final dynamic subWebsite;
  final dynamic contactOf;
  final dynamic teamLeadId;
  final String? nationality;
  final int? saleTargetWeek;
  final int? saleTargetMonth;
  final int? saleTargetQuarter;
  final dynamic isInvestor;
  final dynamic specialAssistance;
  final dynamic dietaryRequest;
  final dynamic emergencyRelationship;
  final dynamic emergencyEmail;
  final dynamic declarationName;
  final dynamic declarationSignature;
  final dynamic declarationDate;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      name: json["name"],
      firstname: json["firstname"],
      lastname: json["lastname"],
      username: json["username"],
      email: json["email"],
      emailsub: json["emailsub"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      jobtype: json["jobtype"],
      companyname: json["companyname"],
      tradingname: json["tradingname"],
      companyweb: json["companyweb"],
      licensenumber: json["licensenumber"],
      companyregistration: json["companyregistration"],
      consortium: json["consortium"],
      street: json["street"],
      postcode: json["postcode"],
      city: json["city"],
      country: json["country"],
      ifother: json["Ifother"],
      state: json["state"],
      phone: json["phone"],
      fax: json["fax"],
      datebirth: json["datebirth"],
      gender: json["gender"],
      interests: json["interests"],
      status: json["status"],
      secondName: json["SecondName"],
      phoneopt: json["phoneopt"],
      emailopt: json["emailopt"],
      websiteopt: json["websiteopt"],
      messenger: json["messenger"],
      messegeropt: json["messegeropt"],
      source: json["source"],
      description: json["Description"],
      comment: json["comment"],
      photo: json["photo"],
      availablecheck: json["Availablecheck"],
      markcheck: json["Markcheck"],
      typejob: json["typejob"],
      salutation: json["Salutation"],
      contacttype: json["Contacttype"],
      company: json["company"],
      companycontact: json["companycontact"],
      usercreate: json["usercreate"],
      deleteview: json["deleteview"],
      department: json["department"],
      postIsBusiness: json["post_is_business"],
      countryPost: json["country_post"],
      streetPost: json["street_post"],
      cityPost: json["city_post"],
      statePost: json["state_post"],
      postcodePost: json["postcode_post"],
      medical: json["medical"],
      bedding: json["bedding"],
      emergency: json["emergency"],
      bookingform: json["bookingform"],
      files: json["files"],
      frequentFlyerNumber: json["frequent_flyer_number"],
      onlinePortalAccess: json["online_portal_access"],
      phoneCountryCode: json["phone_country_code"],
      emergencyCountryCode: json["emergency_country_code"],
      emergencyContactName: json["emergency_contact_name"],
      title: json["title"],
      subWebsite: json["sub_website"],
      contactOf: json["contactOf"],
      teamLeadId: json["team_lead_id"],
      nationality: json["nationality"],
      saleTargetWeek: json["sale_target_week"],
      saleTargetMonth: json["sale_target_month"],
      saleTargetQuarter: json["sale_target_quarter"],
      isInvestor: json["is_investor"],
      specialAssistance: json["special_assistance"],
      dietaryRequest: json["dietary_request"],
      emergencyRelationship: json["emergency_relationship"],
      emergencyEmail: json["emergency_email"],
      declarationName: json["declaration_name"],
      declarationSignature: json["declaration_signature"],
      declarationDate: json["declaration_date"],
    );
  }
}
