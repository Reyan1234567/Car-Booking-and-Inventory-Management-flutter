class User {
  final String id;
  final String username;
  final String email;
  final String phoneNumber;
  final String firstName;
  final String lastName;
  final String role;
  final String? profilePhoto;
  final String? licensePhoto;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.firstName,
    required this.lastName,
    required this.role,
    this.profilePhoto,
    this.licensePhoto,
  });
}

class UserCreateRequest {
  final String username;
  final String email;
  final String password;
  final String phoneNumber;
  final String firstName;
  final String lastName;
  final String birthDate;
  final String role;

  UserCreateRequest({
    required this.username,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.firstName,
    required this.lastName,
    required this.birthDate,
    this.role = "user", // Default role
  });
}

class UserUpdate {
  final String? username;
  final String? email;
  final String? phoneNumber;
  final String? firstName;
  final String? lastName;
  final String? role;
  final String? profilePhoto;
  final String? licensePhoto;

  UserUpdate({
    this.username,
    this.email,
    this.phoneNumber,
    this.firstName,
    this.lastName,
    this.role,
    this.profilePhoto,
    this.licensePhoto,
  });
} 