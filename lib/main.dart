import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart' as toast;
import 'package:flash/flash.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:table_layout/card_swipe.dart';
import 'package:table_layout/carousel.dart';
import 'package:table_layout/Notification/notification.dart';
import 'table.dart';
import 'intro.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Table Layout',
      // initialRoute: '/',
      routes: {
        // '/': (context) => const MyHomePage(),
        '/tableOne': (context) => const TableOne(),
        '/intro': (context) => const Intro(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ShowCaseWidget(
        builder: Builder(builder: (context) => const MyHomePage()),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey _first = GlobalKey();
  final GlobalKey _second = GlobalKey();
  final GlobalKey _third = GlobalKey();
  // final GlobalKey _fourth = GlobalKey();
  // final GlobalKey _fifth = GlobalKey();

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // make status bar transparent
      statusBarIconBrightness: Brightness.dark, // set icon color to dark
    ));
    // , _third, _fourth, _fifth
    // WidgetsBinding.instance.addPostFrameCallback(
    //       (_) => ShowCaseWidget.of(context)
    //       .startShowCase([_first, _second]),
    // );

    WidgetsBinding.instance.addPostFrameCallback(
      (_) =>
          ShowCaseWidget.of(context).startShowCase([_first, _second, _third]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Showcase(
          key: _first,
          title: 'App Title',
          description: 'This is app title',
          // targetShapeBorder: const CircleBorder(),
          // tooltipBackgroundColor: Colors.indigo,
          descTextStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontSize: 16,
          ),
          targetPadding: const EdgeInsets.all(10),
          tooltipPadding: const EdgeInsets.all(8),
          child: const Text("widget.title"),
          // contentPadding: const EdgeInsets.all(20),
        ),
        centerTitle: true,
        leading: Showcase(
          key: _second,
          title: 'Icon',
          description: 'Leading Icon',
          child: const Icon(Icons.accessible_forward_rounded),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: <Color>[Color(0xff00aeef), Color(0xff2d388a)]),
          ),
        ),
        // backgroundColor: Colors.transparent,
        // backgroundColor: Color.lerp(const Color(0xff00aeef), const Color(0xff2d388a),0.3)
      ),
      body: const ShowCaseTest(),
      floatingActionButton: Showcase(
        key: _third,
        title: 'This is FAB',
        description: 'Call in app notification from here',
        onTargetClick: () => _showTopFlash(),
        disposeOnTap: true,
        targetShapeBorder: const CircleBorder(),
        child: FloatingActionButton(
          onPressed: () => _showTopFlash(),
          tooltip: 'Pop Something',
          child: const Icon(CupertinoIcons.increase_indent),
        ),
      ),
    );
  }

  void _showTopFlash() {
    showFlash(
      context: context,
      duration: const Duration(seconds: 4),
      builder: (context, controller) {
        return Flash.bar(
          controller: controller,
          backgroundGradient: const LinearGradient(
            colors: [
              Color(0xff4153cc),
              Color(0xFF00aeef),
            ],
            // begin: Alignment.bottomLeft,
            // end: Alignment.topRight,
            // stops: [0.4, 0.7],
            tileMode: TileMode.repeated,
          ),
          brightness: Brightness.light,
          boxShadows: const [BoxShadow(blurRadius: 4)],
          barrierBlur: 7.0,
          barrierDismissible: true,
          position: FlashPosition.top,
          horizontalDismissDirection: HorizontalDismissDirection.startToEnd,
          margin: const EdgeInsets.all(8),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          forwardAnimationCurve: Curves.easeOutBack,
          reverseAnimationCurve: Curves.slowMiddle,
          child: FlashBar(
            title: const Text(
              'You are seeing a snackbar!',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            primaryAction: IconButton(
              icon: const Icon(
                Icons.ac_unit,
                color: CupertinoColors.white,
              ),
              onPressed: () => controller.dismiss(),
            ),
            icon: const Icon(
              Icons.info,
              color: Colors.white,
            ),
            shouldIconPulse: false,
            showProgressIndicator: true,
            content: const Text(
              "this is desc",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}

class ShowCaseTest extends StatefulWidget {
  const ShowCaseTest({Key? key}) : super(key: key);

  @override
  State<ShowCaseTest> createState() => _ShowCaseTestState();
}

class _ShowCaseTestState extends State<ShowCaseTest> {
  final GlobalKey _first = GlobalKey();
  final GlobalKey _second = GlobalKey();

  @override
  Widget build(BuildContext context) {
    someEvent() {
      ShowCaseWidget.of(context).startShowCase([_first, _second]);
    }

    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                someEvent();
              },
              child: const Text('Show coaches/showcase'),
            ),
            const Text(
              'Different items here',
            ),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Showcase(
                  key: _first,
                  description: 'Gradient box',
                  targetPadding: const EdgeInsets.all(2),
                  targetBorderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [Color(0xfffbb040), Color(0xffef4136)],
                            begin: FractionalOffset.centerLeft,
                            end: FractionalOffset.centerRight,
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const SizedBox(width: 10),
                Showcase(
                  key: _second,
                  title: 'Linear gradient',
                  description: 'this is gradient',
                  targetPadding: const EdgeInsets.all(4),
                  targetBorderRadius: BorderRadius.circular(40),
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [
                              Color(0xff2d388a),
                              Color(0xff00aeef),
                            ],
                            begin: FractionalOffset.bottomLeft,
                            end: FractionalOffset.topRight,
                            stops: [0.0, 1.0],
                            tileMode: TileMode.mirror),
                        borderRadius: BorderRadius.circular(40)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                    onPressed: () {
                      toast.Fluttertoast.showToast(
                          msg: "This is Center Short Toast",
                          toastLength: toast.Toast.LENGTH_SHORT,
                          gravity: toast.ToastGravity.SNACKBAR,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.grey,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    },
                    child: const Text('Call Toast')),
                ElevatedButton(
                    onPressed: () {
                      var snackBar =
                          const SnackBar(content: Text('Hello, I am here'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    child: const Text('Call SnackBar')),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/tableOne');
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const TableOne()),
                  // );
                },
                child: const Text('Call Table')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/intro');
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const Intro()),
                  // );
                },
                child: const Text('Call Intro Screen')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CarouselView()),
                  );
                },
                child: const Text('View carousel')),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: DropdownButtonFormField(
                hint: const Text('Select:'),
                borderRadius: BorderRadius.circular(18),
                icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          style: BorderStyle.solid,
                          color: Colors.black,
                          width: 5)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                  filled: true,
                  fillColor: Colors.greenAccent,
                ),
                dropdownColor: Colors.greenAccent,
                isDense: true,
                isExpanded: true,
                items: <String>[
                  'Dog',
                  'Cat',
                  'Tiger',
                  'Lion',
                  'Dog1',
                  'Cat1',
                  'Tiger1',
                  'Lion1',
                  'Dog2',
                  'Cat3',
                  'Tiger4',
                  'Lion5'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Column(
                      children: [
                        Text(
                          value,
                          style: const TextStyle(fontSize: 18),
                        ),
                        const Divider(height: 0, color: Colors.black),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  toast.Fluttertoast.showToast(msg: newValue.toString());
                  debugPrint(newValue);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: InputDecorator(
                decoration: const InputDecoration(contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 7),
                    border: OutlineInputBorder(
                        gapPadding: 0,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(width: 4, color: Colors.cyan))),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    hint:
                        const Text('Select item:', style: TextStyle(height: 0)),
                    borderRadius: BorderRadius.circular(10),
                    menuMaxHeight: 300,
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                    icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                    items: <String>[
                      'Dog',
                      'Cat',
                      'Tiger',
                      'Lion',
                      'Dog1',
                      'Cat1',
                      'Tiger1',
                      'Lion1'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(fontSize: 16),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      toast.Fluttertoast.showToast(msg: newValue.toString());
                      debugPrint(newValue);
                    },
                  ),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CardSwipe()),
                  );
                },
                child: const Text('View Card Swiper')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NewNotification()),
                  );
                },
                child: const Text('View Notifications')),
          ],
        ),
      ),
    );
  }
}
