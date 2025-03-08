import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   products: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @helloWorld.
  ///
  /// In en, this message translates to:
  /// **'Hello World!'**
  String get helloWorld;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Ahmed'**
  String get name;

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Flower App'**
  String get appName;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @enterYourEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get enterYourEmail;

  /// No description provided for @enterValidEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid email'**
  String get enterValidEmail;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @enterYourPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get enterYourPassword;

  /// No description provided for @enterValidPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid password'**
  String get enterValidPassword;

  /// No description provided for @loginButton.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginButton;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signUp;

  /// No description provided for @continueAsGuest.
  ///
  /// In en, this message translates to:
  /// **'Continue as guest'**
  String get continueAsGuest;

  /// No description provided for @notHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get notHaveAnAccount;

  /// No description provided for @gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// No description provided for @female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// No description provided for @male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// No description provided for @firstName.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstName;

  /// No description provided for @enterYourFirstName.
  ///
  /// In en, this message translates to:
  /// **'Enter your first name'**
  String get enterYourFirstName;

  /// No description provided for @lastName.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get lastName;

  /// No description provided for @enterYourLastName.
  ///
  /// In en, this message translates to:
  /// **'Enter your last name'**
  String get enterYourLastName;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// No description provided for @enterValidUserName.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid username'**
  String get enterValidUserName;

  /// No description provided for @entervalidfirstName.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid first name'**
  String get entervalidfirstName;

  /// No description provided for @entervalidLastName.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid last name'**
  String get entervalidLastName;

  /// No description provided for @passwordNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordNotMatch;

  /// No description provided for @enterValidPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid phone number'**
  String get enterValidPhoneNumber;

  /// No description provided for @phoneNumberLengthError.
  ///
  /// In en, this message translates to:
  /// **'Phone number must be at least 11 digits'**
  String get phoneNumberLengthError;

  /// No description provided for @phoneNumberStartWithZeroError.
  ///
  /// In en, this message translates to:
  /// **'Phone number must start with 0'**
  String get phoneNumberStartWithZeroError;

  /// No description provided for @currentPassword.
  ///
  /// In en, this message translates to:
  /// **'Current Password'**
  String get currentPassword;

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get newPassword;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @update.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// No description provided for @confirmButton.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirmButton;

  /// No description provided for @enterYourConfirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter your confirmation password'**
  String get enterYourConfirmPassword;

  /// No description provided for @emailVerification.
  ///
  /// In en, this message translates to:
  /// **'Email Verification'**
  String get emailVerification;

  /// No description provided for @subTitleOfEmailVerification.
  ///
  /// In en, this message translates to:
  /// **'Please enter the code sent to your email address'**
  String get subTitleOfEmailVerification;

  /// No description provided for @dontReciveCode.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t receive the code?'**
  String get dontReciveCode;

  /// No description provided for @invalidCode.
  ///
  /// In en, this message translates to:
  /// **'Invalid code'**
  String get invalidCode;

  /// No description provided for @enterPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number'**
  String get enterPhoneNumber;

  /// No description provided for @resend.
  ///
  /// In en, this message translates to:
  /// **'Resend'**
  String get resend;

  /// No description provided for @passwordInvalidFormat.
  ///
  /// In en, this message translates to:
  /// **'Invalid password format'**
  String get passwordInvalidFormat;

  /// No description provided for @passwordCharactersLong.
  ///
  /// In en, this message translates to:
  /// **'Minimum 8 characters'**
  String get passwordCharactersLong;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAccount;

  /// No description provided for @agreeTermsConditions.
  ///
  /// In en, this message translates to:
  /// **'By creating an account, you agree to our'**
  String get agreeTermsConditions;

  /// No description provided for @termsConditions.
  ///
  /// In en, this message translates to:
  /// **'Terms & Conditions'**
  String get termsConditions;

  /// No description provided for @passwordIsEmpty.
  ///
  /// In en, this message translates to:
  /// **'Password is empty'**
  String get passwordIsEmpty;

  /// No description provided for @messageLength3.
  ///
  /// In en, this message translates to:
  /// **'Minimum 3 characters'**
  String get messageLength3;

  /// No description provided for @invalidInput.
  ///
  /// In en, this message translates to:
  /// **'Invalid input'**
  String get invalidInput;

  /// No description provided for @emailIsEmpty.
  ///
  /// In en, this message translates to:
  /// **'Email is empty'**
  String get emailIsEmpty;

  /// No description provided for @rememberMe.
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get rememberMe;

  /// No description provided for @invalidEmailOrPassword.
  ///
  /// In en, this message translates to:
  /// **'Invalid email or password'**
  String get invalidEmailOrPassword;

  /// No description provided for @forgetPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get forgetPassword;

  /// No description provided for @forgetPasswordMessageHeader.
  ///
  /// In en, this message translates to:
  /// **'Please enter the email associated with your account'**
  String get forgetPasswordMessageHeader;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPassword;

  /// No description provided for @resetPasswordMessage.
  ///
  /// In en, this message translates to:
  /// **'Password must not be empty and must contain at least 6 characters, an uppercase letter, and one number'**
  String get resetPasswordMessage;

  /// No description provided for @products.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// No description provided for @cart.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get cart;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @egyptCurrency.
  ///
  /// In en, this message translates to:
  /// **'EGP'**
  String get egyptCurrency;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status:'**
  String get status;

  /// No description provided for @taxes.
  ///
  /// In en, this message translates to:
  /// **'All prices include tax'**
  String get taxes;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @bouquetInclude.
  ///
  /// In en, this message translates to:
  /// **'Bouquet Includes'**
  String get bouquetInclude;

  /// No description provided for @addToCart.
  ///
  /// In en, this message translates to:
  /// **'Add to Cart'**
  String get addToCart;

  /// No description provided for @filter.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filter;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @bestSeller.
  ///
  /// In en, this message translates to:
  /// **'Best Seller'**
  String get bestSeller;

  /// No description provided for @bestSellerTitleDescription.
  ///
  /// In en, this message translates to:
  /// **'Bloom with our exquisite best sellers'**
  String get bestSellerTitleDescription;

  /// No description provided for @countryCurrency.
  ///
  /// In en, this message translates to:
  /// **'EGP'**
  String get countryCurrency;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @flowry.
  ///
  /// In en, this message translates to:
  /// **'Flowery'**
  String get flowry;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Deliver to 2XVP+XC - Sheikh Zayed'**
  String get address;

  /// No description provided for @discover.
  ///
  /// In en, this message translates to:
  /// **'Discover something new'**
  String get discover;

  /// No description provided for @graduation.
  ///
  /// In en, this message translates to:
  /// **'It\'s time to celebrate all grads with happiness'**
  String get graduation;

  /// No description provided for @giftNow.
  ///
  /// In en, this message translates to:
  /// **'Gift Now'**
  String get giftNow;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get viewAll;

  /// No description provided for @change.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get change;

  /// No description provided for @occasion.
  ///
  /// In en, this message translates to:
  /// **'Occasion'**
  String get occasion;

  /// No description provided for @errorMsg.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong!'**
  String get errorMsg;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'LOGOUT'**
  String get logout;

  /// No description provided for @confirmLogout.
  ///
  /// In en, this message translates to:
  /// **'Confirm logout!'**
  String get confirmLogout;

  /// No description provided for @cancle.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancle;

  /// No description provided for @logoutS.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logoutS;

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfile;

  /// No description provided for @profileUpdated.
  ///
  /// In en, this message translates to:
  /// **'Profile updated successfully'**
  String get profileUpdated;

  /// No description provided for @passwordChangedSuccessfuly.
  ///
  /// In en, this message translates to:
  /// **'Password changed successfully'**
  String get passwordChangedSuccessfuly;

  /// No description provided for @celebrateSpecialDay.
  ///
  /// In en, this message translates to:
  /// **'Celebrate your special day with us!'**
  String get celebrateSpecialDay;

  /// No description provided for @myOrders.
  ///
  /// In en, this message translates to:
  /// **'My orders'**
  String get myOrders;

  /// No description provided for @savedAddress.
  ///
  /// In en, this message translates to:
  /// **'Saved address'**
  String get savedAddress;

  /// No description provided for @notification.
  ///
  /// In en, this message translates to:
  /// **'Notification'**
  String get notification;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @aboutUs.
  ///
  /// In en, this message translates to:
  /// **'About us'**
  String get aboutUs;

  /// No description provided for @termsAndConditions.
  ///
  /// In en, this message translates to:
  /// **'Terms & conditions'**
  String get termsAndConditions;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'v 6.3.0 - (446)'**
  String get version;

  /// No description provided for @items.
  ///
  /// In en, this message translates to:
  /// **'Items'**
  String get items;

  /// No description provided for @checkout.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get checkout;

  /// No description provided for @deliveredTo.
  ///
  /// In en, this message translates to:
  /// **'Delivered to'**
  String get deliveredTo;

  /// No description provided for @emptyCartMessage.
  ///
  /// In en, this message translates to:
  /// **'Your cart is empty.'**
  String get emptyCartMessage;

  /// No description provided for @whoops.
  ///
  /// In en, this message translates to:
  /// **'Whoops!'**
  String get whoops;

  /// No description provided for @subTotal.
  ///
  /// In en, this message translates to:
  /// **'Sub Total'**
  String get subTotal;

  /// No description provided for @deliveryFee.
  ///
  /// In en, this message translates to:
  /// **'Delivery Fee'**
  String get deliveryFee;

  /// No description provided for @price10.
  ///
  /// In en, this message translates to:
  /// **'10\$'**
  String get price10;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @unknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get unknown;

  /// No description provided for @occasions.
  ///
  /// In en, this message translates to:
  /// **'Occasions'**
  String get occasions;

  /// No description provided for @bloomBestSellers.
  ///
  /// In en, this message translates to:
  /// **'Bloom with exquisite best sellers'**
  String get bloomBestSellers;

  /// No description provided for @currencyEGP.
  ///
  /// In en, this message translates to:
  /// **'EGP'**
  String get currencyEGP;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @addedToCartSuccess.
  ///
  /// In en, this message translates to:
  /// **'Product Added To Cart Successfully'**
  String get addedToCartSuccess;

  /// No description provided for @pinkRoses15.
  ///
  /// In en, this message translates to:
  /// **'Pink roses:15'**
  String get pinkRoses15;

  /// No description provided for @whiteWrap.
  ///
  /// In en, this message translates to:
  /// **'White wrap'**
  String get whiteWrap;

  /// No description provided for @inStock.
  ///
  /// In en, this message translates to:
  /// **'In stock'**
  String get inStock;

  /// No description provided for @loginToPurchase.
  ///
  /// In en, this message translates to:
  /// **'You need to log in to purchase our products.'**
  String get loginToPurchase;

  /// No description provided for @somethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong , please '**
  String get somethingWentWrong;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'2XVP+XC - Sheikh Zayed.....'**
  String get location;

  /// No description provided for @headsUp.
  ///
  /// In en, this message translates to:
  /// **'Heads Up!'**
  String get headsUp;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get ok;

  /// No description provided for @deleteConfirmation.
  ///
  /// In en, this message translates to:
  /// **'You are about to permanently delete this item. Are you sure you want to proceed?'**
  String get deleteConfirmation;

  /// No description provided for @about_us_title.
  ///
  /// In en, this message translates to:
  /// **'About Us'**
  String get about_us_title;

  /// No description provided for @about_us_welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Flowery!'**
  String get about_us_welcome;

  /// No description provided for @about_us_mission_title.
  ///
  /// In en, this message translates to:
  /// **'Our Mission'**
  String get about_us_mission_title;

  /// No description provided for @about_us_mission_content.
  ///
  /// In en, this message translates to:
  /// **'- Bring joy and beauty into your life with our exquisite collection of flowers and gifts.\n- Believe in the power of flowers to brighten up any occasion and make it memorable.'**
  String get about_us_mission_content;

  /// No description provided for @about_us_vision_title.
  ///
  /// In en, this message translates to:
  /// **'Our Vision'**
  String get about_us_vision_title;

  /// No description provided for @about_us_vision_content.
  ///
  /// In en, this message translates to:
  /// **'- Be the leading provider of floral arrangements and gifts.\n- Known for our quality, creativity, and exceptional customer service.\n- Strive to make every purchase a delightful experience for our customers.'**
  String get about_us_vision_content;

  /// No description provided for @about_us_contact_title.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get about_us_contact_title;

  /// No description provided for @about_us_contact_content.
  ///
  /// In en, this message translates to:
  /// **'- Have questions or need assistance? Feel free to reach out to us at:\n- Email: support@flowery.com\n- Phone: +20123456789'**
  String get about_us_contact_content;

  /// No description provided for @terms_title.
  ///
  /// In en, this message translates to:
  /// **'Terms & Conditions'**
  String get terms_title;

  /// No description provided for @terms_welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Flowery!'**
  String get terms_welcome;

  /// No description provided for @terms_agreement_title.
  ///
  /// In en, this message translates to:
  /// **'1. Agreement to Terms'**
  String get terms_agreement_title;

  /// No description provided for @terms_agreement_content.
  ///
  /// In en, this message translates to:
  /// **'By using this application, you agree to follow all rules and policies outlined in this document.'**
  String get terms_agreement_content;

  /// No description provided for @terms_order_title.
  ///
  /// In en, this message translates to:
  /// **'2. Order Availability'**
  String get terms_order_title;

  /// No description provided for @terms_order_content.
  ///
  /// In en, this message translates to:
  /// **'Orders placed through this application are subject to the availability of the items.'**
  String get terms_order_content;

  /// No description provided for @terms_payment_title.
  ///
  /// In en, this message translates to:
  /// **'3. Payment Policy'**
  String get terms_payment_title;

  /// No description provided for @terms_payment_content.
  ///
  /// In en, this message translates to:
  /// **'Payments made for orders are final and non-refundable once the order is confirmed.'**
  String get terms_payment_content;

  /// No description provided for @terms_updates_title.
  ///
  /// In en, this message translates to:
  /// **'4. Updates to Terms'**
  String get terms_updates_title;

  /// No description provided for @terms_updates_content.
  ///
  /// In en, this message translates to:
  /// **'We reserve the right to update or modify these terms and conditions at any time without prior notice.'**
  String get terms_updates_content;

  /// No description provided for @terms_contact.
  ///
  /// In en, this message translates to:
  /// **'For more details, contact support@flowery.com'**
  String get terms_contact;

  /// No description provided for @add_new_address.
  ///
  /// In en, this message translates to:
  /// **'Add New Address'**
  String get add_new_address;

  /// No description provided for @saved_address.
  ///
  /// In en, this message translates to:
  /// **'Saved Address'**
  String get saved_address;

  /// No description provided for @add_address.
  ///
  /// In en, this message translates to:
  /// **'Add Address'**
  String get add_address;

  /// No description provided for @enter_add_address.
  ///
  /// In en, this message translates to:
  /// **'Enter the address'**
  String get enter_add_address;

  /// No description provided for @phone_number.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phone_number;

  /// No description provided for @enter_phone_number.
  ///
  /// In en, this message translates to:
  /// **'Enter the phone number'**
  String get enter_phone_number;

  /// No description provided for @recipient_name.
  ///
  /// In en, this message translates to:
  /// **'Recipient name'**
  String get recipient_name;

  /// No description provided for @enter_recipient_name.
  ///
  /// In en, this message translates to:
  /// **'Enter the recipient name'**
  String get enter_recipient_name;

  /// No description provided for @save_address.
  ///
  /// In en, this message translates to:
  /// **'Save address'**
  String get save_address;

  /// No description provided for @please_select_city.
  ///
  /// In en, this message translates to:
  /// **'Please select a city'**
  String get please_select_city;

  /// No description provided for @city.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// No description provided for @please_select_area.
  ///
  /// In en, this message translates to:
  /// **'Please select an area'**
  String get please_select_area;

  /// No description provided for @area.
  ///
  /// In en, this message translates to:
  /// **'Area'**
  String get area;

  /// No description provided for @something_went_wrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again later.'**
  String get something_went_wrong;

  /// No description provided for @address_added_successfully.
  ///
  /// In en, this message translates to:
  /// **'The address has been successfully added to your saved addresses.'**
  String get address_added_successfully;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
