mixin AuthRepository {
  String? isEmailValid(String? email) => _isEmailValid(email);
  String? isPasswordValid(String? password) => _isPasswordValid(password);

  //email regex
  RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+"); //email regex for validation

  String? _isEmailValid(String? email) {
    if (email == null) {
      return "email is required";
    } else if (!emailRegex.hasMatch(email)) {
      return "email is invalid";
    } else {
      return null;
    }
  }

  String? _isPasswordValid(String? password) {
    if (password == null) {
      return "password is required";
    } else if (password.length < 6) {
      return "password must be at least 6 characters";
    } else {
      return null;
    }
  }
}
