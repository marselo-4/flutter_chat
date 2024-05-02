class ValidationMixins {
  String? validateEmail(String? value) {
    if (!value!.contains('@') && !value.contains('.')) {
      return "Email invalido";
    } else {
      return null;
    }
  }

  String? validatePassword(String? value) {
    if (value!.length < 6) {
      return "Contraseña invalida";
    } else {
      return null;
    }
  }
}
