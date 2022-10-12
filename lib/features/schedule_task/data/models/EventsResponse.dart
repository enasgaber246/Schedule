import 'dart:convert';

/// id : 2872
/// title : "Weekend Yoga with Andrea"
/// description : "Join me for an energizing flow friday morning in front of the buej khalifa. Bring your mat, towel, and positive vibes!"
/// spots : 20
/// price : 0
/// lat : 25.18812
/// lon : 55.278182
/// placeName : "South Ridge Park, Dubai, Emirati Arabi Uniti"
/// featuredImage : "32c9da3c-1636280535812"
/// deeplink : ""
/// date : "2021-11-12T03:30:00.000Z"
/// tagId : 10
/// createdBy : 1277
/// communityId : 23
/// whatsapp_link : null
/// images : [{"url":"32c9da3c-1636280535812"}]
/// finish_date : "2021-11-14T03:30:00.000Z"
/// location_id : 2
/// cancelled_at : null
/// is_private : false
/// lockedAt : null
/// minimumMembers : null
/// paymentMethod : null
/// receiveUpdates : false
/// state : "finished"
/// isCheckedIn : true
/// isFeatured : false
/// viewersCount : 0
/// community : {"id":23,"title":"MeetnNamaste","image":"a60a74f2-1607843888394","bio":"A place where your mind meets your body and your body meets your mind🧘‍♀️","points":15,"rating_count":3,"connection_count":390,"event_count":115,"profile_picture":"23094b43-1607843888396","deeplink":"https://meetntrain.page.link/LZfG","link_expiry":"2021-08-20T12:24:31.781Z","state":"verified"}
/// users : [{"id":1277,"first_name":"andrea","last_name":"villa","email":null,"bio":null,"profile_picture":"122d1771-1612846595651","points":0,"mobile":"0557285137","country_code":null,"is_verified":false,"isTrusted":false},{"id":8685,"first_name":"sara","last_name":"salehi","email":null,"bio":null,"profile_picture":null,"points":0,"mobile":"0586353814","country_code":null,"is_verified":false,"isTrusted":false},{"id":8472,"first_name":"maryam","last_name":"akbarian","email":null,"bio":"","profile_picture":null,"points":0,"mobile":"0568777070","country_code":null,"is_verified":false,"isTrusted":false},{"id":8473,"first_name":"elnaz","last_name":"alizadeh","email":null,"bio":null,"profile_picture":null,"points":0,"mobile":"0543221367","country_code":null,"is_verified":false,"isTrusted":false},{"id":7064,"first_name":"Mia Margrethe","last_name":"Arquiza","email":null,"bio":"","profile_picture":"76079211-1631725349971","points":0,"mobile":"0552998198","country_code":null,"is_verified":false,"isTrusted":false},{"id":8735,"first_name":"Menna","last_name":"Magdy","email":null,"bio":null,"profile_picture":"e9a46e49-1636610478830","points":0,"mobile":null,"country_code":null,"is_verified":false,"isTrusted":false},{"id":8740,"first_name":"Aiste","last_name":"Zdanciute","email":null,"bio":null,"profile_picture":"5109a9be-1636615496374","points":0,"mobile":null,"country_code":null,"is_verified":false,"isTrusted":false},{"id":8745,"first_name":"Hana","last_name":"ElSherif","email":null,"bio":null,"profile_picture":"3f04290e-1636619771695","points":0,"mobile":null,"country_code":null,"is_verified":false,"isTrusted":false},{"id":6616,"first_name":"Nour","last_name":"Maarek","email":null,"bio":"","profile_picture":"a2f8e452-1630410624053","points":0,"mobile":"0524619991","country_code":null,"is_verified":false,"isTrusted":false},{"id":7288,"first_name":"Caroline","last_name":"Johansson","email":null,"bio":null,"profile_picture":null,"points":0,"mobile":"0547922880","country_code":null,"is_verified":false,"isTrusted":false},{"id":1828,"first_name":"Angel","last_name":"Jeremy ","email":null,"bio":null,"profile_picture":null,"points":0,"mobile":"0564549190","country_code":null,"is_verified":false,"isTrusted":false},{"id":8426,"first_name":"shirin","last_name":"mokhtar","email":null,"bio":null,"profile_picture":null,"points":0,"mobile":"0559215883","country_code":null,"is_verified":false,"isTrusted":false},{"id":8760,"first_name":"Flora","last_name":"Dautheuil","email":null,"bio":null,"profile_picture":"743ccf9f-1636634876552","points":0,"mobile":null,"country_code":null,"is_verified":false,"isTrusted":false},{"id":667,"first_name":"Nadia","last_name":"Kanan","email":null,"bio":"","profile_picture":"a94d87c9-1610903259419","points":0,"mobile":"0000000000","country_code":null,"is_verified":false,"isTrusted":false},{"id":8761,"first_name":"Mutassem","last_name":"Olimat","email":null,"bio":null,"profile_picture":null,"points":0,"mobile":"0502240054","country_code":null,"is_verified":false,"isTrusted":false},{"id":4293,"first_name":"Rusul","last_name":"J","email":null,"bio":null,"profile_picture":"1d609638-1622480574807","points":0,"mobile":"0568958224","country_code":null,"is_verified":false,"isTrusted":false}]
/// tag : {"id":10,"title":"Yoga","icon":"yoga_icon.png"}
/// isWaiting : false
/// isJoined : false
/// joinedUsersCount : 16
/// checkedInCount : 5
/// paidAmount : 0
/// ownerEarnings : 0

EventsResponse eventsResponseFromJson(String str) =>
    EventsResponse.fromJson(json.decode(str));

String eventsResponseToJson(EventsResponse data) => json.encode(data.toJson());

class EventsResponse {
  EventsResponse({
    num? id,
    String? title,
    String? description,
    num? spots,
    num? price,
    num? lat,
    num? lon,
    String? placeName,
    String? featuredImage,
    String? deeplink,
    String? date,
    num? tagId,
    num? createdBy,
    num? communityId,
    dynamic whatsappLink,
    List<Images>? images,
    String? finishDate,
    num? locationId,
    dynamic cancelledAt,
    bool? isPrivate,
    dynamic lockedAt,
    dynamic minimumMembers,
    dynamic paymentMethod,
    bool? receiveUpdates,
    String? state,
    bool? isCheckedIn,
    bool? isFeatured,
    num? viewersCount,
    Community? community,
    List<Users>? users,
    Tag? tag,
    bool? isWaiting,
    bool? isJoined,
    num? joinedUsersCount,
    num? checkedInCount,
    num? paidAmount,
    num? ownerEarnings,
  }) {
    _id = id;
    _title = title;
    _description = description;
    _spots = spots;
    _price = price;
    _lat = lat;
    _lon = lon;
    _placeName = placeName;
    _featuredImage = featuredImage;
    _deeplink = deeplink;
    _date = date;
    _tagId = tagId;
    _createdBy = createdBy;
    _communityId = communityId;
    _whatsappLink = whatsappLink;
    _images = images;
    _finishDate = finishDate;
    _locationId = locationId;
    _cancelledAt = cancelledAt;
    _isPrivate = isPrivate;
    _lockedAt = lockedAt;
    _minimumMembers = minimumMembers;
    _paymentMethod = paymentMethod;
    _receiveUpdates = receiveUpdates;
    _state = state;
    _isCheckedIn = isCheckedIn;
    _isFeatured = isFeatured;
    _viewersCount = viewersCount;
    _community = community;
    _users = users;
    _tag = tag;
    _isWaiting = isWaiting;
    _isJoined = isJoined;
    _joinedUsersCount = joinedUsersCount;
    _checkedInCount = checkedInCount;
    _paidAmount = paidAmount;
    _ownerEarnings = ownerEarnings;
  }

  EventsResponse.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _description = json['description'];
    _spots = json['spots'];
    _price = json['price'];
    _lat = json['lat'];
    _lon = json['lon'];
    _placeName = json['placeName'];
    _featuredImage = json['featuredImage'];
    _deeplink = json['deeplink'];
    _date = json['date'];
    _tagId = json['tagId'];
    _createdBy = json['createdBy'];
    _communityId = json['communityId'];
    _whatsappLink = json['whatsapp_link'];
    if (json['images'] != null) {
      _images = [];
      json['images'].forEach((v) {
        _images?.add(Images.fromJson(v));
      });
    }
    _finishDate = json['finish_date'];
    _locationId = json['location_id'];
    _cancelledAt = json['cancelled_at'];
    _isPrivate = json['is_private'];
    _lockedAt = json['lockedAt'];
    _minimumMembers = json['minimumMembers'];
    _paymentMethod = json['paymentMethod'];
    _receiveUpdates = json['receiveUpdates'];
    _state = json['state'];
    _isCheckedIn = json['isCheckedIn'];
    _isFeatured = json['isFeatured'];
    _viewersCount = json['viewersCount'];
    _community = json['community'] != null
        ? Community.fromJson(json['community'])
        : null;
    if (json['users'] != null) {
      _users = [];
      json['users'].forEach((v) {
        _users?.add(Users.fromJson(v));
      });
    }
    _tag = json['tag'] != null ? Tag.fromJson(json['tag']) : null;
    _isWaiting = json['isWaiting'];
    _isJoined = json['isJoined'];
    _joinedUsersCount = json['joinedUsersCount'];
    _checkedInCount = json['checkedInCount'];
    _paidAmount = json['paidAmount'];
    _ownerEarnings = json['ownerEarnings'];
  }

  num? _id;
  String? _title;
  String? _description;
  num? _spots;
  num? _price;
  num? _lat;
  num? _lon;
  String? _placeName;
  String? _featuredImage;
  String? _deeplink;
  String? _date;
  num? _tagId;
  num? _createdBy;
  num? _communityId;
  dynamic _whatsappLink;
  List<Images>? _images;
  String? _finishDate;
  num? _locationId;
  dynamic _cancelledAt;
  bool? _isPrivate;
  dynamic _lockedAt;
  dynamic _minimumMembers;
  dynamic _paymentMethod;
  bool? _receiveUpdates;
  String? _state;
  bool? _isCheckedIn;
  bool? _isFeatured;
  num? _viewersCount;
  Community? _community;
  List<Users>? _users;
  Tag? _tag;
  bool? _isWaiting;
  bool? _isJoined;
  num? _joinedUsersCount;
  num? _checkedInCount;
  num? _paidAmount;
  num? _ownerEarnings;

  EventsResponse copyWith({
    num? id,
    String? title,
    String? description,
    num? spots,
    num? price,
    num? lat,
    num? lon,
    String? placeName,
    String? featuredImage,
    String? deeplink,
    String? date,
    num? tagId,
    num? createdBy,
    num? communityId,
    dynamic whatsappLink,
    List<Images>? images,
    String? finishDate,
    num? locationId,
    dynamic cancelledAt,
    bool? isPrivate,
    dynamic lockedAt,
    dynamic minimumMembers,
    dynamic paymentMethod,
    bool? receiveUpdates,
    String? state,
    bool? isCheckedIn,
    bool? isFeatured,
    num? viewersCount,
    Community? community,
    List<Users>? users,
    Tag? tag,
    bool? isWaiting,
    bool? isJoined,
    num? joinedUsersCount,
    num? checkedInCount,
    num? paidAmount,
    num? ownerEarnings,
  }) =>
      EventsResponse(
        id: id ?? _id,
        title: title ?? _title,
        description: description ?? _description,
        spots: spots ?? _spots,
        price: price ?? _price,
        lat: lat ?? _lat,
        lon: lon ?? _lon,
        placeName: placeName ?? _placeName,
        featuredImage: featuredImage ?? _featuredImage,
        deeplink: deeplink ?? _deeplink,
        date: date ?? _date,
        tagId: tagId ?? _tagId,
        createdBy: createdBy ?? _createdBy,
        communityId: communityId ?? _communityId,
        whatsappLink: whatsappLink ?? _whatsappLink,
        images: images ?? _images,
        finishDate: finishDate ?? _finishDate,
        locationId: locationId ?? _locationId,
        cancelledAt: cancelledAt ?? _cancelledAt,
        isPrivate: isPrivate ?? _isPrivate,
        lockedAt: lockedAt ?? _lockedAt,
        minimumMembers: minimumMembers ?? _minimumMembers,
        paymentMethod: paymentMethod ?? _paymentMethod,
        receiveUpdates: receiveUpdates ?? _receiveUpdates,
        state: state ?? _state,
        isCheckedIn: isCheckedIn ?? _isCheckedIn,
        isFeatured: isFeatured ?? _isFeatured,
        viewersCount: viewersCount ?? _viewersCount,
        community: community ?? _community,
        users: users ?? _users,
        tag: tag ?? _tag,
        isWaiting: isWaiting ?? _isWaiting,
        isJoined: isJoined ?? _isJoined,
        joinedUsersCount: joinedUsersCount ?? _joinedUsersCount,
        checkedInCount: checkedInCount ?? _checkedInCount,
        paidAmount: paidAmount ?? _paidAmount,
        ownerEarnings: ownerEarnings ?? _ownerEarnings,
      );

  num? get id => _id;

  String? get title => _title;

  String? get description => _description;

  num? get spots => _spots;

  num? get price => _price;

  num? get lat => _lat;

  num? get lon => _lon;

  String? get placeName => _placeName;

  String? get featuredImage => _featuredImage;

  String? get deeplink => _deeplink;

  String? get date => _date;

  num? get tagId => _tagId;

  num? get createdBy => _createdBy;

  num? get communityId => _communityId;

  dynamic get whatsappLink => _whatsappLink;

  List<Images>? get images => _images;

  String? get finishDate => _finishDate;

  num? get locationId => _locationId;

  dynamic get cancelledAt => _cancelledAt;

  bool? get isPrivate => _isPrivate;

  dynamic get lockedAt => _lockedAt;

  dynamic get minimumMembers => _minimumMembers;

  dynamic get paymentMethod => _paymentMethod;

  bool? get receiveUpdates => _receiveUpdates;

  String? get state => _state;

  bool? get isCheckedIn => _isCheckedIn;

  bool? get isFeatured => _isFeatured;

  num? get viewersCount => _viewersCount;

  Community? get community => _community;

  List<Users>? get users => _users;

  Tag? get tag => _tag;

  bool? get isWaiting => _isWaiting;

  bool? get isJoined => _isJoined;

  num? get joinedUsersCount => _joinedUsersCount;

  num? get checkedInCount => _checkedInCount;

  num? get paidAmount => _paidAmount;

  num? get ownerEarnings => _ownerEarnings;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['description'] = _description;
    map['spots'] = _spots;
    map['price'] = _price;
    map['lat'] = _lat;
    map['lon'] = _lon;
    map['placeName'] = _placeName;
    map['featuredImage'] = _featuredImage;
    map['deeplink'] = _deeplink;
    map['date'] = _date;
    map['tagId'] = _tagId;
    map['createdBy'] = _createdBy;
    map['communityId'] = _communityId;
    map['whatsapp_link'] = _whatsappLink;
    if (_images != null) {
      map['images'] = _images?.map((v) => v.toJson()).toList();
    }
    map['finish_date'] = _finishDate;
    map['location_id'] = _locationId;
    map['cancelled_at'] = _cancelledAt;
    map['is_private'] = _isPrivate;
    map['lockedAt'] = _lockedAt;
    map['minimumMembers'] = _minimumMembers;
    map['paymentMethod'] = _paymentMethod;
    map['receiveUpdates'] = _receiveUpdates;
    map['state'] = _state;
    map['isCheckedIn'] = _isCheckedIn;
    map['isFeatured'] = _isFeatured;
    map['viewersCount'] = _viewersCount;
    if (_community != null) {
      map['community'] = _community?.toJson();
    }
    if (_users != null) {
      map['users'] = _users?.map((v) => v.toJson()).toList();
    }
    if (_tag != null) {
      map['tag'] = _tag?.toJson();
    }
    map['isWaiting'] = _isWaiting;
    map['isJoined'] = _isJoined;
    map['joinedUsersCount'] = _joinedUsersCount;
    map['checkedInCount'] = _checkedInCount;
    map['paidAmount'] = _paidAmount;
    map['ownerEarnings'] = _ownerEarnings;
    return map;
  }
}

/// id : 10
/// title : "Yoga"
/// icon : "yoga_icon.png"

Tag tagFromJson(String str) => Tag.fromJson(json.decode(str));

String tagToJson(Tag data) => json.encode(data.toJson());

class Tag {
  Tag({
    num? id,
    String? title,
    String? icon,
  }) {
    _id = id;
    _title = title;
    _icon = icon;
  }

  Tag.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _icon = json['icon'];
  }

  num? _id;
  String? _title;
  String? _icon;

  Tag copyWith({
    num? id,
    String? title,
    String? icon,
  }) =>
      Tag(
        id: id ?? _id,
        title: title ?? _title,
        icon: icon ?? _icon,
      );

  num? get id => _id;

  String? get title => _title;

  String? get icon => _icon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['icon'] = _icon;
    return map;
  }
}

/// id : 1277
/// first_name : "andrea"
/// last_name : "villa"
/// email : null
/// bio : null
/// profile_picture : "122d1771-1612846595651"
/// points : 0
/// mobile : "0557285137"
/// country_code : null
/// is_verified : false
/// isTrusted : false

Users usersFromJson(String str) => Users.fromJson(json.decode(str));

String usersToJson(Users data) => json.encode(data.toJson());

class Users {
  Users({
    num? id,
    String? firstName,
    String? lastName,
    dynamic email,
    dynamic bio,
    String? profilePicture,
    num? points,
    String? mobile,
    dynamic countryCode,
    bool? isVerified,
    bool? isTrusted,
  }) {
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _bio = bio;
    _profilePicture = profilePicture;
    _points = points;
    _mobile = mobile;
    _countryCode = countryCode;
    _isVerified = isVerified;
    _isTrusted = isTrusted;
  }

  Users.fromJson(dynamic json) {
    _id = json['id'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _email = json['email'];
    _bio = json['bio'];
    _profilePicture = json['profile_picture'];
    _points = json['points'];
    _mobile = json['mobile'];
    _countryCode = json['country_code'];
    _isVerified = json['is_verified'];
    _isTrusted = json['isTrusted'];
  }

  num? _id;
  String? _firstName;
  String? _lastName;
  dynamic _email;
  dynamic _bio;
  String? _profilePicture;
  num? _points;
  String? _mobile;
  dynamic _countryCode;
  bool? _isVerified;
  bool? _isTrusted;

  Users copyWith({
    num? id,
    String? firstName,
    String? lastName,
    dynamic email,
    dynamic bio,
    String? profilePicture,
    num? points,
    String? mobile,
    dynamic countryCode,
    bool? isVerified,
    bool? isTrusted,
  }) =>
      Users(
        id: id ?? _id,
        firstName: firstName ?? _firstName,
        lastName: lastName ?? _lastName,
        email: email ?? _email,
        bio: bio ?? _bio,
        profilePicture: profilePicture ?? _profilePicture,
        points: points ?? _points,
        mobile: mobile ?? _mobile,
        countryCode: countryCode ?? _countryCode,
        isVerified: isVerified ?? _isVerified,
        isTrusted: isTrusted ?? _isTrusted,
      );

  num? get id => _id;

  String? get firstName => _firstName;

  String? get lastName => _lastName;

  dynamic get email => _email;

  dynamic get bio => _bio;

  String? get profilePicture => _profilePicture;

  num? get points => _points;

  String? get mobile => _mobile;

  dynamic get countryCode => _countryCode;

  bool? get isVerified => _isVerified;

  bool? get isTrusted => _isTrusted;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['email'] = _email;
    map['bio'] = _bio;
    map['profile_picture'] = _profilePicture;
    map['points'] = _points;
    map['mobile'] = _mobile;
    map['country_code'] = _countryCode;
    map['is_verified'] = _isVerified;
    map['isTrusted'] = _isTrusted;
    return map;
  }
}

/// id : 23
/// title : "MeetnNamaste"
/// image : "a60a74f2-1607843888394"
/// bio : "A place where your mind meets your body and your body meets your mind🧘‍♀️"
/// points : 15
/// rating_count : 3
/// connection_count : 390
/// event_count : 115
/// profile_picture : "23094b43-1607843888396"
/// deeplink : "https://meetntrain.page.link/LZfG"
/// link_expiry : "2021-08-20T12:24:31.781Z"
/// state : "verified"

Community communityFromJson(String str) => Community.fromJson(json.decode(str));

String communityToJson(Community data) => json.encode(data.toJson());

class Community {
  Community({
    num? id,
    String? title,
    String? image,
    String? bio,
    num? points,
    num? ratingCount,
    num? connectionCount,
    num? eventCount,
    String? profilePicture,
    String? deeplink,
    String? linkExpiry,
    String? state,
  }) {
    _id = id;
    _title = title;
    _image = image;
    _bio = bio;
    _points = points;
    _ratingCount = ratingCount;
    _connectionCount = connectionCount;
    _eventCount = eventCount;
    _profilePicture = profilePicture;
    _deeplink = deeplink;
    _linkExpiry = linkExpiry;
    _state = state;
  }

  Community.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _image = json['image'];
    _bio = json['bio'];
    _points = json['points'];
    _ratingCount = json['rating_count'];
    _connectionCount = json['connection_count'];
    _eventCount = json['event_count'];
    _profilePicture = json['profile_picture'];
    _deeplink = json['deeplink'];
    _linkExpiry = json['link_expiry'];
    _state = json['state'];
  }

  num? _id;
  String? _title;
  String? _image;
  String? _bio;
  num? _points;
  num? _ratingCount;
  num? _connectionCount;
  num? _eventCount;
  String? _profilePicture;
  String? _deeplink;
  String? _linkExpiry;
  String? _state;

  Community copyWith({
    num? id,
    String? title,
    String? image,
    String? bio,
    num? points,
    num? ratingCount,
    num? connectionCount,
    num? eventCount,
    String? profilePicture,
    String? deeplink,
    String? linkExpiry,
    String? state,
  }) =>
      Community(
        id: id ?? _id,
        title: title ?? _title,
        image: image ?? _image,
        bio: bio ?? _bio,
        points: points ?? _points,
        ratingCount: ratingCount ?? _ratingCount,
        connectionCount: connectionCount ?? _connectionCount,
        eventCount: eventCount ?? _eventCount,
        profilePicture: profilePicture ?? _profilePicture,
        deeplink: deeplink ?? _deeplink,
        linkExpiry: linkExpiry ?? _linkExpiry,
        state: state ?? _state,
      );

  num? get id => _id;

  String? get title => _title;

  String? get image => _image;

  String? get bio => _bio;

  num? get points => _points;

  num? get ratingCount => _ratingCount;

  num? get connectionCount => _connectionCount;

  num? get eventCount => _eventCount;

  String? get profilePicture => _profilePicture;

  String? get deeplink => _deeplink;

  String? get linkExpiry => _linkExpiry;

  String? get state => _state;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['image'] = _image;
    map['bio'] = _bio;
    map['points'] = _points;
    map['rating_count'] = _ratingCount;
    map['connection_count'] = _connectionCount;
    map['event_count'] = _eventCount;
    map['profile_picture'] = _profilePicture;
    map['deeplink'] = _deeplink;
    map['link_expiry'] = _linkExpiry;
    map['state'] = _state;
    return map;
  }
}

/// url : "32c9da3c-1636280535812"

Images imagesFromJson(String str) => Images.fromJson(json.decode(str));

String imagesToJson(Images data) => json.encode(data.toJson());

class Images {
  Images({
    String? url,
  }) {
    _url = url;
  }

  Images.fromJson(dynamic json) {
    _url = json['url'];
  }

  String? _url;

  Images copyWith({
    String? url,
  }) =>
      Images(
        url: url ?? _url,
      );

  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = _url;
    return map;
  }
}
