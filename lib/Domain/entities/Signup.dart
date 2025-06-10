class SignupRequest{
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String password;
  final String birthDate; // Consider using DateTime if you want to parse/manipulate dates

  SignupRequest(this.username, this.password, this.phoneNumber, this.email, this.birthDate, this.lastName, this.firstName);
}

class SignupResponse{
  final String id;
  final String username;
  final String email;
  final String? password;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String birthDate;
  final List<dynamic> history;
  final String role;

  SignupResponse(this.firstName, this.lastName, this.birthDate, this.email, this.phoneNumber, this.password, this.username, this.role, this.id, this.history);
}

class SignupPart1{
  final String email;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String birthDate;

  SignupPart1(this.email, this.phoneNumber, this.birthDate, this.lastName, this.firstName);
}