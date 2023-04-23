class RegisterCubitState {
  const RegisterCubitState({
    this.email,
    this.password,
    this.confirmPassword,
  });

  final String? email;
  final String? password;
  final String? confirmPassword;

  RegisterCubitState copyWith({
    String? email,
    String? password,
    String? confirmPassword,
  }) =>
      RegisterCubitState(
        email: email ?? this.email,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
      );
}
