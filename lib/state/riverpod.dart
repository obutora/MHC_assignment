import 'package:hooks_riverpod/hooks_riverpod.dart';

class Model {
  String name;

  Model({this.name});
}

class ModelNotifier extends StateNotifier<Model> {
  ModelNotifier() : super(_init);

  static final _init = Model(
    name: '',
  );

  void changeName(String name) {
    state = Model(name: name);
  }
}
