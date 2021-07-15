import 'package:bcl_earn/transition_route_observer.dart';
import 'package:bcl_earn/views/widgets/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:native_admob_flutter/native_admob_flutter.dart';

import 'package:bcl_earn/ads/native_ads.dart';
import 'package:bcl_earn/ads/full_screen_ad.dart';
import 'package:bcl_earn/ads/banner_ad.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //MobileAds.instance.initialize();
  await MobileAds.initialize();
  // This is my device id. Ad yours here
  //MobileAds.setTestDeviceIds(['9345804C1E5B8F0871DFE29CA0758842']);
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    //FirebaseAuth.instance.signOut();
    return GetMaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Flutter Demo',
      home: MySplashPage(),
    );
  }
}

/*class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // appOpenAd.show();
    return MaterialApp(
      title: 'Native Ads Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}*/

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /// Init the controller
  final bannerController = BannerAdController();

  /// The banner height
  // double _bannerAdHeight = 0;

  @override
  void initState() {
    super.initState();
    bannerController.onEvent.listen((e) {
      final event = e.keys.first;
      // final info = e.values.first;
      switch (event) {
        case BannerAdEvent.loaded:
          // setState(() => _bannerAdHeight = (info as int)?.toDouble());
          break;
        default:
          break;
      }
    });
    bannerController.load();
  }

  @override
  void dispose() {
    bannerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.deepPurple,
        appBar: AppBar(
          title: Text('Ads demo'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.navigate_next),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => Scaffold(
                    appBar: AppBar(title: Text('Native Ads')),
                    body: NativeAds(),
                  ),
                ));
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [NativeAds(), BannerAds(), FullScreenAds()],
              ),
            ),
            BannerAd(controller: bannerController),
          ],
        ),
        bottomNavigationBar: Container(
          color: Colors.blue,
          child: TabBar(
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(text: 'Native Ads'),
              Tab(text: 'Banner Ads'),
              Tab(text: 'Full Screen Ads'),
            ],
          ),
        ),
      ),
    );
  }
}
