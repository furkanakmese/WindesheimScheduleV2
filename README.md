# WindesMusic 2.0

## Global state management

### StoreProvider
This is comparable to the mapStateToProps. Use this when you want to interact with the store. This goes for both accesing data from the store and dispatching actions to the store. Below you see a StoreConnector widget. It has two methods:
- The converter talks to the store, the returned className will be accessed in the paramater in the builder;
- The builder does something, like return the data in the form of text or create a button with the onPressed linked to the dispatch method which would be passed just like the data would (more on this later).

In other words, the converter talks to the store and returns something that the builder will use for something. 

```dart
// this one just prints a string filled with store data
StoreConnector<AppState, String>(
    converter: (store) => store.state.className,
    builder: (context, className) => Text(className),
),

// this one returns a method without a callback (like specified) which is then referenced by the onPressed
StoreConnector<AppState, VoidCallback>(
    converter: (store) {
        return () => store.dispatch(SetClassName('new data'));
    },
    builder: (context, callback) => FlatButton(
        child: Text('Update state'),
        onPressed: callback,
    ),
),
```
