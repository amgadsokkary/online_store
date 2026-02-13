import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:online_store/core/cache/cache_user_repo.dart';
import 'package:online_store/feature/auth/data/services/auth_service.dart';
part 'app_auth_state.dart';

class AppAuthCubit extends Cubit<AppAuthState> {
  final AuthService authServices = AuthService();
  AppAuthCubit() : super(AppAuthInitial());

  Future<void> signUp({
    required String email,
    required String password,
    required String username,
  }) async {
    emit(AppAuthLoading());
    try {
      await authServices.signUp(
        email: email,
        password: password,
        username: username,
      );
      emit(AppAuthSuccess());
      CacheUserRepo.login(true);
    } catch (e) {
      emit(AppAuthError(e.toString()));
    }
  }

  Future<void> login({required String email, required String password}) async {
    emit(AppAuthLoading());
    try {
      await authServices.login(email: email, password: password);
      emit(AppAuthSuccess());
      CacheUserRepo.login(true);
    } catch (e) {
      emit(AppAuthError(e.toString()));
    }
  }

  Future<void> logOut() async {
    emit(AppAuthLoading());
    await authServices.logOut();
    CacheUserRepo.logout();
    emit(AppAuthSuccess());
  }
}
