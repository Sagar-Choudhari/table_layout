import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:fluttertoast/fluttertoast.dart' as toast;

class Intro extends StatelessWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Intro Layout',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Introduction(),
    );
  }
}

class Introduction extends StatefulWidget {
  const Introduction({Key? key}) : super(key: key);

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        showSkipButton: true,
        showNextButton: true,
        showDoneButton: true,
        skip: const Icon(Icons.skip_next),
        next: const Text("Next"),
        done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w700)),
        onDone: () {
          toast.Fluttertoast.showToast(
              msg: "Its DONE",
              toastLength: toast.Toast.LENGTH_SHORT,
              gravity: toast.ToastGravity.SNACKBAR,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.grey,
              textColor: Colors.white,
              fontSize: 16.0);
        },
        onSkip: () {
          toast.Fluttertoast.showToast(
              msg: "Why Skip!",
              toastLength: toast.Toast.LENGTH_SHORT,
              gravity: toast.ToastGravity.SNACKBAR,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.grey,
              textColor: Colors.white,
              fontSize: 16.0);
        },
        dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor: Theme.of(context).colorScheme.secondary,
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        ),
        pages: [
          PageViewModel(
            title: "Title of introduction page",
            body: "Welcome to the app! This is a description of how it works.",
            image: const Center(
              child: Icon(Icons.waving_hand, size: 50.0),
            ),
          ),
          PageViewModel(
            title: "Title of blue page",
            body:
            "Welcome to the app! This is a description on a page with a blue background.",
            image: Center(
              child: Image.network(
                  "https://cdn.logojoy.com/wp-content/uploads/20190718163447/How-To-Design-a-Gradient-Logo-01-1024x611.png",
                  height: 175.0),
            ),
            decoration: const PageDecoration(
              pageColor: Colors.blue,
            ),
          ),
          PageViewModel(
            title: "Title of orange text and bold page",
            body:
            "This is a description on a page with an orange title and bold, big body.",
            image: const Center(
              child: Text("👋", style: TextStyle(fontSize: 100.0)),
            ),
            decoration: const PageDecoration(
              titleTextStyle: TextStyle(color: Colors.orange),
              bodyTextStyle:
              TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
            ),
          ),
          PageViewModel(
            title: "Title of custom button page",
            body: "This is a description on a page with a custom button below.",
            image: const Icon(Icons.account_balance, size: 20),
            footer: ElevatedButton(
              onPressed: () {
                // On button pressed
              },
              child: const Text("Let's Go!"),
            ),
          ),
          PageViewModel(
            title: "Title of custom body page",
            bodyWidget: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Click on "),
                Icon(Icons.edit),
                Text(" to edit a post"),
              ],
            ),
            image: const Center(child: Icon(Icons.android)),
          )
        ],
      ),
    );
  }
}