const bool isProd = const bool.fromEnvironment('dart.vm.product');

enum StoreType {
  AppStore,
  GooglePlayStore,
}

const String slackApi = 'https://slack.com/api/';

const String rootRouteName = 'root';
const String cartRouteName = 'cart';
const String createAccountRouteName = 'create-account';
const String detailsRouteName = 'details';
const String homeRouteName = 'home';
const String loggedInKey = 'LoggedIn';
const String loginRouteName = 'login';
const String moreInfoRouteName = 'moreInfo';
const String paymentRouteName = 'payment';
const String personalRouteName = 'personal';
const String profileMoreInfoRouteName = 'profile-moreInfo';
const String profilePaymentRouteName = 'profile-payment';
const String profilePersonalRouteName = 'profile-personal';
const String profileRouteName = 'profile';
const String profileSigninInfoRouteName = 'profile-signin';
const String subDetailsRouteName = 'shop-details';
const String shoppingRouteName = 'shopping';
const String signinInfoRouteName = 'signin';
const String download_vegi_appstore_path = 'download-vegi-appstore';
const String download_vegi_playstore_path = 'download-vegi-playstore';
