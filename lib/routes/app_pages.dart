import 'package:get/get.dart';
import '../screens/team_screen/team_contact/view/team_contact.dart';
import '../screens/team_screen/team_profile/team_profile.dart';
import '../screens/team_screen/team_registration/teamR_View/teamR_view.dart';
import '../screens/team_screen/team_registration/teamR_View/team_fetch.dart';
import '../screens/user_screen/user_auth/login_auth/user_login_view/user_login_view.dart';
import '../screens/user_screen/user_auth/register_auth/user_signup_view/user_signup_view.dart';
import '../screens/user_screen/user_home/user_home_view/user_home_view.dart';
import '../screens/user_screen/user_profile/user_profile.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.userBNav; // first screen

  static final routes = [
    GetPage(
      name: Routes.userLogin,
      page: () => const UserLoginView(),
    ),
    GetPage(
      name: Routes.userSignup,
      page: () => const UserSignupView(),
    ),
    GetPage(
      name: Routes.userHome,
      page: () => const UserHomeView(),
    ),
  GetPage(
  name: Routes.userBNav,
  page: () => const UserBottomNav(),
  ),

  GetPage(
  name: Routes.teamProfile,
  page: () => const TeamProfileView(),
  ),

  GetPage(
  name: Routes.teamContact,
  page: () => TeamContactView(),
  ),

  GetPage(
  name: Routes.userProfile,
  page: () => const UserProfileView(),
  ),


  GetPage(
  name: Routes.RegisterTeam,
  page: () => RegisterTeamScreen(),
  ),

  GetPage(
  name: Routes.FetchTeamList,
  page: () => TeamListScreen(),
  ),

  ];
}
