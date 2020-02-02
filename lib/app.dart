import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'custom_app_bar.dart';
import 'main.dart';
import 'scenes/Home/home.dart';
import 'scenes/Settings/settings.dart';
import 'store/actions.dart';
import 'store/reducer.dart';
import 'utils/store.dart';

class App extends StatefulWidget {
  // final Store<AppState> store;
  // App(this.store);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  Store<AppState> store = Store<AppState>(
    reducer,
    initialState: new AppState(
      className: '',
      schedule: [],
      fetching: false,
      error: '',
    ),
    middleware: [thunkMiddleware, new LoggingMiddleware.printer()],
  );

  static final SwiperController controller = new SwiperController();

  int _currentIndex = 0;

  final List<Widget> _children = [
    Home(controller),
    Settings(),
  ];

  @override
  void initState() {
    super.initState();

    asyncInitState();
  }

  void asyncInitState() async {
    AppState initialState = await getInitialState();
    final storeData = Store<AppState>(
      reducer,
      initialState: initialState,
      middleware: [thunkMiddleware, new LoggingMiddleware.printer()],
    );
    setState(() {
      store = storeData;
    });
    getSchedule(store);
  }

  @override
  Widget build(BuildContext context) {
    void onTabTapped(int index) {
      setState(() {
        _currentIndex = index;
      });
    }

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return StoreProvider(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'OpenSans'),
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: (kIsWeb ? Size.fromHeight(50) : Size.fromHeight(0)),
            child: CustomAppBar(controller),
          ),
          body: _children[_currentIndex],
          bottomNavigationBar: (kIsWeb)
              ? Container(
                  height: 0,
                )
              : BottomNavigationBar(
                  currentIndex: _currentIndex,
                  onTap: onTabTapped,
                  iconSize: 28,
                  items: [
                    BottomNavigationBarItem(
                      icon: new Icon(Icons.home),
                      title: new Text('Home'),
                    ),
                    BottomNavigationBarItem(
                      icon: new Icon(Icons.settings),
                      title: new Text('Settings'),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
