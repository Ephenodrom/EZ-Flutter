import 'dart:collection';
import 'BlocBase.dart';

class BlocList<T extends BlocBase> extends ListBase<T> {
  List innerList = new List();

  BlocList();

  @override
  int length;

  @override
  T operator [](int index) => innerList[index];

  @override
  void operator []=(int index, T value) {
    innerList[index] = value;
  }

  void add(T value) => innerList.add(value);

  void addAll(Iterable<T> all) => innerList.addAll(all);
}
