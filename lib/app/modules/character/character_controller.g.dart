// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $CharacterController = BindInject(
  (i) => CharacterController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CharacterController on _CharacterControllerBase, Store {
  final _$isSearchingAtom = Atom(name: '_CharacterControllerBase.isSearching');

  @override
  bool get isSearching {
    _$isSearchingAtom.reportRead();
    return super.isSearching;
  }

  @override
  set isSearching(bool value) {
    _$isSearchingAtom.reportWrite(value, super.isSearching, () {
      super.isSearching = value;
    });
  }

  final _$searchAtom = Atom(name: '_CharacterControllerBase.search');

  @override
  String get search {
    _$searchAtom.reportRead();
    return super.search;
  }

  @override
  set search(String value) {
    _$searchAtom.reportWrite(value, super.search, () {
      super.search = value;
    });
  }

  final _$controllerAtom = Atom(name: '_CharacterControllerBase.controller');

  @override
  TextEditingController get controller {
    _$controllerAtom.reportRead();
    return super.controller;
  }

  @override
  set controller(TextEditingController value) {
    _$controllerAtom.reportWrite(value, super.controller, () {
      super.controller = value;
    });
  }

  final _$_CharacterControllerBaseActionController =
      ActionController(name: '_CharacterControllerBase');

  @override
  void searchAcion() {
    final _$actionInfo = _$_CharacterControllerBaseActionController.startAction(
        name: '_CharacterControllerBase.searchAcion');
    try {
      return super.searchAcion();
    } finally {
      _$_CharacterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void searchChangeQuery(String value) {
    final _$actionInfo = _$_CharacterControllerBaseActionController.startAction(
        name: '_CharacterControllerBase.searchChangeQuery');
    try {
      return super.searchChangeQuery(value);
    } finally {
      _$_CharacterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void searchBack() {
    final _$actionInfo = _$_CharacterControllerBaseActionController.startAction(
        name: '_CharacterControllerBase.searchBack');
    try {
      return super.searchBack();
    } finally {
      _$_CharacterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isSearching: ${isSearching},
search: ${search},
controller: ${controller}
    ''';
  }
}
