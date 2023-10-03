// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Auth on _Auth, Store {
  late final _$valueAtom = Atom(name: '_Auth.value', context: context);

  @override
  String get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(String value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  late final _$descriptionPackMockAtom =
      Atom(name: '_Auth.descriptionPackMock', context: context);

  @override
  String get descriptionPackMock {
    _$descriptionPackMockAtom.reportRead();
    return super.descriptionPackMock;
  }

  @override
  set descriptionPackMock(String value) {
    _$descriptionPackMockAtom.reportWrite(value, super.descriptionPackMock, () {
      super.descriptionPackMock = value;
    });
  }

  late final _$isAuthenticatedAtom =
      Atom(name: '_Auth.isAuthenticated', context: context);

  @override
  bool get isAuthenticated {
    _$isAuthenticatedAtom.reportRead();
    return super.isAuthenticated;
  }

  @override
  set isAuthenticated(bool value) {
    _$isAuthenticatedAtom.reportWrite(value, super.isAuthenticated, () {
      super.isAuthenticated = value;
    });
  }

  late final _$_AuthActionController =
      ActionController(name: '_Auth', context: context);

  @override
  void setIsAuthenticated() {
    final _$actionInfo =
        _$_AuthActionController.startAction(name: '_Auth.setIsAuthenticated');
    try {
      return super.setIsAuthenticated();
    } finally {
      _$_AuthActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value},
descriptionPackMock: ${descriptionPackMock},
isAuthenticated: ${isAuthenticated}
    ''';
  }
}
