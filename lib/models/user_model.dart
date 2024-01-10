/*    user template from "randomuser.me"   */

class UserModel {
  String? gender;
  Name? name;
  Location? location;
  String? email;
  Login? login;
  Dob? dob;
  Registered? registered;
  String? phone;
  String? cell;
  Id? id;
  Picture? picture;
  String? nat;

  UserModel(
      {this.gender,
      this.name,
      this.location,
      this.email,
      this.login,
      this.dob,
      this.registered,
      this.phone,
      this.cell,
      this.id,
      this.picture,
      this.nat});

  fromMap(Map<String, dynamic> map) {
    gender = map['gender'];
    name = map['name'] != null ? fromMap(map['name']) : null;
    location = map['location'] != null ? fromMap(map['location']) : null;
    email = map['email'];
    login = map['login'] != null ? fromMap(map['login']) : null;
    dob = map['dob'] != null ? fromMap(map['dob']) : null;
    registered = map['registered'] != null ? fromMap(map['registered']) : null;
    phone = map['phone'];
    cell = map['cell'];
    id = map['id'] != null ? fromMap(map['id']) : null;
    picture = map['picture'] != null ? fromMap(map['picture']) : null;
    nat = map['nat'];
  }

  Map<String, dynamic> toMap() {
    return {
      'gender': gender,
      'name': name!.toMap(),
      'location': location!.toMap(),
      'email': email,
      'login': login!.toMap(),
      'dob': dob!.toMap(),
      'registered': registered!.toMap(),
      'phone': phone,
      'cell': cell,
      'id': id!.toMap(),
      'picture': picture!.toMap(),
      'nat': nat,
    };
  }
}

class Coordinates {
  String? latitude;
  String? longitude;

  Coordinates({this.latitude, this.longitude});

  fromMap(Map<String, dynamic> map) {
    latitude = map['latitude'];
    longitude = map['longitude'];
  }

  Map<String, dynamic> toMap() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}

class Dob {
  DateTime? date;
  int? age;

  Dob({this.date, this.age});

  Dob.fromMap(Map<String, dynamic> map) {
    date = map['date'];
    age = map['age'];
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'age': age,
    };
  }
}

class Id {
  String? name;
  String? value;

  Id({this.name, this.value});

  fromMap(Map<String, dynamic> map) {
    name = map['name'];
    value = map['value'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'value': value,
    };
  }
}

class Location {
  Street? street;
  String? city;
  String? state;
  String? country;
  String? postcode;
  Coordinates? coordinates;
  Timezone? timezone;

  Location(
      {this.street,
      this.city,
      this.state,
      this.country,
      this.postcode,
      this.coordinates,
      this.timezone});

  fromMap(Map<String, dynamic> map) {
    street = map['street'] != null ? fromMap(map['street']) : null;
    city = map['city'];
    state = map['state'];
    country = map['country'];
    postcode = map['postcode'];
    coordinates =
        map['coordinates'] != null ? fromMap(map['coordinates']) : null;
    timezone = map['timezone'] != null ? fromMap(map['timezone']) : null;
  }

  Map<String, dynamic> toMap() {
    return {
      'street': street!.toMap(),
      'city': city,
      'state': state,
      'country': country,
      'postcode': postcode,
      'coordinates': coordinates!.toMap(),
      'timezone': timezone!.toMap(),
    };
  }
}

class Login {
  String? uuid;
  String? username;
  String? password;
  String? salt;
  String? md5;
  String? sha1;
  String? sha256;

  Login(
      {this.uuid,
      this.username,
      this.password,
      this.salt,
      this.md5,
      this.sha1,
      this.sha256});

  fromMap(Map<String, dynamic> map) {
    uuid = map['uuid'];
    username = map['username'];
    password = map['password'];
    salt = map['salt'];
    md5 = map['md5'];
    sha1 = map['sha1'];
    sha256 = map['sha256'];
  }

  Map<String, dynamic> toMap() {
    return {
      'uuid': uuid,
      'username': username,
      'password': password,
      'salt': salt,
      'md5': md5,
      'sha1': sha1,
      'sha256': sha256,
    };
  }
}

class Name {
  String? title;
  String? first;
  String? last;

  Name({this.title, this.first, this.last});

  fromMap(Map<String, dynamic> map) {
    title = map['title'];
    first = map['first'];
    last = map['last'];
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'first': first,
      'last': last,
    };
  }
}

class Picture {
  String? large;
  String? medium;
  String? thumbnail;

  Picture({this.large, this.medium, this.thumbnail});

  fromMap(Map<String, dynamic> map) {
    large = map['large'];
    medium = map['medium'];
    thumbnail = map['thumbnail'];
  }

  Map<String, dynamic> toMap() {
    return {
      'large': large,
      'medium': medium,
      'thumbnail': thumbnail,
    };
  }
}

class Registered {
  DateTime? date;
  int? age;

  Registered({this.date, this.age});

  fromMap(Map<String, dynamic> map) {
    date = map['date'];
    age = map['age'];
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'age': age,
    };
  }
}

class Street {
  int? number;
  String? name;

  Street({this.number, this.name});

  fromMap(Map<String, dynamic> map) {
    number = map['number'];
    name = map['name'];
  }

  Map<String, dynamic> toMap() {
    return {
      'number': number,
      'name': name,
    };
  }
}

class Timezone {
  String? offset;
  String? description;

  Timezone({this.offset, this.description});

  fromMap(Map<String, dynamic> map) {
    offset = map['offset'];
    description = map['description'];
  }

  Map<String, dynamic> toMap() {
    return {
      'offset': offset,
      'description': description,
    };
  }
}
