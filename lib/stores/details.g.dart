// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Details on _Details, Store {
  late final _$valueAtom = Atom(name: '_Details.value', context: context);

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

  late final _$_DetailsActionController =
      ActionController(name: '_Details', context: context);

  @override
  void selectPack(String pack) {
    final _$actionInfo =
        _$_DetailsActionController.startAction(name: '_Details.selectPack');
    try {
      return super.selectPack(pack);
    } finally {
      _$_DetailsActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
