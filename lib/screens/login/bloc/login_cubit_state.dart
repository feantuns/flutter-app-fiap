class LoginCubitState {
  const LoginCubitState({
    this.email,
    this.password,
  });

  final String? email;
  final String? password;

  LoginCubitState copyWith({
    String? email,
    String? password,
  }) =>
      LoginCubitState(
        email: email ?? this.email,
        password: password ?? this.password,
      );
}
