/// Generated file. Do not edit.
///
/// Original: lib/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 1
/// Strings: 57
///
/// Built on 2024-11-08 at 00:23 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
	en(languageCode: 'en', build: Translations.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, Translations> build;

	/// Gets current instance managed by [LocaleSettings].
	Translations get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
Translations get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class TranslationProvider extends BaseTranslationProvider<AppLocale, Translations> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, Translations> of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	Translations get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, Translations> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	late final _StringsOnboardingEn onboarding = _StringsOnboardingEn._(_root);
	late final _StringsRegistrationEn registration = _StringsRegistrationEn._(_root);
	late final _StringsHomeEn home = _StringsHomeEn._(_root);
	late final _StringsBookingEn booking = _StringsBookingEn._(_root);
	late final _StringsAccountEn account = _StringsAccountEn._(_root);
}

// Path: onboarding
class _StringsOnboardingEn {
	_StringsOnboardingEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get skip => 'Skip';
	late final _StringsOnboardingFirstPageEn firstPage = _StringsOnboardingFirstPageEn._(_root);
	late final _StringsOnboardingSecondPageEn secondPage = _StringsOnboardingSecondPageEn._(_root);
	late final _StringsOnboardingThirdPageEn thirdPage = _StringsOnboardingThirdPageEn._(_root);
}

// Path: registration
class _StringsRegistrationEn {
	_StringsRegistrationEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get welcome => 'Welcome';
	String get registerFirst => 'Before enjoying Foodmedia services \nPlease register first';
	late final _StringsRegistrationRegistrationEn registration = _StringsRegistrationRegistrationEn._(_root);
	String get termsAndConditions => 'By logging in or registering, you have agreed to the Terms \nand Conditions and Privacy Policy.';
}

// Path: home
class _StringsHomeEn {
	_StringsHomeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get skip => 'Skip';
	late final _StringsHomeFirstPageEn firstPage = _StringsHomeFirstPageEn._(_root);
	late final _StringsHomeSecondPageEn secondPage = _StringsHomeSecondPageEn._(_root);
	late final _StringsHomeThirdPageEn thirdPage = _StringsHomeThirdPageEn._(_root);
}

// Path: booking
class _StringsBookingEn {
	_StringsBookingEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get skip => 'Skip';
	late final _StringsBookingFirstPageEn firstPage = _StringsBookingFirstPageEn._(_root);
	late final _StringsBookingSecondPageEn secondPage = _StringsBookingSecondPageEn._(_root);
	late final _StringsBookingThirdPageEn thirdPage = _StringsBookingThirdPageEn._(_root);
}

// Path: account
class _StringsAccountEn {
	_StringsAccountEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get skip => 'Skip';
	late final _StringsAccountFirstPageEn firstPage = _StringsAccountFirstPageEn._(_root);
	late final _StringsAccountSecondPageEn secondPage = _StringsAccountSecondPageEn._(_root);
	late final _StringsAccountThirdPageEn thirdPage = _StringsAccountThirdPageEn._(_root);
}

// Path: onboarding.firstPage
class _StringsOnboardingFirstPageEn {
	_StringsOnboardingFirstPageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Nearby restaurants';
	String get description => 'You don\'t have to go far to find a good restaurant,\n we have provided all the restaurants that is\n near you';
}

// Path: onboarding.secondPage
class _StringsOnboardingSecondPageEn {
	_StringsOnboardingSecondPageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Select the Favorites Menu';
	String get description => 'Now eat well, don\'t leave the house,You can\n choose your favorite food only with\n one click';
}

// Path: onboarding.thirdPage
class _StringsOnboardingThirdPageEn {
	_StringsOnboardingThirdPageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Good food at a cheap price';
	String get description => 'You can eat at expensive restaurants with\n affordable price';
}

// Path: registration.registration
class _StringsRegistrationRegistrationEn {
	_StringsRegistrationRegistrationEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get createAccount => 'Create Account';
	String get login => 'Login';
	String get email => 'Email Address';
	String get emailHint => 'Eg namaemail@emailkamu.com';
	String get password => 'Password';
	String get passwordHint => '*********';
	late final _StringsRegistrationRegistrationCreationEn creation = _StringsRegistrationRegistrationCreationEn._(_root);
	late final _StringsRegistrationRegistrationLoggingEn logging = _StringsRegistrationRegistrationLoggingEn._(_root);
}

// Path: home.firstPage
class _StringsHomeFirstPageEn {
	_StringsHomeFirstPageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Nearby restaurants';
	String get description => 'You don\'t have to go far to find a good restaurant,\n we have provided all the restaurants that is\n near you';
}

// Path: home.secondPage
class _StringsHomeSecondPageEn {
	_StringsHomeSecondPageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Select the Favorites Menu';
	String get description => 'Now eat well, don\'t leave the house,You can\n choose your favorite food only with\n one click';
}

// Path: home.thirdPage
class _StringsHomeThirdPageEn {
	_StringsHomeThirdPageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Good food at a cheap price';
	String get description => 'You can eat at expensive restaurants with\n affordable price';
}

// Path: booking.firstPage
class _StringsBookingFirstPageEn {
	_StringsBookingFirstPageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Nearby restaurants';
	String get description => 'You don\'t have to go far to find a good restaurant,\n we have provided all the restaurants that is\n near you';
}

// Path: booking.secondPage
class _StringsBookingSecondPageEn {
	_StringsBookingSecondPageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Select the Favorites Menu';
	String get description => 'Now eat well, don\'t leave the house,You can\n choose your favorite food only with\n one click';
}

// Path: booking.thirdPage
class _StringsBookingThirdPageEn {
	_StringsBookingThirdPageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Good food at a cheap price';
	String get description => 'You can eat at expensive restaurants with\n affordable price';
}

// Path: account.firstPage
class _StringsAccountFirstPageEn {
	_StringsAccountFirstPageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Nearby restaurants';
	String get description => 'You don\'t have to go far to find a good restaurant,\n we have provided all the restaurants that is\n near you';
}

// Path: account.secondPage
class _StringsAccountSecondPageEn {
	_StringsAccountSecondPageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Select the Favorites Menu';
	String get description => 'Now eat well, don\'t leave the house,You can\n choose your favorite food only with\n one click';
}

// Path: account.thirdPage
class _StringsAccountThirdPageEn {
	_StringsAccountThirdPageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Good food at a cheap price';
	String get description => 'You can eat at expensive restaurants with\n affordable price';
}

// Path: registration.registration.creation
class _StringsRegistrationRegistrationCreationEn {
	_StringsRegistrationRegistrationCreationEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Full Name';
	String get nameHint => 'Enter your full name';
	String get createButton => 'Registration';
	String get googleSignUp => 'Sign up with Google';
}

// Path: registration.registration.logging
class _StringsRegistrationRegistrationLoggingEn {
	_StringsRegistrationRegistrationLoggingEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get registeredEmail => 'Enter your registered email below';
	String get success => 'Success';
	late final _StringsRegistrationRegistrationLoggingForgetPasswordEn forgetPassword = _StringsRegistrationRegistrationLoggingForgetPasswordEn._(_root);
	late final _StringsRegistrationRegistrationLoggingChangePasswordEn changePassword = _StringsRegistrationRegistrationLoggingChangePasswordEn._(_root);
	String get signInButton => 'Sign In';
	String get googleLogIn => 'Log in with Google';
}

// Path: registration.registration.logging.forgetPassword
class _StringsRegistrationRegistrationLoggingForgetPasswordEn {
	_StringsRegistrationRegistrationLoggingForgetPasswordEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get forgetPasswordButton => 'Forget Password?';
	String get forgetPasswordTitle => 'Forget Password';
	String get rememberPassword => 'Remember the password? Sign in';
	String get submit => 'Submit';
	String get checkEmail => 'Please check your email for create \na new password';
	String get cantGetEmail => 'Can\'t get email? Resubmit';
	String get backEmail => 'Back Email';
}

// Path: registration.registration.logging.changePassword
class _StringsRegistrationRegistrationLoggingChangePasswordEn {
	_StringsRegistrationRegistrationLoggingChangePasswordEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Change New Password';
	String get forgetPasswordDescription => 'Enter your registered email below';
	String get newPassword => 'New Password';
	String get confirmPassword => 'Confirm Password';
	String get passwordChanged => 'Congratulations your password has\nbeen changed';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'onboarding.skip': return 'Skip';
			case 'onboarding.firstPage.title': return 'Nearby restaurants';
			case 'onboarding.firstPage.description': return 'You don\'t have to go far to find a good restaurant,\n we have provided all the restaurants that is\n near you';
			case 'onboarding.secondPage.title': return 'Select the Favorites Menu';
			case 'onboarding.secondPage.description': return 'Now eat well, don\'t leave the house,You can\n choose your favorite food only with\n one click';
			case 'onboarding.thirdPage.title': return 'Good food at a cheap price';
			case 'onboarding.thirdPage.description': return 'You can eat at expensive restaurants with\n affordable price';
			case 'registration.welcome': return 'Welcome';
			case 'registration.registerFirst': return 'Before enjoying Foodmedia services \nPlease register first';
			case 'registration.registration.createAccount': return 'Create Account';
			case 'registration.registration.login': return 'Login';
			case 'registration.registration.email': return 'Email Address';
			case 'registration.registration.emailHint': return 'Eg namaemail@emailkamu.com';
			case 'registration.registration.password': return 'Password';
			case 'registration.registration.passwordHint': return '*********';
			case 'registration.registration.creation.name': return 'Full Name';
			case 'registration.registration.creation.nameHint': return 'Enter your full name';
			case 'registration.registration.creation.createButton': return 'Registration';
			case 'registration.registration.creation.googleSignUp': return 'Sign up with Google';
			case 'registration.registration.logging.registeredEmail': return 'Enter your registered email below';
			case 'registration.registration.logging.success': return 'Success';
			case 'registration.registration.logging.forgetPassword.forgetPasswordButton': return 'Forget Password?';
			case 'registration.registration.logging.forgetPassword.forgetPasswordTitle': return 'Forget Password';
			case 'registration.registration.logging.forgetPassword.rememberPassword': return 'Remember the password? Sign in';
			case 'registration.registration.logging.forgetPassword.submit': return 'Submit';
			case 'registration.registration.logging.forgetPassword.checkEmail': return 'Please check your email for create \na new password';
			case 'registration.registration.logging.forgetPassword.cantGetEmail': return 'Can\'t get email? Resubmit';
			case 'registration.registration.logging.forgetPassword.backEmail': return 'Back Email';
			case 'registration.registration.logging.changePassword.title': return 'Change New Password';
			case 'registration.registration.logging.changePassword.forgetPasswordDescription': return 'Enter your registered email below';
			case 'registration.registration.logging.changePassword.newPassword': return 'New Password';
			case 'registration.registration.logging.changePassword.confirmPassword': return 'Confirm Password';
			case 'registration.registration.logging.changePassword.passwordChanged': return 'Congratulations your password has\nbeen changed';
			case 'registration.registration.logging.signInButton': return 'Sign In';
			case 'registration.registration.logging.googleLogIn': return 'Log in with Google';
			case 'registration.termsAndConditions': return 'By logging in or registering, you have agreed to the Terms \nand Conditions and Privacy Policy.';
			case 'home.skip': return 'Skip';
			case 'home.firstPage.title': return 'Nearby restaurants';
			case 'home.firstPage.description': return 'You don\'t have to go far to find a good restaurant,\n we have provided all the restaurants that is\n near you';
			case 'home.secondPage.title': return 'Select the Favorites Menu';
			case 'home.secondPage.description': return 'Now eat well, don\'t leave the house,You can\n choose your favorite food only with\n one click';
			case 'home.thirdPage.title': return 'Good food at a cheap price';
			case 'home.thirdPage.description': return 'You can eat at expensive restaurants with\n affordable price';
			case 'booking.skip': return 'Skip';
			case 'booking.firstPage.title': return 'Nearby restaurants';
			case 'booking.firstPage.description': return 'You don\'t have to go far to find a good restaurant,\n we have provided all the restaurants that is\n near you';
			case 'booking.secondPage.title': return 'Select the Favorites Menu';
			case 'booking.secondPage.description': return 'Now eat well, don\'t leave the house,You can\n choose your favorite food only with\n one click';
			case 'booking.thirdPage.title': return 'Good food at a cheap price';
			case 'booking.thirdPage.description': return 'You can eat at expensive restaurants with\n affordable price';
			case 'account.skip': return 'Skip';
			case 'account.firstPage.title': return 'Nearby restaurants';
			case 'account.firstPage.description': return 'You don\'t have to go far to find a good restaurant,\n we have provided all the restaurants that is\n near you';
			case 'account.secondPage.title': return 'Select the Favorites Menu';
			case 'account.secondPage.description': return 'Now eat well, don\'t leave the house,You can\n choose your favorite food only with\n one click';
			case 'account.thirdPage.title': return 'Good food at a cheap price';
			case 'account.thirdPage.description': return 'You can eat at expensive restaurants with\n affordable price';
			default: return null;
		}
	}
}
