// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $LoginController = BindInject(
  (i) => LoginController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  final _$userAtom = Atom(name: '_LoginControllerBase.user');

  @override
  User get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$emailControllerAtom =
      Atom(name: '_LoginControllerBase.emailController');

  @override
  TextEditingController get emailController {
    _$emailControllerAtom.reportRead();
    return super.emailController;
  }

  @override
  set emailController(TextEditingController value) {
    _$emailControllerAtom.reportWrite(value, super.emailController, () {
      super.emailController = value;
    });
  }

  final _$passControllerAtom =
      Atom(name: '_LoginControllerBase.passController');

  @override
  TextEditingController get passController {
    _$passControllerAtom.reportRead();
    return super.passController;
  }

  @override
  set passController(TextEditingController value) {
    _$passControllerAtom.reportWrite(value, super.passController, () {
      super.passController = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_LoginControllerBase.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$switchValueAtom = Atom(name: '_LoginControllerBase.switchValue');

  @override
  bool get switchValue {
    _$switchValueAtom.reportRead();
    return super.switchValue;
  }

  @override
  set switchValue(bool value) {
    _$switchValueAtom.reportWrite(value, super.switchValue, () {
      super.switchValue = value;
    });
  }

  final _$isBiometricAtom = Atom(name: '_LoginControllerBase.isBiometric');

  @override
  bool get isBiometric {
    _$isBiometricAtom.reportRead();
    return super.isBiometric;
  }

  @override
  set isBiometric(bool value) {
    _$isBiometricAtom.reportWrite(value, super.isBiometric, () {
      super.isBiometric = value;
    });
  }

  final _$loadingAtom = Atom(name: '_LoginControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$switchBiometricAsyncAction =
      AsyncAction('_LoginControllerBase.switchBiometric');

  @override
  Future<void> switchBiometric(dynamic value) {
    return _$switchBiometricAsyncAction.run(() => super.switchBiometric(value));
  }

  final _$checkBiometricAsyncAction =
      AsyncAction('_LoginControllerBase.checkBiometric');

  @override
  Future checkBiometric() {
    return _$checkBiometricAsyncAction.run(() => super.checkBiometric());
  }

  final _$formValidatorAsyncAction =
      AsyncAction('_LoginControllerBase.formValidator');

  @override
  Future<bool> formValidator() {
    return _$formValidatorAsyncAction.run(() => super.formValidator());
  }

  @override
  String toString() {
    return '''
user: ${user},
emailController: ${emailController},
passController: ${passController},
errorMessage: ${errorMessage},
switchValue: ${switchValue},
isBiometric: ${isBiometric},
loading: ${loading}
    ''';
  }
}
