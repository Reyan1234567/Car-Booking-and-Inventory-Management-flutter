class LoginRequest{
  final String username;
  final String password;

  LoginRequest(this.username, this.password);
}

class LoginResponse{
  final String accessToken;
  final String refreshToken;
  final User user;

  LoginResponse(this.accessToken, this.refreshToken, this.user);
}

class User{
  final String id;
  final String username;
  final String email;
  final String phoneNumber;
  final String? profilePhoto;
  final String? licensePhoto;
  final String firstName;
  final String lastName;
  final String role;

  User(this.id, this.username, this.email, this.phoneNumber, this.profilePhoto, this.licensePhoto, this.firstName, this.lastName, this.role);
}