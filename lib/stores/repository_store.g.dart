// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RepositoryStore on _RepositoryStore, Store {
  Computed<RepositoryState> _$stateComputed;

  @override
  RepositoryState get state =>
      (_$stateComputed ??= Computed<RepositoryState>(() => super.state,
              name: '_RepositoryStore.state'))
          .value;

  final _$repositoryFutureAtom =
      Atom(name: '_RepositoryStore.repositoryFuture');

  @override
  ObservableFuture<dynamic> get repositoryFuture {
    _$repositoryFutureAtom.reportRead();
    return super.repositoryFuture;
  }

  @override
  set repositoryFuture(ObservableFuture<dynamic> value) {
    _$repositoryFutureAtom.reportWrite(value, super.repositoryFuture, () {
      super.repositoryFuture = value;
    });
  }

  final _$repositoryListAtom = Atom(name: '_RepositoryStore.repositoryList');

  @override
  ObservableList<dynamic> get repositoryList {
    _$repositoryListAtom.reportRead();
    return super.repositoryList;
  }

  @override
  set repositoryList(ObservableList<dynamic> value) {
    _$repositoryListAtom.reportWrite(value, super.repositoryList, () {
      super.repositoryList = value;
    });
  }

  final _$listLengthAtom = Atom(name: '_RepositoryStore.listLength');

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

  final _$getRepositoriesAsyncAction =
      AsyncAction('_RepositoryStore.getRepositories');

  @override
  Future<void> getRepositories({String name}) {
    return _$getRepositoriesAsyncAction
        .run(() => super.getRepositories(name: name));
  }

  final _$_RepositoryStoreActionController =
      ActionController(name: '_RepositoryStore');

  @override
  void setRepositoryToList(List<dynamic> list) {
    final _$actionInfo = _$_RepositoryStoreActionController.startAction(
        name: '_RepositoryStore.setRepositoryToList');
    try {
      return super.setRepositoryToList(list);
    } finally {
      _$_RepositoryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setListLength(int length) {
    final _$actionInfo = _$_RepositoryStoreActionController.startAction(
        name: '_RepositoryStore.setListLength');
    try {
      return super.setListLength(length);
    } finally {
      _$_RepositoryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
repositoryFuture: ${repositoryFuture},
repositoryList: ${repositoryList},
listLength: ${listLength},
state: ${state}
    ''';
  }
}
