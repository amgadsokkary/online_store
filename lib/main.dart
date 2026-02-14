import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/core/cache/cache_user_repo.dart';
import 'package:online_store/feature/auth/cubit/appauth/app_auth_cubit.dart';
import 'package:online_store/feature/cart/cubit/cart/cart_cubit.dart';
import 'package:online_store/feature/home/cubit/product_cubit.dart';
import 'package:online_store/feature/home/presentation/screens/homepage.dart';
import 'package:online_store/feature/auth/presentation/screens/on_board_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheUserRepo.init();

  await Supabase.initialize(
    url: "https://aenxvpnhijiqvnvapqgz.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFlbnh2cG5oaWppcXZudmFwcWd6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzA0ODY3MjMsImV4cCI6MjA4NjA2MjcyM30.EJHoZxs8RQc_62QIau5dJ4CmbbmOIWKQbvXz6LTsqkY",
  );

  final isLoggedIn = await CacheUserRepo.isloggedIn();
  runApp(OnlineStore(isLoggedIn: isLoggedIn));
}

class OnlineStore extends StatelessWidget {
  final bool isLoggedIn;

  const OnlineStore({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppAuthCubit()),
        BlocProvider(create: (context) => ProductCubit()..getAllProducts()),
        BlocProvider(create: (context) => CartCubit()..getCartItems()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Online Store',
        home: isLoggedIn ? Homepage() : OnBoardPage(),
      ),
    );
  }
}
