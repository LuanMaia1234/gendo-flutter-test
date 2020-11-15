// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'starred_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StarredStore on _StarredStore, Store {
  Computed<StarredState> _$stateComputed;

  @override
  StarredState get state =>
      (_$stateComputed ??= Computed<StarredState>(() => super.state,
              name: '_StarredStore.state'))
          .value;

  final _$starredFutureAtom = Atom(name: '_StarredStore.starredFuture');

  @override
  ObservableFuture<dynamic> get starredFuture {
    _$starredFutureAtom.reportRead();
    return super.starredFuture;
  }

  @override
  set starredFuture(ObservableFuture<dynamic> value) {
    _$starredFutureAtom.reportWrite(value, super.starredFuture, () {
      super.starredFuture = value;
    });
  }

  final _$starredListAtom = Atom(name: '_StarredStore.starredList');

  @override
  ObservableList<dynamic> get starredList {
    _$starredListAtom.reportRead();
    return super.starredList;
  }

  @override
  set starredList(ObservableList<dynamic> value) {
    _$starredListAtom.reportWrite(value, super.starredList, () {
      super.starredList = value;
    });
  }

  final _$listLengthAtom = Atom(name: '_StarredStore.listLength');

  @override
  int get listLength {
    _$listLengthAtom.reportRead();
    return super.listLength;
  }

  @override
  set listLength(int value) {
    _$listLengthAtom.reportWrite(value, super.listLength, () {
      super.listLength = value;
    });
  }

  final _$searchAtom = Atom(name: '_StarredStore.search');

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

  final _$getStarredAsyncAction = AsyncAction('_StarredStore.getStarred');

  @override
  Future<void> getStarred({String name}) {
    return _$getStarredAsyncAction.run(() => super.getStarred(name: name));
  }

  final _$_StarredStoreActionController =
      ActionController(name: '_StarredStore');

  @override
  void setStarredToList(List<dynamic> list) {
    final _$actionInfo = _$_StarredStoreActionController.startAction(
        name: '_StarredStore.setStarredToList');
    try {
      return super.setStarredToList(list);
    } finally {
      _$_StarredStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
starredFuture: ${starredFuture},
starredList: ${starredList},
listLength: ${listLength},
search: ${search},
state: ${state}
    ''';
  }
}
