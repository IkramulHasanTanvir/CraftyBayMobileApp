class SingUpParams {
  final String firstName, lastName, email, password, phone, city;

  SingUpParams(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.password,
      required this.phone,
      required this.city});

  factory SingUpParams.formJson(Map<String, dynamic> json) {
    return SingUpParams(
        firstName: 'first_name',
        lastName: 'last_name',
        email: 'email',
        password: 'password',
        phone: 'phone',
        city: 'city');
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'password': password,
      'phone': phone,
      'city': city
    };
  }
}
