import 'package:comparebem/ui/compras_page.dart';
import 'package:comparebem/ui/lista_compras.dart';
import 'package:comparebem/ui/alerta_ofertas.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:comparebem/ui/home_page.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:path/path.dart' as Path;


Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message)
async{
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

AndroidNotificationChannel? channel;

FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  if(!kIsWeb) {
    channel = const AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      'This channel is used for important notifications',
      importance: Importance.high,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin!.resolvePlatformSpecificImplementation
    <AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(channel!);

    await FirebaseMessaging.instance
    .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  runApp(MaterialApp(
    home: MainPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class MainPage extends StatefulWidget {
  const MainPage({ Key? key }) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _currentIndex = 0;

    final screens = [
      HomePage(),
      ComprasPage(),
      ListaCompraPage(),
      AlertaPage()
    ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: screens[_currentIndex],
      extendBody: true,
      bottomNavigationBar: DotNavigationBar(
        backgroundColor: Colors.orange[700],
        itemPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        unselectedItemColor: Colors.orange[300],
        duration: Duration(milliseconds: 500),
        curve: Curves.linear,
        currentIndex: _currentIndex,
        enableFloatingNavBar: true,
        onTap: (i) => setState(() => _currentIndex = i), 
        items: [
           DotNavigationBarItem(
              icon: FaIcon(FeatherIcons.home),
              selectedColor: Colors.white,
            ),

            
            DotNavigationBarItem(
              icon: FaIcon(FeatherIcons.shoppingCart),
              selectedColor: Colors.white,
            ),

            
            DotNavigationBarItem(
              icon: FaIcon(FeatherIcons.list),
              selectedColor: Colors.white,
            ),

            DotNavigationBarItem(
              icon: FaIcon(FeatherIcons.bell),
              selectedColor: Colors.white,
            ),
        ]
      )
    );
  }
}

