import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/core/theme/app_styles.dart';
import 'package:online_store/core/cache/cache_user_repo.dart';
import 'package:online_store/feature/auth/cubit/appauth/app_auth_cubit.dart';
import 'package:online_store/feature/auth/presentation/screens/login.dart';
import 'package:online_store/core/widget/custom_button.dart';
import 'package:online_store/feature/home/presentation/screens/add_products.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final user = Supabase.instance.client.auth.currentUser;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppAuthCubit, AppAuthState>(
      listener: (context, state) {
        if (state is AppAuthSuccess) {
          CacheUserRepo.logout();
          Navigator.of(
            context,
          ).pushReplacement(MaterialPageRoute(builder: (context) => Login()));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text("Profile"), centerTitle: true),
          body: Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assets/images/logo.png"),
                ),
                SizedBox(height: 20),
                Text(
                  user!.userMetadata?["username"] ?? "Unknown User",
                  style: AppStyles.headlineMedium,
                ),
                SizedBox(height: 10),
                Text("${user!.email}", style: AppStyles.bodyMedium),
                ListTile(
                  leading: Icon(Icons.add),
                  title: Text("Add Product"),
                  trailing: Icon(Icons.arrow_forward_ios_outlined),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AddProducts()),
                    );
                  },
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: state is AppAuthLoading
                      ? CircularProgressIndicator()
                      : CustomButton(
                          bName: "logOut",
                          onPressed: () {
                            BlocProvider.of<AppAuthCubit>(context).logOut();
                          },
                        ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        );
      },
    );
  }
}
