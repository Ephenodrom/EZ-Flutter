import 'BlocBase.dart';

class EzGlobalBloc extends BlocBase {
  //BlocList blocs;
  final Map<Type, BlocBase> blocs;

  EzGlobalBloc({this.blocs});

  T get<T>(Type runtimeType) {
    return blocs[runtimeType] as T;
  }

  void dispose() {
    blocs.forEach((Type t, BlocBase b) {
      b.dispose();
    });
  }
}
