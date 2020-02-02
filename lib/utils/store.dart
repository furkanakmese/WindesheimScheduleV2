import '../main.dart';
import 'class.dart';

AppState initialState;

Future<AppState> getInitialState() async {
  String className = await getClassName();
  return new AppState(
    className: className,
    schedule: [],
    fetching: false,
    error: '',
  );
}
