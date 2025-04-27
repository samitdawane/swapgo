class MasterJSONData {
  Data? data;

  MasterJSONData({this.data});

  MasterJSONData.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? fname;
  String? lname;
  String? mobileNo;
  String? password;
  String? email;
  String? dob;
  bool? isActive;
  bool? isProfileComplete;
  List<Personaldetails>? personaldetails;
  List<Avatarwithinterest>? avatarwithinterest;
  List<Reviewandrating>? reviewandrating;
  List<Transferdetails>? transferdetails;

  Data(
      {this.id,
        this.fname,
        this.lname,
        this.mobileNo,
        this.password,
        this.email,
        this.dob,
        this.isActive,
        this.isProfileComplete,
        this.personaldetails,
        this.avatarwithinterest,
        this.reviewandrating,
        this.transferdetails});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fname = json['fname'];
    lname = json['lname'];
    mobileNo = json['mobileNo'];
    password = json['password'];
    email = json['email'];
    dob = json['dob'];
    isActive = json['isActive'];
    isProfileComplete = json['isProfileComplete'];
    if (json['personaldetails'] != null) {
      personaldetails = <Personaldetails>[];
      json['personaldetails'].forEach((v) {
        personaldetails!.add(new Personaldetails.fromJson(v));
      });
    }
    if (json['avatarwithinterest'] != null) {
      avatarwithinterest = <Avatarwithinterest>[];
      json['avatarwithinterest'].forEach((v) {
        avatarwithinterest!.add(new Avatarwithinterest.fromJson(v));
      });
    }
    if (json['reviewandrating'] != null) {
      reviewandrating = <Reviewandrating>[];
      json['reviewandrating'].forEach((v) {
        reviewandrating!.add(new Reviewandrating.fromJson(v));
      });
    }
    if (json['transferdetails'] != null) {
      transferdetails = <Transferdetails>[];
      json['transferdetails'].forEach((v) {
        transferdetails!.add(new Transferdetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fname'] = this.fname;
    data['lname'] = this.lname;
    data['mobileNo'] = this.mobileNo;
    data['password'] = this.password;
    data['email'] = this.email;
    data['dob'] = this.dob;
    data['isActive'] = this.isActive;
    data['isProfileComplete'] = this.isProfileComplete;
    if (this.personaldetails != null) {
      data['personaldetails'] =
          this.personaldetails!.map((v) => v.toJson()).toList();
    }
    if (this.avatarwithinterest != null) {
      data['avatarwithinterest'] =
          this.avatarwithinterest!.map((v) => v.toJson()).toList();
    }
    if (this.reviewandrating != null) {
      data['reviewandrating'] =
          this.reviewandrating!.map((v) => v.toJson()).toList();
    }
    if (this.transferdetails != null) {
      data['transferdetails'] =
          this.transferdetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Personaldetails {
  String? occupation;
  String? skillowned;
  String? experience;
  String? worlink;
  String? description;
  String? achievements;

  Personaldetails(
      {this.occupation,
        this.skillowned,
        this.experience,
        this.worlink,
        this.description,
        this.achievements});

  Personaldetails.fromJson(Map<String, dynamic> json) {
    occupation = json['occupation'];
    skillowned = json['skillowned'];
    experience = json['experience'];
    worlink = json['worlink'];
    description = json['description'];
    achievements = json['achievements'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['occupation'] = this.occupation;
    data['skillowned'] = this.skillowned;
    data['experience'] = this.experience;
    data['worlink'] = this.worlink;
    data['description'] = this.description;
    data['achievements'] = this.achievements;
    return data;
  }
}

class Avatarwithinterest {
  String? imgLink;
  String? interest;

  Avatarwithinterest({this.imgLink, this.interest});

  Avatarwithinterest.fromJson(Map<String, dynamic> json) {
    imgLink = json['ImgLink'];
    interest = json['interest'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ImgLink'] = this.imgLink;
    data['interest'] = this.interest;
    return data;
  }
}

class Reviewandrating {
  String? likes;
  String? rating;
  String? swap;
  String? comments;
  String? balancecoins;

  Reviewandrating(
      {this.likes, this.rating, this.swap, this.comments, this.balancecoins});

  Reviewandrating.fromJson(Map<String, dynamic> json) {
    likes = json['likes'];
    rating = json['rating'];
    swap = json['swap'];
    comments = json['comments'];
    balancecoins = json['balancecoins'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['likes'] = this.likes;
    data['rating'] = this.rating;
    data['swap'] = this.swap;
    data['comments'] = this.comments;
    data['balancecoins'] = this.balancecoins;
    return data;
  }
}

class Transferdetails {
  String? usertype;
  String? swaptype;
  String? swapbuddyid;
  String? schaduledate;
  String? requestaccaptance;
  String? isuser1xfer;
  String? isuser2xfer;
  String? coinsspent;

  Transferdetails(
      {this.usertype,
        this.swaptype,
        this.swapbuddyid,
        this.schaduledate,
        this.requestaccaptance,
        this.isuser1xfer,
        this.isuser2xfer,
        this.coinsspent});

  Transferdetails.fromJson(Map<String, dynamic> json) {
    usertype = json['usertype'];
    swaptype = json['swaptype'];
    swapbuddyid = json['swapbuddyid'];
    schaduledate = json['schaduledate'];
    requestaccaptance = json['requestaccaptance'];
    isuser1xfer = json['isuser1xfer'];
    isuser2xfer = json['isuser2xfer'];
    coinsspent = json['coinsspent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['usertype'] = this.usertype;
    data['swaptype'] = this.swaptype;
    data['swapbuddyid'] = this.swapbuddyid;
    data['schaduledate'] = this.schaduledate;
    data['requestaccaptance'] = this.requestaccaptance;
    data['isuser1xfer'] = this.isuser1xfer;
    data['isuser2xfer'] = this.isuser2xfer;
    data['coinsspent'] = this.coinsspent;
    return data;
  }
}