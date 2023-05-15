class Profile {
  Profile({
    required this.message,
    required this.content,
  });
  late final String message;
  late final Content content;

  Profile.fromJson(Map<String, dynamic> json){
    message = json['message']??"";
    content = Content.fromJson(json['content']??"");
  }
}

class Content {
  Content({
    required this.customer,
  });
  late final Customer customer;

  Content.fromJson(Map<String, dynamic> json){
    customer = Customer.fromJson(json['customer']??"");
  }
}

class Customer {
  Customer({
    required this.cuId,
    required this.cuName,
    required this.cuEmail,
    required this.cuGender,
    required this.cuRole,
    required this.cuCreatedOn,
  });
  late final int cuId;
  late final String cuName;
  late final String cuEmail;
  late final String cuGender;
  late final String cuRole;
  late final String cuCreatedOn;

  Customer.fromJson(Map<String, dynamic> json){
    cuId = json['cu_id']??"";
    cuName = json['cu_name']??"";
    cuEmail = json['cu_email']??"";
    cuGender = json['cu_gender']??"";
    cuRole = json['cu_role']??"";
    cuCreatedOn = json['cu_created_on']??"";
  }
}