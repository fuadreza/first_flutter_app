import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class page extends StatelessWidget {
  String title;

  page(this.title);
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child:  new FlatButton(
            onPressed: () {},
            textColor: Colors.white,
            color: Colors.blue,
            child: new Text(title)),
      ),
    );
  }

  Widget buildRaisedButton() {
    return new Align(
      alignment: const Alignment(0.0, -0.2),
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new ButtonBar(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new RaisedButton(
                child: const Text('RAISED BUTTON'),
                onPressed: () {
                  // Perform some action
                },
              ),
              const RaisedButton(
                child: const Text('DISABLED'),
                onPressed: null,
              ),
            ],
          ),
          new ButtonBar(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new RaisedButton.icon(
                icon: const Icon(Icons.add, size: 18.0),
                label: const Text('RAISED BUTTON'),
                onPressed: () {
                  // Perform some action
                },
              ),
              new RaisedButton.icon(
                icon: const Icon(Icons.add, size: 18.0),
                label: const Text('DISABLED'),
                onPressed: null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class testPage extends StatelessWidget {
  String title;

  testPage(this.title);
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child:  new Text(title),
      ),
    );
  }
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _counter = 0;
  TabController tabController;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  //here in the initstate we assign the tabcontroller and give it a length and vsyc for animation.

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 3, vsync: this);
  }

//dispose method for good practice.

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),

      body: new TabBarView(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.

        // Column is also layout widget. It takes a list of children and
        // arranges them vertically. By default, it sizes itself to fit its
        // children horizontally, and tries to be as tall as its parent.
        //
        // Invoke "debug paint" (press "p" in the console where you ran
        // "flutter run", or select "Toggle Debug Paint" from the Flutter tool
        // window in IntelliJ) to see the wireframe for each widget.
        //
        // Column has various properties to control how it sizes itself and
        // how it positions its children. Here we use mainAxisAlignment to
        // center the children vertically; the main axis here is the vertical
        // axis because Columns are vertical (the cross axis would be
        // horizontal).
//          mainAxisAlignment: MainAxisAlignment.center,
        /*children: <Widget>[
            new Text(
              'Tombol sudah dipencet sejumlah:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],*/

        children: <Widget>[
          new page("Home"),
          new testPage("Favorites"),
          new testPage("Notification")
        ],
        controller: tabController,

      ),

      /*floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.*/
      bottomNavigationBar: new Material(
        color: Colors.blue,
        child: new TabBar(
          controller: tabController,
          tabs: <Widget>[
            new Tab(
              icon: new Icon(Icons.home),
              text: "Home",
            ),
            new Tab(
              icon: new Icon(Icons.show_chart),
              text: "Progress",
            ),
            new Tab(
              icon: new Icon(Icons.notifications),
              text: "Notification",
            ),
          ],
        ),
      ),
    );
  }
}

//CARD DEMO

const String _kGalleryAssetsPackage = 'flutter_gallery_assets';

class TravelDestination {
  const TravelDestination({
    this.assetName,
    this.assetPackage,
    this.title,
    this.description,
  });

  final String assetName;
  final String assetPackage;
  final String title;
  final List<String> description;

  bool get isValid => assetName != null && title != null && description?.length == 3;
}

final List<TravelDestination> destinations = <TravelDestination>[
  const TravelDestination(
    assetName: 'top_10_australian_beaches.jpg',
    assetPackage: _kGalleryAssetsPackage,
    title: 'Top 10 Australian beaches',
    description: const <String>[
      'Number 10',
      'Whitehaven Beach',
      'Whitsunday Island, Whitsunday Islands',
    ],
  ),
  const TravelDestination(
    assetName: 'kangaroo_valley_safari.jpg',
    assetPackage: _kGalleryAssetsPackage,
    title: 'Kangaroo Valley Safari',
    description: const <String>[
      '2031 Moss Vale Road',
      'Kangaroo Valley 2577',
      'New South Wales',
    ],
  )
];

class TravelDestinationItem extends StatelessWidget {
  TravelDestinationItem({ Key key, @required this.destination, this.shape })
      : assert(destination != null && destination.isValid),
        super(key: key);

  static const double height = 366.0;
  final TravelDestination destination;
  final ShapeBorder shape;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle = theme.textTheme.headline.copyWith(color: Colors.white);
    final TextStyle descriptionStyle = theme.textTheme.subhead;

    return new SafeArea(
      top: false,
      bottom: false,
      child: new Container(
        padding: const EdgeInsets.all(8.0),
        height: height,
        child: new Card(
          shape: shape,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // photo and title
              new SizedBox(
                height: 184.0,
                child: new Stack(
                  children: <Widget>[
                    new Positioned.fill(
                      child: new Image.asset(
                        destination.assetName,
                        package: destination.assetPackage,
                        fit: BoxFit.cover,
                      ),
                    ),
                    new Positioned(
                      bottom: 16.0,
                      left: 16.0,
                      right: 16.0,
                      child: new FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: new Text(destination.title,
                          style: titleStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // description and share/explore buttons
              new Expanded(
                child: new Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                  child: new DefaultTextStyle(
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    style: descriptionStyle,
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // three line description
                        new Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: new Text(
                            destination.description[0],
                            style: descriptionStyle.copyWith(color: Colors.black54),
                          ),
                        ),
                        new Text(destination.description[1]),
                        new Text(destination.description[2]),
                      ],
                    ),
                  ),
                ),
              ),
              // share, explore buttons
              new ButtonTheme.bar(
                child: new ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new FlatButton(
                      child: const Text('SHARE'),
                      textColor: Colors.amber.shade500,
                      onPressed: () { /* do nothing */ },
                    ),
                    new FlatButton(
                      child: const Text('EXPLORE'),
                      textColor: Colors.amber.shade500,
                      onPressed: () { /* do nothing */ },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardsDemo extends StatefulWidget {
  static const String routeName = '/material/cards';

  @override
  _CardsDemoState createState() => new _CardsDemoState();
}

class _CardsDemoState extends State<CardsDemo> {
  ShapeBorder _shape;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: const Text('Travel stream'),
          actions: <Widget>[
            new IconButton(
              icon: const Icon(Icons.sentiment_very_satisfied),
              onPressed: () {
                setState(() {
                  _shape = _shape != null ? null : const RoundedRectangleBorder(
                    borderRadius: const BorderRadius.only(
                      topLeft: const Radius.circular(16.0),
                      topRight: const Radius.circular(16.0),
                      bottomLeft: const Radius.circular(2.0),
                      bottomRight: const Radius.circular(2.0),
                    ),
                  );
                });
              },
            ),
          ],
        ),
        body: new ListView(
            itemExtent: TravelDestinationItem.height,
            padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
            children: destinations.map((TravelDestination destination) {
              return new Container(
                margin: const EdgeInsets.only(bottom: 8.0),
                child: new TravelDestinationItem(
                  destination: destination,
                  shape: _shape,
                ),
              );
            }).toList()
        )
    );
  }
}
