import 'EzBlocBase.dart';

class EzGlobalBloc extends EzBlocBase {
  //BlocList blocs;
  final Map<Type, EzBlocBase> blocs;

  EzGlobalBloc({this.blocs});

  T get<T>(Type runtimeType) {
    return blocs[runtimeType] as T;
  }

  void dispose() {
    blocs.forEach((Type t, EzBlocBase b) {
      b.dispose();
    });
  }
}
