import 'package:flutter/material.dart';
import 'package:online_store/presentation/screens/login.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: "https://aenxvpnhijiqvnvapqgz.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFlbnh2cG5oaWppcXZudmFwcWd6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzA0ODY3MjMsImV4cCI6MjA4NjA2MjcyM30.EJHoZxs8RQc_62QIau5dJ4CmbbmOIWKQbvXz6LTsqkY",
  );

  runApp(const OnlineStore());
}

class OnlineStore extends StatelessWidget {
  const OnlineStore({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Final App',
      home: Login(),
    );
  }
}
