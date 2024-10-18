// import 'package:flutter/services.dart';
//
// import '/auth/firebase_auth/auth_util.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'login_page_model.dart';
// export 'login_page_model.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:geocoding/geocoding.dart';
//
// class LoginPageWidget extends StatefulWidget {
//   const LoginPageWidget({super.key});
//
//   @override
//   State<LoginPageWidget> createState() => _LoginPageWidgetState();
// }
// class _LoginPageWidgetState extends State<LoginPageWidget> {
//   late LoginPageModel _model;
//   String countryCode = '+971'; // Default country code
//
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//
//   // Mapping of ISO country codes to dialing codes
//   Map<String, String> countryCodeMap = {
//     'AF': '+93',  // Afghanistan
//     'AL': '+355', // Albania
//     'DZ': '+213', // Algeria
//     'AS': '+1684', // American Samoa
//     'AD': '+376', // Andorra
//     'AO': '+244', // Angola
//     'AI': '+1264', // Anguilla
//     'AG': '+1268', // Antigua and Barbuda
//     'AR': '+54',  // Argentina
//     'AM': '+374', // Armenia
//     'AW': '+297', // Aruba
//     'AU': '+61',  // Australia
//     'AT': '+43',  // Austria
//     'AZ': '+994', // Azerbaijan
//     'BS': '+1242', // Bahamas
//     'BH': '+973', // Bahrain
//     'BD': '+880', // Bangladesh
//     'BB': '+1246', // Barbados
//     'BY': '+375', // Belarus
//     'BE': '+32',  // Belgium
//     'BZ': '+501', // Belize
//     'BJ': '+229', // Benin
//     'BM': '+1441', // Bermuda
//     'BT': '+975', // Bhutan
//     'BO': '+591', // Bolivia
//     'BA': '+387', // Bosnia and Herzegovina
//     'BW': '+267', // Botswana
//     'BR': '+55',  // Brazil
//     'IO': '+246', // British Indian Ocean Territory
//     'BN': '+673', // Brunei
//     'BG': '+359', // Bulgaria
//     'BF': '+226', // Burkina Faso
//     'BI': '+257', // Burundi
//     'KH': '+855', // Cambodia
//     'CM': '+237', // Cameroon
//     'CA': '+1',   // Canada
//     'CV': '+238', // Cape Verde
//     'KY': '+1345', // Cayman Islands
//     'CF': '+236', // Central African Republic
//     'TD': '+235', // Chad
//     'CL': '+56',  // Chile
//     'CN': '+86',  // China
//     'CO': '+57',  // Colombia
//     'KM': '+269', // Comoros
//     'CG': '+242', // Congo
//     'CD': '+243', // Congo (Democratic Republic)
//     'CR': '+506', // Costa Rica
//     'HR': '+385', // Croatia
//     'CU': '+53',  // Cuba
//     'CY': '+357', // Cyprus
//     'CZ': '+420', // Czech Republic
//     'DK': '+45',  // Denmark
//     'DJ': '+253', // Djibouti
//     'DM': '+1767', // Dominica
//     'DO': '+1',   // Dominican Republic
//     'EC': '+593', // Ecuador
//     'EG': '+20',  // Egypt
//     'SV': '+503', // El Salvador
//     'GQ': '+240', // Equatorial Guinea
//     'ER': '+291', // Eritrea
//     'EE': '+372', // Estonia
//     'SZ': '+268', // Eswatini
//     'ET': '+251', // Ethiopia
//     'FJ': '+679', // Fiji
//     'FI': '+358', // Finland
//     'FR': '+33',  // France
//     'GA': '+241', // Gabon
//     'GM': '+220', // Gambia
//     'GE': '+995', // Georgia
//     'DE': '+49',  // Germany
//     'GH': '+233', // Ghana
//     'GI': '+350', // Gibraltar
//     'GR': '+30',  // Greece
//     'GL': '+299', // Greenland
//     'GD': '+1473', // Grenada
//     'GU': '+1671', // Guam
//     'GT': '+502', // Guatemala
//     'GN': '+224', // Guinea
//     'GW': '+245', // Guinea-Bissau
//     'GY': '+592', // Guyana
//     'HT': '+509', // Haiti
//     'HN': '+504', // Honduras
//     'HK': '+852', // Hong Kong
//     'HU': '+36',  // Hungary
//     'IS': '+354', // Iceland
//     'IN': '+91',  // India
//     'ID': '+62',  // Indonesia
//     'IR': '+98',  // Iran
//     'IQ': '+964', // Iraq
//     'IE': '+353', // Ireland
//     'IL': '+972', // Israel
//     'IT': '+39',  // Italy
//     'CI': '+225', // Ivory Coast
//     'JM': '+1876', // Jamaica
//     'JP': '+81',  // Japan
//     'JO': '+962', // Jordan
//     'KZ': '+7',   // Kazakhstan
//     'KE': '+254', // Kenya
//     'KI': '+686', // Kiribati
//     'KP': '+850', // North Korea
//     'KR': '+82',  // South Korea
//     'KW': '+965', // Kuwait
//     'KG': '+996', // Kyrgyzstan
//     'LA': '+856', // Laos
//     'LV': '+371', // Latvia
//     'LB': '+961', // Lebanon
//     'LS': '+266', // Lesotho
//     'LR': '+231', // Liberia
//     'LY': '+218', // Libya
//     'LI': '+423', // Liechtenstein
//     'LT': '+370', // Lithuania
//     'LU': '+352', // Luxembourg
//     'MO': '+853', // Macau
//     'MG': '+261', // Madagascar
//     'MW': '+265', // Malawi
//     'MY': '+60',  // Malaysia
//     'MV': '+960', // Maldives
//     'ML': '+223', // Mali
//     'MT': '+356', // Malta
//     'MH': '+692', // Marshall Islands
//     'MR': '+222', // Mauritania
//     'MU': '+230', // Mauritius
//     'MX': '+52',  // Mexico
//     'FM': '+691', // Micronesia
//     'MD': '+373', // Moldova
//     'MC': '+377', // Monaco
//     'MN': '+976', // Mongolia
//     'ME': '+382', // Montenegro
//     'MS': '+1664', // Montserrat
//     'MA': '+212', // Morocco
//     'MZ': '+258', // Mozambique
//     'MM': '+95',  // Myanmar
//     'NA': '+264', // Namibia
//     'NR': '+674', // Nauru
//     'NP': '+977', // Nepal
//     'NL': '+31',  // Netherlands
//     'NZ': '+64',  // New Zealand
//     'NI': '+505', // Nicaragua
//     'NE': '+227', // Niger
//     'NG': '+234', // Nigeria
//     'NO': '+47',  // Norway
//     'OM': '+968', // Oman
//     'PK': '+92',  // Pakistan
//     'PW': '+680', // Palau
//     'PA': '+507', // Panama
//     'PG': '+675', // Papua New Guinea
//     'PY': '+595', // Paraguay
//     'PE': '+51',  // Peru
//     'PH': '+63',  // Philippines
//     'PL': '+48',  // Poland
//     'PT': '+351', // Portugal
//     'PR': '+1',   // Puerto Rico
//     'QA': '+974', // Qatar
//     'RO': '+40',  // Romania
//     'RU': '+7',   // Russia
//     'RW': '+250', // Rwanda
//     'KN': '+1869', // Saint Kitts and Nevis
//     'LC': '+1758', // Saint Lucia
//     'VC': '+1784', // Saint Vincent and the Grenadines
//     'WS': '+685', // Samoa
//     'SM': '+378', // San Marino
//     'ST': '+239', // Sao Tome and Principe
//     'SA': '+966', // Saudi Arabia
//     'SN': '+221', // Senegal
//     'RS': '+381', // Serbia
//     'SC': '+248', // Seychelles
//     'SL': '+232', // Sierra Leone
//     'SG': '+65',  // Singapore
//     'SK': '+421', // Slovakia
//     'SI': '+386', // Slovenia
//     'SB': '+677', // Solomon Islands
//     'SO': '+252', // Somalia
//     'ZA': '+27',  // South Africa
//     'SS': '+211', // South Sudan
//     'ES': '+34',  // Spain
//     'LK': '+94',  // Sri Lanka
//     'SD': '+249', // Sudan
//     'SR': '+597', // Suriname
//     'SE': '+46',  // Sweden
//     'CH': '+41',  // Switzerland
//     'SY': '+963', // Syria
//     'TW': '+886', // Taiwan
//     'TJ': '+992', // Tajikistan
//     'TZ': '+255', // Tanzania
//     'TH': '+66',  // Thailand
//     'TL': '+670', // Timor-Leste
//     'TG': '+228', // Togo
//     'TO': '+676', // Tonga
//     'TT': '+1868', // Trinidad and Tobago
//     'TN': '+216', // Tunisia
//     'TR': '+90',  // Turkey
//     'TM': '+993', // Turkmenistan
//     'TV': '+688', // Tuvalu
//     'UG': '+256', // Uganda
//     'UA': '+380', // Ukraine
//     'AE': '+971', // United Arab Emirates
//     'GB': '+44',  // United Kingdom
//     'US': '+1',   // United States
//     'UY': '+598', // Uruguay
//     'UZ': '+998', // Uzbekistan
//     'VU': '+678', // Vanuatu
//     'VA': '+379', // Vatican City
//     'VE': '+58',  // Venezuela
//     'VN': '+84',  // Vietnam
//     'YE': '+967', // Yemen
//     'ZM': '+260', // Zambia
//     'ZW': '+263', // Zimbabwe
//   };
//
//   @override
//   void initState() {
//     super.initState();
//     _model = createModel(context, () => LoginPageModel());
//
//     _model.textController ??= TextEditingController();
//     _model.textFieldFocusNode ??= FocusNode();
//
//     authManager.handlePhoneAuthStateChanges(context);
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _getUserLocation(); // Fetch the user's location and country code
//     });
//
//     _model.textController?.addListener(() {
//       final text = _model.textController.text;
//
//       // Allow users to delete or manually edit the country code
//       if (text.isEmpty) {
//         // Automatically insert the country code if the field is empty
//         _model.textController.text = countryCode;
//         _model.textController?.selection = TextSelection.fromPosition(TextPosition(offset: countryCode.length));
//       }
//       //else if (!text.startsWith(countryCode)) {
//       //If the text doesn't start with the country code, add it while keeping the rest of the input
//       //_model.textController.text = countryCode + text;
//       //_model.textController?.selection = TextSelection.fromPosition(TextPosition(offset: _model.textController.text.length));
//       //}
//     });
//   }
//
//   Future<void> _getUserLocation() async {
//     LocationPermission permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission != LocationPermission.whileInUse && permission != LocationPermission.always) {
//         return; // Permission denied
//       }
//     }
//
//     Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//     List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
//     if (placemarks.isNotEmpty) {
//       String isoCountryCode = placemarks[0].isoCountryCode!;
//       setState(() {
//         // Use the mapping to get the dialing code
//         countryCode = countryCodeMap[isoCountryCode] ?? '+971'; // Default to +971 if not found
//         if (_model.textController.text.isEmpty) {
//           _model.textController.text = countryCode; // Set the text field with the country code
//         }
//       });
//     }
//   }
//   @override
//   void dispose() {
//     _model.dispose();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => FocusScope.of(context).unfocus(),
//       child: Scaffold(
//         key: scaffoldKey,
//         backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
//         body: SafeArea(
//           top: true,
//           child: Padding(
//             padding: const EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 0.0),
//             child: SizedBox(
//               width: double.infinity,
//               height: double.infinity,
//               child: Stack(
//                 children: [
//                   Align(
//                     alignment: const AlignmentDirectional(0.0, 0.0),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.max,
//                       children: [
//                         Align(
//                           alignment: const AlignmentDirectional(0.0, 0.0),
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(8.0),
//                             child: Image.asset(
//                               'assets/images/Logo_-_default_style.png',
//                               width: 268.0,
//                               height: 50.0,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           width: 358.0,
//                           height: 350.0,
//                           child: Stack(
//                             children: [
//                               Align(
//                                 alignment: const AlignmentDirectional(0.0, -0.29),
//                                 child: Padding(
//                                   padding: const EdgeInsetsDirectional.fromSTEB(
//                                       15.0, 0.0, 15.0, 0.0),
//                                   child: Container(
//                                     width: double.infinity,
//                                     height: 90.0,
//                                     decoration: const BoxDecoration(),
//                                     child: Column(
//                                       mainAxisSize: MainAxisSize.max,
//                                       mainAxisAlignment:
//                                       MainAxisAlignment.center,
//                                       children: [
//                                         Align(
//                                           alignment:
//                                           const AlignmentDirectional(-1.0, 0.0),
//                                           child: Text(
//                                             FFLocalizations.of(context).getText(
//                                               'yn4aea2v' /* Enter your mobile number */,
//                                             ),
//                                             style: FlutterFlowTheme.of(context)
//                                                 .bodyMedium
//                                                 .override(
//                                               fontFamily: 'Montserrat',
//                                               color: Colors.black,
//                                               fontSize: 14.0,
//                                               letterSpacing: 0.0,
//                                               fontWeight: FontWeight.normal,
//                                               lineHeight: 1.5,
//                                             ),
//                                           ),
//                                         ),
//                                         Align(
//                                           alignment:
//                                           const AlignmentDirectional(-1.0, 0.0),
//                                           child: Padding(
//                                             padding:
//                                             const EdgeInsetsDirectional.fromSTEB(
//                                                 0.0, 10.0, 0.0, 0.0),
//                                             child: Text(
//                                               FFLocalizations.of(context)
//                                                   .getText(
//                                                 '5t8s4y4s' /* Type in your mobile number to ... */,
//                                               ),
//                                               style:
//                                               FlutterFlowTheme.of(context)
//                                                   .bodyMedium
//                                                   .override(
//                                                 fontFamily: 'Jaldi',
//                                                 fontSize: 15.0,
//                                                 letterSpacing: 0.0,
//                                                 lineHeight: 1.2,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Align(
//                                 alignment: const AlignmentDirectional(0.0, 0.28),
//                                 child: Padding(
//                                   padding: const EdgeInsetsDirectional.fromSTEB(
//                                       15.0, 0.0, 15.0, 0.0),
//                                   child: Container(
//                                     width: double.infinity,
//                                     height: 66.0,
//                                     decoration: BoxDecoration(
//                                       color: Colors.white,
//                                       borderRadius: const BorderRadius.only(
//                                         bottomLeft: Radius.circular(5.0),
//                                         bottomRight: Radius.circular(5.0),
//                                         topLeft: Radius.circular(5.0),
//                                         topRight: Radius.circular(5.0),
//                                       ),
//                                       border: Border.all(
//                                         color: FlutterFlowTheme.of(context)
//                                             .alternate,
//                                       ),
//                                     ),
//                                     child: Align(
//                                       alignment:
//                                       const AlignmentDirectional(0.0, 0.14),
//                                       child: Padding(
//                                         padding: const EdgeInsetsDirectional.fromSTEB(
//                                             20.0, 0.0, 20.0, 0.0),
//                                         child: InkWell(
//                                           splashColor: Colors.transparent,
//                                           focusColor: Colors.transparent,
//                                           hoverColor: Colors.transparent,
//                                           highlightColor: Colors.transparent,
//                                           onTap: () async {
//                                             FFAppState().Phonenumber =
//                                                 _model.textController.text;
//                                             safeSetState(() {});
//                                           },
//                                           child: Row(
//                                             mainAxisSize: MainAxisSize.max,
//                                             children: [
//                                               const FaIcon(
//                                                 FontAwesomeIcons.mobileAlt,
//                                                 color: Color(0xFFD2D2D2),
//                                                 size: 24.0,
//                                               ),
//                                               Expanded(
//                                                 child: Padding(
//                                                   padding: const EdgeInsetsDirectional
//                                                       .fromSTEB(
//                                                       8.0, 0.0, 8.0, 0.0),
//                                                   child: SizedBox(
//                                                     width: 200.0,
//                                                     child: TextFormField(
//                                                         controller:
//                                                         _model.textController,
//                                                         focusNode: _model
//                                                             .textFieldFocusNode,
//                                                         autofocus: false,
//                                                         obscureText: false,
//                                                         decoration:
//                                                         InputDecoration(
//                                                           isDense: true,
//                                                           labelStyle:
//                                                           FlutterFlowTheme.of(
//                                                               context)
//                                                               .labelMedium
//                                                               .override(
//                                                             fontFamily:
//                                                             'Readex Pro',
//                                                             letterSpacing:
//                                                             0.0,
//                                                           ),
//                                                           hintText:
//                                                           FFLocalizations.of(
//                                                               context)
//                                                               .getText(
//                                                             'o0oqu2if' /* Mobile Number */,
//                                                           ),
//                                                           hintStyle:
//                                                           FlutterFlowTheme.of(
//                                                               context)
//                                                               .labelMedium
//                                                               .override(
//                                                             fontFamily:
//                                                             'Jaldi',
//                                                             color: const Color(
//                                                                 0xFFD2D2D2),
//                                                             fontSize:
//                                                             16.0,
//                                                             letterSpacing:
//                                                             0.0,
//                                                           ),
//                                                           enabledBorder:
//                                                           InputBorder.none,
//                                                           focusedBorder:
//                                                           InputBorder.none,
//                                                           errorBorder:
//                                                           InputBorder.none,
//                                                           focusedErrorBorder:
//                                                           InputBorder.none,
//                                                           filled: true,
//                                                           fillColor: FlutterFlowTheme
//                                                               .of(context)
//                                                               .secondaryBackground,
//                                                         ),
//                                                         style: FlutterFlowTheme
//                                                             .of(context)
//                                                             .bodyMedium
//                                                             .override(
//                                                           fontFamily:
//                                                           'Readex Pro',
//                                                           letterSpacing: 0.0,
//                                                         ),
//                                                         keyboardType:
//                                                         TextInputType.phone,
//                                                         cursorColor:
//                                                         FlutterFlowTheme.of(
//                                                             context)
//                                                             .primaryText,
//                                                         validator: _model
//                                                             .textControllerValidator
//                                                             .asValidator(context),
//                                                         inputFormatters: [
//                                                           //_model.textFieldMask
//                                                           // No specific formatter is added here to ensure backspace works
//                                                           //FilteringTextInputFormatter.digitsOnly, // Allow only digits
//                                                         ],
//                                                         onChanged: (value) {
//                                                           // Allow manual editing of the country code and rest of the numberif (!value.startsWith(countryCode)) {
//                                                           //_model.textController.text = countryCode + value.replaceFirst(countryCode, '');
//                                                           _model.textController?.selection = TextSelection.fromPosition(TextPosition(offset: _model.textController.text.length));
//                                                         }//
//                                                       //},
//
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Align(
//                     alignment: const AlignmentDirectional(0.0, 1.0),
//                     child: Padding(
//                       padding:
//                       const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 15.0),
//                       child: FFButtonWidget(
//                         onPressed: () async {
//                           final phoneNumberVal = _model.textController.text;
//                           if (phoneNumberVal.isEmpty ||
//                               !phoneNumberVal.startsWith('+')) {
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               const SnackBar(
//                                 content: Text(
//                                     'Phone Number is required and has to start with +.'),
//                               ),
//                             );
//                             return;
//                           }
//                           await authManager.beginPhoneAuth(
//                             context: context,
//                             phoneNumber: phoneNumberVal,
//                             onCodeSent: (context) async {
//                               context.goNamedAuth(
//                                 'otp',
//                                 context.mounted,
//                                 ignoreRedirect: true,
//                               );
//                             },
//                           );
//                         },
//                         text: FFLocalizations.of(context).getText(
//                           '0tfpy6v1' /* Confirm */,
//                         ),
//                         options: FFButtonOptions(
//                           width: 390.0,
//                           height: 50.0,
//                           padding: const EdgeInsetsDirectional.fromSTEB(
//                               24.0, 0.0, 24.0, 0.0),
//                           iconPadding: const EdgeInsetsDirectional.fromSTEB(
//                               0.0, 0.0, 0.0, 0.0),
//                           color: const Color(0xFFFFA800),
//                           textStyle:
//                           FlutterFlowTheme.of(context).titleSmall.override(
//                             fontFamily: 'Jaldi',
//                             color: Colors.white,
//                             fontSize: 17.0,
//                             letterSpacing: 0.0,
//                             fontWeight: FontWeight.normal,
//                           ),
//                           elevation: 3.0,
//                           borderSide: const BorderSide(
//                             color: Colors.transparent,
//                             width: 1.0,
//                           ),
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

//Above is the original working code
//below is for checking for validations

// import 'package:flutter/services.dart';
//
// import '/auth/firebase_auth/auth_util.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'login_page_model.dart';
// export 'login_page_model.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:geocoding/geocoding.dart';
//
// class LoginPageWidget extends StatefulWidget {
//   const LoginPageWidget({super.key});
//
//   @override
//   State<LoginPageWidget> createState() => _LoginPageWidgetState();
// }
// class _LoginPageWidgetState extends State<LoginPageWidget> {
//   late LoginPageModel _model;
//   String countryCode = '+971'; // Default country code
//
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//
//   // Mapping of ISO country codes to dialing codes
//   Map<String, String> countryCodeMap = {
//     'AF': '+93',  // Afghanistan
//     'AL': '+355', // Albania
//     'DZ': '+213', // Algeria
//     'AS': '+1684', // American Samoa
//     'AD': '+376', // Andorra
//     'AO': '+244', // Angola
//     'AI': '+1264', // Anguilla
//     'AG': '+1268', // Antigua and Barbuda
//     'AR': '+54',  // Argentina
//     'AM': '+374', // Armenia
//     'AW': '+297', // Aruba
//     'AU': '+61',  // Australia
//     'AT': '+43',  // Austria
//     'AZ': '+994', // Azerbaijan
//     'BS': '+1242', // Bahamas
//     'BH': '+973', // Bahrain
//     'BD': '+880', // Bangladesh
//     'BB': '+1246', // Barbados
//     'BY': '+375', // Belarus
//     'BE': '+32',  // Belgium
//     'BZ': '+501', // Belize
//     'BJ': '+229', // Benin
//     'BM': '+1441', // Bermuda
//     'BT': '+975', // Bhutan
//     'BO': '+591', // Bolivia
//     'BA': '+387', // Bosnia and Herzegovina
//     'BW': '+267', // Botswana
//     'BR': '+55',  // Brazil
//     'IO': '+246', // British Indian Ocean Territory
//     'BN': '+673', // Brunei
//     'BG': '+359', // Bulgaria
//     'BF': '+226', // Burkina Faso
//     'BI': '+257', // Burundi
//     'KH': '+855', // Cambodia
//     'CM': '+237', // Cameroon
//     'CA': '+1',   // Canada
//     'CV': '+238', // Cape Verde
//     'KY': '+1345', // Cayman Islands
//     'CF': '+236', // Central African Republic
//     'TD': '+235', // Chad
//     'CL': '+56',  // Chile
//     'CN': '+86',  // China
//     'CO': '+57',  // Colombia
//     'KM': '+269', // Comoros
//     'CG': '+242', // Congo
//     'CD': '+243', // Congo (Democratic Republic)
//     'CR': '+506', // Costa Rica
//     'HR': '+385', // Croatia
//     'CU': '+53',  // Cuba
//     'CY': '+357', // Cyprus
//     'CZ': '+420', // Czech Republic
//     'DK': '+45',  // Denmark
//     'DJ': '+253', // Djibouti
//     'DM': '+1767', // Dominica
//     'DO': '+1',   // Dominican Republic
//     'EC': '+593', // Ecuador
//     'EG': '+20',  // Egypt
//     'SV': '+503', // El Salvador
//     'GQ': '+240', // Equatorial Guinea
//     'ER': '+291', // Eritrea
//     'EE': '+372', // Estonia
//     'SZ': '+268', // Eswatini
//     'ET': '+251', // Ethiopia
//     'FJ': '+679', // Fiji
//     'FI': '+358', // Finland
//     'FR': '+33',  // France
//     'GA': '+241', // Gabon
//     'GM': '+220', // Gambia
//     'GE': '+995', // Georgia
//     'DE': '+49',  // Germany
//     'GH': '+233', // Ghana
//     'GI': '+350', // Gibraltar
//     'GR': '+30',  // Greece
//     'GL': '+299', // Greenland
//     'GD': '+1473', // Grenada
//     'GU': '+1671', // Guam
//     'GT': '+502', // Guatemala
//     'GN': '+224', // Guinea
//     'GW': '+245', // Guinea-Bissau
//     'GY': '+592', // Guyana
//     'HT': '+509', // Haiti
//     'HN': '+504', // Honduras
//     'HK': '+852', // Hong Kong
//     'HU': '+36',  // Hungary
//     'IS': '+354', // Iceland
//     'IN': '+91',  // India
//     'ID': '+62',  // Indonesia
//     'IR': '+98',  // Iran
//     'IQ': '+964', // Iraq
//     'IE': '+353', // Ireland
//     'IL': '+972', // Israel
//     'IT': '+39',  // Italy
//     'CI': '+225', // Ivory Coast
//     'JM': '+1876', // Jamaica
//     'JP': '+81',  // Japan
//     'JO': '+962', // Jordan
//     'KZ': '+7',   // Kazakhstan
//     'KE': '+254', // Kenya
//     'KI': '+686', // Kiribati
//     'KP': '+850', // North Korea
//     'KR': '+82',  // South Korea
//     'KW': '+965', // Kuwait
//     'KG': '+996', // Kyrgyzstan
//     'LA': '+856', // Laos
//     'LV': '+371', // Latvia
//     'LB': '+961', // Lebanon
//     'LS': '+266', // Lesotho
//     'LR': '+231', // Liberia
//     'LY': '+218', // Libya
//     'LI': '+423', // Liechtenstein
//     'LT': '+370', // Lithuania
//     'LU': '+352', // Luxembourg
//     'MO': '+853', // Macau
//     'MG': '+261', // Madagascar
//     'MW': '+265', // Malawi
//     'MY': '+60',  // Malaysia
//     'MV': '+960', // Maldives
//     'ML': '+223', // Mali
//     'MT': '+356', // Malta
//     'MH': '+692', // Marshall Islands
//     'MR': '+222', // Mauritania
//     'MU': '+230', // Mauritius
//     'MX': '+52',  // Mexico
//     'FM': '+691', // Micronesia
//     'MD': '+373', // Moldova
//     'MC': '+377', // Monaco
//     'MN': '+976', // Mongolia
//     'ME': '+382', // Montenegro
//     'MS': '+1664', // Montserrat
//     'MA': '+212', // Morocco
//     'MZ': '+258', // Mozambique
//     'MM': '+95',  // Myanmar
//     'NA': '+264', // Namibia
//     'NR': '+674', // Nauru
//     'NP': '+977', // Nepal
//     'NL': '+31',  // Netherlands
//     'NZ': '+64',  // New Zealand
//     'NI': '+505', // Nicaragua
//     'NE': '+227', // Niger
//     'NG': '+234', // Nigeria
//     'NO': '+47',  // Norway
//     'OM': '+968', // Oman
//     'PK': '+92',  // Pakistan
//     'PW': '+680', // Palau
//     'PA': '+507', // Panama
//     'PG': '+675', // Papua New Guinea
//     'PY': '+595', // Paraguay
//     'PE': '+51',  // Peru
//     'PH': '+63',  // Philippines
//     'PL': '+48',  // Poland
//     'PT': '+351', // Portugal
//     'PR': '+1',   // Puerto Rico
//     'QA': '+974', // Qatar
//     'RO': '+40',  // Romania
//     'RU': '+7',   // Russia
//     'RW': '+250', // Rwanda
//     'KN': '+1869', // Saint Kitts and Nevis
//     'LC': '+1758', // Saint Lucia
//     'VC': '+1784', // Saint Vincent and the Grenadines
//     'WS': '+685', // Samoa
//     'SM': '+378', // San Marino
//     'ST': '+239', // Sao Tome and Principe
//     'SA': '+966', // Saudi Arabia
//     'SN': '+221', // Senegal
//     'RS': '+381', // Serbia
//     'SC': '+248', // Seychelles
//     'SL': '+232', // Sierra Leone
//     'SG': '+65',  // Singapore
//     'SK': '+421', // Slovakia
//     'SI': '+386', // Slovenia
//     'SB': '+677', // Solomon Islands
//     'SO': '+252', // Somalia
//     'ZA': '+27',  // South Africa
//     'SS': '+211', // South Sudan
//     'ES': '+34',  // Spain
//     'LK': '+94',  // Sri Lanka
//     'SD': '+249', // Sudan
//     'SR': '+597', // Suriname
//     'SE': '+46',  // Sweden
//     'CH': '+41',  // Switzerland
//     'SY': '+963', // Syria
//     'TW': '+886', // Taiwan
//     'TJ': '+992', // Tajikistan
//     'TZ': '+255', // Tanzania
//     'TH': '+66',  // Thailand
//     'TL': '+670', // Timor-Leste
//     'TG': '+228', // Togo
//     'TO': '+676', // Tonga
//     'TT': '+1868', // Trinidad and Tobago
//     'TN': '+216', // Tunisia
//     'TR': '+90',  // Turkey
//     'TM': '+993', // Turkmenistan
//     'TV': '+688', // Tuvalu
//     'UG': '+256', // Uganda
//     'UA': '+380', // Ukraine
//     'AE': '+971', // United Arab Emirates
//     'GB': '+44',  // United Kingdom
//     'US': '+1',   // United States
//     'UY': '+598', // Uruguay
//     'UZ': '+998', // Uzbekistan
//     'VU': '+678', // Vanuatu
//     'VA': '+379', // Vatican City
//     'VE': '+58',  // Venezuela
//     'VN': '+84',  // Vietnam
//     'YE': '+967', // Yemen
//     'ZM': '+260', // Zambia
//     'ZW': '+263', // Zimbabwe
//   };
//
//   @override
//   void initState() {
//     super.initState();
//     _model = createModel(context, () => LoginPageModel());
//
//     _model.textController ??= TextEditingController();
//     _model.textFieldFocusNode ??= FocusNode();
//
//     authManager.handlePhoneAuthStateChanges(context);
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _getUserLocation(); // Fetch the user's location and country code
//     });
//
//     _model.textController?.addListener(() {
//       final text = _model.textController.text;
//
//       // Allow users to delete or manually edit the country code
//       if (text.isEmpty) {
//         // Automatically insert the country code if the field is empty
//         _model.textController.text = countryCode;
//         _model.textController?.selection = TextSelection.fromPosition(TextPosition(offset: countryCode.length));
//       }
//       //else if (!text.startsWith(countryCode)) {
//       //If the text doesn't start with the country code, add it while keeping the rest of the input
//       //_model.textController.text = countryCode + text;
//       //_model.textController?.selection = TextSelection.fromPosition(TextPosition(offset: _model.textController.text.length));
//       //}
//     });
//   }
//
//   Future<void> _getUserLocation() async {
//     LocationPermission permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission != LocationPermission.whileInUse && permission != LocationPermission.always) {
//         return; // Permission denied
//       }
//     }
//
//     Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//     List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
//     if (placemarks.isNotEmpty) {
//       String isoCountryCode = placemarks[0].isoCountryCode!;
//       setState(() {
//         // Use the mapping to get the dialing code
//         countryCode = countryCodeMap[isoCountryCode] ?? '+971'; // Default to +971 if not found
//         if (_model.textController.text.isEmpty) {
//           _model.textController.text = countryCode; // Set the text field with the country code
//         }
//       });
//     }
//   }
//   @override
//   void dispose() {
//     _model.dispose();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => FocusScope.of(context).unfocus(),
//       child: Scaffold(
//         key: scaffoldKey,
//         backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
//         body: SafeArea(
//           top: true,
//           child: Padding(
//             padding: const EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 0.0),
//             child: SizedBox(
//               width: double.infinity,
//               height: double.infinity,
//               child: Stack(
//                 children: [
//                   Align(
//                     alignment: const AlignmentDirectional(0.0, 0.0),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.max,
//                       children: [
//                         Align(
//                           alignment: const AlignmentDirectional(0.0, 0.0),
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(8.0),
//                             child: Image.asset(
//                               'assets/images/Logo_-_default_style.png',
//                               width: 268.0,
//                               height: 50.0,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           width: 358.0,
//                           height: 350.0,
//                           child: Stack(
//                             children: [
//                               Align(
//                                 alignment: const AlignmentDirectional(0.0, -0.29),
//                                 child: Padding(
//                                   padding: const EdgeInsetsDirectional.fromSTEB(
//                                       15.0, 0.0, 15.0, 0.0),
//                                   child: Container(
//                                     width: double.infinity,
//                                     height: 90.0,
//                                     decoration: const BoxDecoration(),
//                                     child: Column(
//                                       mainAxisSize: MainAxisSize.max,
//                                       mainAxisAlignment:
//                                       MainAxisAlignment.center,
//                                       children: [
//                                         Align(
//                                           alignment:
//                                           const AlignmentDirectional(-1.0, 0.0),
//                                           child: Text(
//                                             FFLocalizations.of(context).getText(
//                                               'yn4aea2v' /* Enter your mobile number */,
//                                             ),
//                                             style: FlutterFlowTheme.of(context)
//                                                 .bodyMedium
//                                                 .override(
//                                               fontFamily: 'Montserrat',
//                                               color: Colors.black,
//                                               fontSize: 14.0,
//                                               letterSpacing: 0.0,
//                                               fontWeight: FontWeight.normal,
//                                               lineHeight: 1.5,
//                                             ),
//                                           ),
//                                         ),
//                                         Align(
//                                           alignment:
//                                           const AlignmentDirectional(-1.0, 0.0),
//                                           child: Padding(
//                                             padding:
//                                             const EdgeInsetsDirectional.fromSTEB(
//                                                 0.0, 10.0, 0.0, 0.0),
//                                             child: Text(
//                                               FFLocalizations.of(context)
//                                                   .getText(
//                                                 '5t8s4y4s' /* Type in your mobile number to ... */,
//                                               ),
//                                               style:
//                                               FlutterFlowTheme.of(context)
//                                                   .bodyMedium
//                                                   .override(
//                                                 fontFamily: 'Jaldi',
//                                                 fontSize: 15.0,
//                                                 letterSpacing: 0.0,
//                                                 lineHeight: 1.2,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Align(
//                                 alignment: const AlignmentDirectional(0.0, 0.28),
//                                 child: Padding(
//                                   padding: const EdgeInsetsDirectional.fromSTEB(
//                                       15.0, 0.0, 15.0, 0.0),
//                                   child: Container(
//                                     width: double.infinity,
//                                     height: 66.0,
//                                     decoration: BoxDecoration(
//                                       color: Colors.white,
//                                       borderRadius: const BorderRadius.only(
//                                         bottomLeft: Radius.circular(5.0),
//                                         bottomRight: Radius.circular(5.0),
//                                         topLeft: Radius.circular(5.0),
//                                         topRight: Radius.circular(5.0),
//                                       ),
//                                       border: Border.all(
//                                         color: FlutterFlowTheme.of(context)
//                                             .alternate,
//                                       ),
//                                     ),
//                                     child: Align(
//                                       alignment:
//                                       const AlignmentDirectional(0.0, 0.14),
//                                       child: Padding(
//                                         padding: const EdgeInsetsDirectional.fromSTEB(
//                                             20.0, 0.0, 20.0, 0.0),
//                                         child: InkWell(
//                                           splashColor: Colors.transparent,
//                                           focusColor: Colors.transparent,
//                                           hoverColor: Colors.transparent,
//                                           highlightColor: Colors.transparent,
//                                           onTap: () async {
//                                             FFAppState().Phonenumber =
//                                                 _model.textController.text;
//                                             safeSetState(() {});
//                                           },
//                                           child: Row(
//                                             mainAxisSize: MainAxisSize.max,
//                                             children: [
//                                               const FaIcon(
//                                                 FontAwesomeIcons.mobileAlt,
//                                                 color: Color(0xFFD2D2D2),
//                                                 size: 24.0,
//                                               ),
//                                               Expanded(
//                                                 child: Padding(
//                                                   padding: const EdgeInsetsDirectional
//                                                       .fromSTEB(
//                                                       8.0, 0.0, 8.0, 0.0),
//                                                   child: SizedBox(
//                                                     width: 200.0,
//                                                     child: TextFormField(
//                                                         controller:
//                                                         _model.textController,
//                                                         focusNode: _model
//                                                             .textFieldFocusNode,
//                                                         autofocus: false,
//                                                         obscureText: false,
//                                                         decoration:
//                                                         InputDecoration(
//                                                           isDense: true,
//                                                           labelStyle:
//                                                           FlutterFlowTheme.of(
//                                                               context)
//                                                               .labelMedium
//                                                               .override(
//                                                             fontFamily:
//                                                             'Readex Pro',
//                                                             letterSpacing:
//                                                             0.0,
//                                                           ),
//                                                           hintText:
//                                                           FFLocalizations.of(
//                                                               context)
//                                                               .getText(
//                                                             'o0oqu2if' /* Mobile Number */,
//                                                           ),
//                                                           hintStyle:
//                                                           FlutterFlowTheme.of(
//                                                               context)
//                                                               .labelMedium
//                                                               .override(
//                                                             fontFamily:
//                                                             'Jaldi',
//                                                             color: const Color(
//                                                                 0xFFD2D2D2),
//                                                             fontSize:
//                                                             16.0,
//                                                             letterSpacing:
//                                                             0.0,
//                                                           ),
//                                                           enabledBorder:
//                                                           InputBorder.none,
//                                                           focusedBorder:
//                                                           InputBorder.none,
//                                                           errorBorder:
//                                                           InputBorder.none,
//                                                           focusedErrorBorder:
//                                                           InputBorder.none,
//                                                           filled: true,
//                                                           fillColor: FlutterFlowTheme
//                                                               .of(context)
//                                                               .secondaryBackground,
//                                                         ),
//                                                         style: FlutterFlowTheme
//                                                             .of(context)
//                                                             .bodyMedium
//                                                             .override(
//                                                           fontFamily:
//                                                           'Readex Pro',
//                                                           letterSpacing: 0.0,
//                                                         ),
//                                                         keyboardType:
//                                                         TextInputType.phone,
//                                                         cursorColor:
//                                                         FlutterFlowTheme.of(
//                                                             context)
//                                                             .primaryText,
//                                                         validator: _model
//                                                             .textControllerValidator
//                                                             .asValidator(context),
//                                                         inputFormatters: [
//                                                           //_model.textFieldMask
//                                                           // No specific formatter is added here to ensure backspace works
//                                                           //FilteringTextInputFormatter.digitsOnly, // Allow only digits
//                                                         ],
//                                                         onChanged: (value) {
//                                                           // Allow manual editing of the country code and rest of the numberif (!value.startsWith(countryCode)) {
//                                                           //_model.textController.text = countryCode + value.replaceFirst(countryCode, '');
//                                                           _model.textController?.selection = TextSelection.fromPosition(TextPosition(offset: _model.textController.text.length));
//                                                         }//
//                                                       //},
//
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Align(
//                     alignment: const AlignmentDirectional(0.0, 1.0),
//                     child: Padding(
//                       padding:
//                       const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 15.0),
//                       child: FFButtonWidget(
//                         onPressed: () async {
//                           FFAppState().Phonenumber = _model.textController.text;
//                           safeSetState(() {});
//                           final phoneNumberVal = _model.textController.text;
//
//                           // Check if the phone number is not empty and starts with '+'
//                           if (!phoneNumberVal.isEmpty && phoneNumberVal.startsWith('+')) {
//                             final List<String> validCountryCodes = ['+1', '+91', '+44', '+81', '+971']; // Add valid country codes
//
//                             // Find the country code from the list that matches the start of the phone number
//                             String countryCode = validCountryCodes.firstWhere(
//                                   (code) => phoneNumberVal.startsWith(code),
//                               orElse: () => '',
//                             );
//
//                             if (countryCode.isNotEmpty) {
//                               // Extract mobile number by removing the country code
//                               String mobileNumber = phoneNumberVal.substring(countryCode.length);
//
//                               // Define the valid length for mobile numbers (You can customize per country if needed)
//                               int mobileNumberLength = 10;  // You can modify this based on country
//
//                               print('Country Code: $countryCode');
//                               print('Mobile Number: $mobileNumber');
//
//                               // Validate mobile number: ensure it's all digits and has the correct length
//                               if (RegExp(r'^\d+$').hasMatch(mobileNumber) && mobileNumber.length == mobileNumberLength) {
//                                 // Proceed with the OTP process if all validations are successful
//                                 await authManager.beginPhoneAuth(
//                                   context: context,
//                                   phoneNumber: phoneNumberVal,
//                                   onCodeSent: (context) async {
//                                     context.goNamedAuth(
//                                       'otp',
//                                       context.mounted,
//                                       ignoreRedirect: true,
//                                     );
//                                   },
//                                 );
//                               } else {
//                                 // Show a snackbar for invalid mobile number
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   SnackBar(
//                                     content: Text('Invalid mobile number. It should be $mobileNumberLength digits.'),
//                                   ),
//                                 );
//                               }
//                             } else {
//                               // Show a snackbar for invalid country code
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                   content: Text('Invalid country code. Please enter a valid country code starting with +.'),
//                                 ),
//                               );
//                             }
//                           } else {
//                             // Show a snackbar if the phone number is empty or does not start with '+'
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               const SnackBar(
//                                 content: Text('Phone Number is required and has to start with +.'),
//                               ),
//                             );
//                           }
//                         },
//                         text: FFLocalizations.of(context).getText(
//                           '0tfpy6v1' /* Confirm */,
//                         ),
//                         options: FFButtonOptions(
//                           width: 390.0,
//                           height: 50.0,
//                           padding: const EdgeInsetsDirectional.fromSTEB(
//                               24.0, 0.0, 24.0, 0.0),
//                           iconPadding: const EdgeInsetsDirectional.fromSTEB(
//                               0.0, 0.0, 0.0, 0.0),
//                           color: const Color(0xFFFFA800),
//                           textStyle:
//                           FlutterFlowTheme.of(context).titleSmall.override(
//                             fontFamily: 'Jaldi',
//                             color: Colors.white,
//                             fontSize: 17.0,
//                             letterSpacing: 0.0,
//                             fontWeight: FontWeight.normal,
//                           ),
//                           elevation: 3.0,
//                           borderSide: const BorderSide(
//                             color: Colors.transparent,
//                             width: 1.0,
//                           ),
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

//above uses country code only

//below uses country images too

// import "package:country_picker/country_picker.dart";
// import '/auth/firebase_auth/auth_util.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
// import 'package:provider/provider.dart';
//
//
// import 'login_page_model.dart';
// export 'login_page_model.dart';
//
// class LoginPageWidget extends StatefulWidget {
//   const LoginPageWidget({super.key});
//
//   @override
//   State<LoginPageWidget> createState() => _LoginPageWidgetState();
// }
//
// class _LoginPageWidgetState extends State<LoginPageWidget> {
//   late LoginPageModel _model;
//
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//   String selectedCountryCode = ''; // Default country code for India
//   String selectedCountryFlag = '🇮🇳';// Default country flag
//   bool _isLoading = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _model = createModel(context, () => LoginPageModel());
//
//     _model.textController ??= TextEditingController();
//     _model.textFieldFocusNode ??= FocusNode();
//
//     authManager.handlePhoneAuthStateChanges(context);
//     WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
//   }
//
//   @override
//   void dispose() {
//     _model.dispose();
//
//     super.dispose();
//   }
//   void _showCountryPicker() {
//     showCountryPicker(
//       context: context,
//       showPhoneCode: true, // Show the phone code
//       onSelect: (Country country) {
//         setState(() {
//           selectedCountryCode =
//               country.phoneCode; // Update the selected country code
//           selectedCountryFlag =
//               country.flagEmoji; // Update the selected country flag
//         });
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//         onTap: () => FocusScope.of(context).unfocus(),
//         child: Scaffold(
//           key: scaffoldKey,
//           backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
//           body: SafeArea(
//             top: true,
//             child: Padding(
//               padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
//               child: Container(
//                 width: double.infinity,
//                 height: double.infinity,
//                 child: Stack(
//                   children: [
//                     Align(
//                       alignment: AlignmentDirectional(0, 0),
//                       child: Column(
//                         mainAxisSize: MainAxisSize.max,
//                         children: [
//                           Align(
//                             alignment: AlignmentDirectional(0, 0),
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.circular(8),
//                               child: Image.asset(
//                                 'assets/images/Logo_-_default_style.png',
//                                 width: 268,
//                                 height: 50,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                           Container(
//                             width: 358,
//                             height: 350,
//                             child: Stack(
//                               children: [
//                                 Align(
//                                   alignment: AlignmentDirectional(0, -0.29),
//                                   child: Padding(
//                                     padding: EdgeInsetsDirectional.fromSTEB(
//                                         15, 0, 15, 0),
//                                     child: Container(
//                                       width: double.infinity,
//                                       height: 90,
//                                       decoration: BoxDecoration(),
//                                       child: Column(
//                                         mainAxisSize: MainAxisSize.max,
//                                         mainAxisAlignment:
//                                         MainAxisAlignment.center,
//                                         children: [
//                                           Align(
//                                             alignment:
//                                             AlignmentDirectional(-1, 0),
//                                             child: Text(
//                                               FFLocalizations.of(context).getText(
//                                                 'yn4aea2v' /* Enter your mobile number */,
//                                               ),
//                                               style: FlutterFlowTheme.of(context)
//                                                   .bodyMedium
//                                                   .override(
//                                                 fontFamily: 'Montserrat',
//                                                 color: Colors.black,
//                                                 fontSize: 14,
//                                                 letterSpacing: 0.0,
//                                                 fontWeight: FontWeight.normal,
//                                                 lineHeight: 1.5,
//                                               ),
//                                             ),
//                                           ),
//                                           Align(
//                                             alignment:
//                                             AlignmentDirectional(-1, 0),
//                                             child: Padding(
//                                               padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   0, 10, 0, 0),
//                                               child: Text(
//                                                 FFLocalizations.of(context)
//                                                     .getText(
//                                                   '5t8s4y4s' /* Type in your mobile number to ... */,
//                                                 ),
//                                                 style:
//                                                 FlutterFlowTheme.of(context)
//                                                     .bodyMedium
//                                                     .override(
//                                                   fontFamily: 'Jaldi',
//                                                   fontSize: 15,
//                                                   letterSpacing: 0.0,
//                                                   lineHeight: 1.2,
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Align(
//                                   alignment: AlignmentDirectional(0, 0.28),
//                                   child: Padding(
//                                     padding: EdgeInsetsDirectional.fromSTEB(
//                                         15, 0, 15, 0),
//                                     child: Container(
//                                       width: double.infinity,
//                                       height: 66,
//                                       decoration: BoxDecoration(
//                                         color: Colors.white,
//                                         borderRadius: BorderRadius.only(
//                                           bottomLeft: Radius.circular(5),
//                                           bottomRight: Radius.circular(5),
//                                           topLeft: Radius.circular(5),
//                                           topRight: Radius.circular(5),
//                                         ),
//                                         border: Border.all(
//                                           color: FlutterFlowTheme.of(context)
//                                               .alternate,
//                                         ),
//                                       ),
//                                       child: Row(
//                                         children: [
//                                           InkWell(
//                                             onTap: _showCountryPicker, // Show the country picker on tap
//                                             child: Padding(
//                                               padding: const EdgeInsets.all(12.0),
//                                               child: Row(
//                                                 mainAxisSize: MainAxisSize.min,
//                                                 children: [
//                                                   Text(
//                                                     selectedCountryFlag, // Display the flag
//                                                     style: const TextStyle(fontSize: 20),
//                                                   ),
//                                                   // const SizedBox(width: 8.0),
//                                                   // Text(
//                                                   //   selectedCountryCode, // Display the selected country code
//                                                   //   style: FlutterFlowTheme.of(context)
//                                                   //       .bodyMedium
//                                                   //       .override(
//                                                   //     fontFamily: 'Readex Pro',
//                                                   //     letterSpacing: 0.0,
//                                                   //   ),
//                                                   // ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                           Expanded(
//                                             child: Padding(
//                                               padding: const EdgeInsetsDirectional
//                                                   .fromSTEB(
//                                                   8.0, 0.0, 8.0, 0.0),
//                                               child: TextFormField(
//                                                 controller:
//                                                 _model.textController,
//                                                 focusNode:
//                                                 _model.textFieldFocusNode,
//                                                 autofocus: true,
//                                                 obscureText: false,
//                                                 decoration: InputDecoration(
//                                                   labelStyle: FlutterFlowTheme
//                                                       .of(context)
//                                                       .labelMedium
//                                                       .override(
//                                                     fontFamily:
//                                                     'Readex Pro',
//                                                     color: FlutterFlowTheme
//                                                         .of(context)
//                                                         .alternate,
//                                                     letterSpacing: 0.0,
//                                                   ),
//                                                   hintText:
//                                                   FFLocalizations.of(
//                                                       context)
//                                                       .getText(
//                                                     'o0oqu2if' /* Mobile Number */,
//                                                   ),
//                                                   hintStyle: FlutterFlowTheme
//                                                       .of(context)
//                                                       .labelMedium
//                                                       .override(
//                                                     fontFamily: 'Jaldi',
//                                                     color:
//                                                     const Color(0xFFD2D2D2),
//                                                     letterSpacing: 0.0,
//                                                   ),
//                                                   prefixText: selectedCountryCode.isNotEmpty ? '+${selectedCountryCode}' : '', // Show country code with +
//                                                   prefixStyle: FlutterFlowTheme.of(context)
//                                                       .bodyMedium
//                                                       .override(
//                                                     fontFamily: 'Readex Pro',
//                                                     letterSpacing: 0.0,
//                                                   ),
//                                                   enabledBorder:
//                                                   InputBorder.none,
//                                                   focusedBorder:
//                                                   InputBorder.none,
//                                                   errorBorder:
//                                                   InputBorder.none,
//                                                   focusedErrorBorder:
//                                                   InputBorder.none,
//                                                 ),
//                                                 style: FlutterFlowTheme.of(
//                                                     context)
//                                                     .bodyMedium
//                                                     .override(
//                                                   fontFamily:
//                                                   'Readex Pro',
//                                                   letterSpacing: 0.0,
//                                                 ),
//                                                 keyboardType:
//                                                 TextInputType.phone,
//                                                 validator: _model
//                                                     .textControllerValidator
//                                                     .asValidator(context),
//                                                 inputFormatters: [
//                                                   _model.textFieldMask
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Align(
//                       alignment: const AlignmentDirectional(0.0, 1.0),
//                       child: Padding(
//                         padding:
//                         const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 15.0),
//                         child: FFButtonWidget(
//                           onPressed: _isLoading
//                               ? null // Disable button while loading
//                               : () async {
//                             setState(() {
//                               _isLoading = true;
//                             });
//                             safeSetState(() {});
//
//                             // Get the phone number entered by the user
//                             String enteredPhoneNumber = _model.textController.text.trim();
//                             print('Country Code: "${selectedCountryCode}", Phone Number: "$enteredPhoneNumber"');
//
//                             // Check if the phone number has 10 digits
//                             if (enteredPhoneNumber.isEmpty || enteredPhoneNumber.length != 10) {
//                               // Show a SnackBar message if the phone number is not 10 digits
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                   content: Text('Please enter a valid 10-digit phone number.'),
//                                 ),
//                               );
//                               setState(() {
//                                 _isLoading = false; // Hide loading animation
//                               });
//                               return; // Exit the function early
//                             }
//
//                             // Format the phone number with country code
//                             final phoneNumberVal = selectedCountryCode.startsWith('+')
//                                 ? selectedCountryCode + enteredPhoneNumber
//                                 : '+' + selectedCountryCode + enteredPhoneNumber;
//
//                             // Store the formatted phone number in FFAppState
//                             FFAppState().Phonenumber = phoneNumberVal;
//
//                             // Check if the phone number starts with '+'
//                             if (phoneNumberVal.isEmpty || !phoneNumberVal.startsWith('+')) {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                   content: Text(
//                                       'Phone Number is required and has to start with +.'),
//                                 ),
//                               );
//                               setState(() {
//                                 _isLoading = false; // Hide loading animation
//                               });
//                               print(
//                                   'Formatted Phone Number: $phoneNumberVal');
//                               return;
//
//                             }
//                             print('Formatted Phone Number: $phoneNumberVal');
//                             await authManager.beginPhoneAuth(
//                               context: context,
//                               phoneNumber: phoneNumberVal,
//                               onCodeSent: (context) async {
//                                 setState(() {
//                                   _isLoading = false; // Hide loading animation
//                                 });
//                                 context.goNamedAuth(
//                                   'otp',
//                                   context.mounted,
//                                   ignoreRedirect: true,
//                                 );
//                               },
//                             );
//                           },
//                           text: FFLocalizations.of(context).getText(
//                             '0tfpy6v1' /* Confirm */,
//                           ),
//                           options: FFButtonOptions(
//                             width: 390.0,
//                             height: 60.0,
//                             padding: const EdgeInsetsDirectional.fromSTEB(
//                                 24.0, 0.0, 24.0, 0.0),
//                             iconPadding:
//                             const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
//                             color: const Color(0xFFFDA900),
//                             textStyle: FlutterFlowTheme.of(context)
//                                 .titleSmall
//                                 .override(
//                               fontFamily: 'Montserrat',
//                               color: FlutterFlowTheme.of(context).primaryText,
//                               fontSize: 15.0,
//                               letterSpacing: 0.0,
//                             ),
//                             elevation: 3.0,
//                             borderSide: const BorderSide(
//                               color: Colors.transparent,
//                               width: 1.0,
//                             ),
//                             borderRadius: BorderRadius.circular(10.0),
//                           ),
//                           showLoadingIndicator: false,
//                         ),
//                       ),
//                     ),
//                     if (_isLoading)
//                       Center(
//                         child: CircularProgressIndicator(
//                           color: Colors.black,
//                         ),
//                       ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         )
//     );
//   }
// }

//Above is the working code checking for -

// import "package:country_picker/country_picker.dart";
// import '/auth/firebase_auth/auth_util.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
// import 'package:provider/provider.dart';
//
//
// import 'login_page_model.dart';
// export 'login_page_model.dart';
//
// class LoginPageWidget extends StatefulWidget {
//   const LoginPageWidget({super.key});
//
//   @override
//   State<LoginPageWidget> createState() => _LoginPageWidgetState();
// }
//
// class _LoginPageWidgetState extends State<LoginPageWidget> {
//   late LoginPageModel _model;
//
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//   String selectedCountryCode = ''; // Default country code for India
//   String selectedCountryFlag = '🌍';// Default country flag
//   bool _isLoading = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _model = createModel(context, () => LoginPageModel());
//
//     _model.textController ??= TextEditingController();
//     _model.textFieldFocusNode ??= FocusNode();
//
//     authManager.handlePhoneAuthStateChanges(context);
//     WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
//   }
//
//   @override
//   void dispose() {
//     _model.dispose();
//
//     super.dispose();
//   }
//   void _showCountryPicker() {
//     showCountryPicker(
//       context: context,
//       showPhoneCode: true, // Show the phone code
//       onSelect: (Country country) {
//         setState(() {
//           selectedCountryCode =
//               country.phoneCode; // Update the selected country code
//           selectedCountryFlag =
//               country.flagEmoji; // Update the selected country flag
//         });
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//         onTap: () => FocusScope.of(context).unfocus(),
//         child: Scaffold(
//           key: scaffoldKey,
//           backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
//           body: SafeArea(
//             top: true,
//             child: Padding(
//               padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
//               child: Container(
//                 width: double.infinity,
//                 height: double.infinity,
//                 child: Stack(
//                   children: [
//                     Align(
//                       alignment: AlignmentDirectional(0, 0),
//                       child: Column(
//                         mainAxisSize: MainAxisSize.max,
//                         children: [
//                           Align(
//                             alignment: AlignmentDirectional(0, 0),
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.circular(8),
//                               child: Image.asset(
//                                 'assets/images/Logo_-_default_style.png',
//                                 width: 268,
//                                 height: 50,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                           Container(
//                             width: 358,
//                             height: 350,
//                             child: Stack(
//                               children: [
//                                 Align(
//                                   alignment: AlignmentDirectional(0, -0.29),
//                                   child: Padding(
//                                     padding: EdgeInsetsDirectional.fromSTEB(
//                                         15, 0, 15, 0),
//                                     child: Container(
//                                       width: double.infinity,
//                                       height: 90,
//                                       decoration: BoxDecoration(),
//                                       child: Column(
//                                         mainAxisSize: MainAxisSize.max,
//                                         mainAxisAlignment:
//                                         MainAxisAlignment.center,
//                                         children: [
//                                           Align(
//                                             alignment:
//                                             AlignmentDirectional(-1, 0),
//                                             child: Text(
//                                               FFLocalizations.of(context).getText(
//                                                 'yn4aea2v' /* Enter your mobile number */,
//                                               ),
//                                               style: FlutterFlowTheme.of(context)
//                                                   .bodyMedium
//                                                   .override(
//                                                 fontFamily: 'Montserrat',
//                                                 color: Colors.black,
//                                                 fontSize: 14,
//                                                 letterSpacing: 0.0,
//                                                 fontWeight: FontWeight.normal,
//                                                 lineHeight: 1.5,
//                                               ),
//                                             ),
//                                           ),
//                                           Align(
//                                             alignment:
//                                             AlignmentDirectional(-1, 0),
//                                             child: Padding(
//                                               padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   0, 10, 0, 0),
//                                               child: Text(
//                                                 FFLocalizations.of(context)
//                                                     .getText(
//                                                   '5t8s4y4s' /* Type in your mobile number to ... */,
//                                                 ),
//                                                 style:
//                                                 FlutterFlowTheme.of(context)
//                                                     .bodyMedium
//                                                     .override(
//                                                   fontFamily: 'Jaldi',
//                                                   fontSize: 15,
//                                                   letterSpacing: 0.0,
//                                                   lineHeight: 1.2,
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Align(
//                                   alignment: AlignmentDirectional(0, 0.28),
//                                   child: Padding(
//                                     padding: EdgeInsetsDirectional.fromSTEB(
//                                         15, 0, 15, 0),
//                                     child: Container(
//                                       width: double.infinity,
//                                       height: 66,
//                                       decoration: BoxDecoration(
//                                         color: Colors.white,
//                                         borderRadius: BorderRadius.only(
//                                           bottomLeft: Radius.circular(5),
//                                           bottomRight: Radius.circular(5),
//                                           topLeft: Radius.circular(5),
//                                           topRight: Radius.circular(5),
//                                         ),
//                                         border: Border.all(
//                                           color: FlutterFlowTheme.of(context)
//                                               .alternate,
//                                         ),
//                                       ),
//                                       child: Row(
//                                         children: [
//                                           InkWell(
//                                             onTap: _showCountryPicker, // Show the country picker on tap
//                                             child: Padding(
//                                               padding: const EdgeInsets.all(12.0),
//                                               child: Row(
//                                                 mainAxisSize: MainAxisSize.min,
//                                                 children: [
//                                                   Text(
//                                                     selectedCountryFlag, // Display the flag
//                                                     style: const TextStyle(fontSize: 20),
//                                                   ),
//                                                   // const SizedBox(width: 8.0),
//                                                   // Text(
//                                                   //   selectedCountryCode, // Display the selected country code
//                                                   //   style: FlutterFlowTheme.of(context)
//                                                   //       .bodyMedium
//                                                   //       .override(
//                                                   //     fontFamily: 'Readex Pro',
//                                                   //     letterSpacing: 0.0,
//                                                   //   ),
//                                                   // ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                           Expanded(
//                                             child: Padding(
//                                               padding: const EdgeInsetsDirectional
//                                                   .fromSTEB(
//                                                   8.0, 0.0, 8.0, 0.0),
//                                               child: TextFormField(
//                                                 controller:
//                                                 _model.textController,
//                                                 focusNode:
//                                                 _model.textFieldFocusNode,
//                                                 autofocus: true,
//                                                 obscureText: false,
//                                                 decoration: InputDecoration(
//                                                   labelStyle: FlutterFlowTheme
//                                                       .of(context)
//                                                       .labelMedium
//                                                       .override(
//                                                     fontFamily:
//                                                     'Readex Pro',
//                                                     color: FlutterFlowTheme
//                                                         .of(context)
//                                                         .alternate,
//                                                     letterSpacing: 0.0,
//                                                   ),
//                                                   hintText:
//                                                   FFLocalizations.of(
//                                                       context)
//                                                       .getText(
//                                                     'o0oqu2if' /* Mobile Number */,
//                                                   ),
//                                                   hintStyle: FlutterFlowTheme
//                                                       .of(context)
//                                                       .labelMedium
//                                                       .override(
//                                                     fontFamily: 'Jaldi',
//                                                     color:
//                                                     const Color(0xFFD2D2D2),
//                                                     letterSpacing: 0.0,
//                                                   ),
//                                                   prefixText: selectedCountryCode.isNotEmpty ? '+${selectedCountryCode}' : '', // Show country code with +
//                                                   prefixStyle: FlutterFlowTheme.of(context)
//                                                       .bodyMedium
//                                                       .override(
//                                                     fontFamily: 'Readex Pro',
//                                                     letterSpacing: 0.0,
//                                                   ),
//                                                   enabledBorder:
//                                                   InputBorder.none,
//                                                   focusedBorder:
//                                                   InputBorder.none,
//                                                   errorBorder:
//                                                   InputBorder.none,
//                                                   focusedErrorBorder:
//                                                   InputBorder.none,
//                                                 ),
//                                                 style: FlutterFlowTheme.of(
//                                                     context)
//                                                     .bodyMedium
//                                                     .override(
//                                                   fontFamily:
//                                                   'Readex Pro',
//                                                   letterSpacing: 0.0,
//                                                 ),
//                                                 keyboardType:
//                                                 TextInputType.phone,
//                                                 validator: _model
//                                                     .textControllerValidator
//                                                     .asValidator(context),
//                                                 inputFormatters: [
//                                                   _model.textFieldMask
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Align(
//                       alignment: const AlignmentDirectional(0.0, 1.0),
//                       child: Padding(
//                         padding:
//                         const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 15.0),
//                         child: FFButtonWidget(
//                           onPressed: _isLoading
//                               ? null // Disable button while loading
//                               : () async {
//                             setState(() {
//                               _isLoading = true;
//                             });
//                             safeSetState(() {});
//
//                             // Get the phone number entered by the user
//                             String enteredPhoneNumber = _model.textController.text.trim();
//                             print('Country Code: "${selectedCountryCode}", Phone Number: "$enteredPhoneNumber"');
//
//                             // Check if the phone number has 10 digits
//                             if (enteredPhoneNumber.isEmpty || enteredPhoneNumber.length != 10) {
//                               // Show a SnackBar message if the phone number is not 10 digits
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                   content: Text('Please enter a valid 10-digit phone number.'),
//                                 ),
//                               );
//                               setState(() {
//                                 _isLoading = false; // Hide loading animation
//                               });
//                               return; // Exit the function early
//                             }
//
//                             // Format the phone number with country code
//                             final phoneNumberVal = selectedCountryCode.startsWith('+')
//                                 ? selectedCountryCode + enteredPhoneNumber
//                                 : '+' + selectedCountryCode + enteredPhoneNumber;
//
//                             // Store the formatted phone number in FFAppState
//                             FFAppState().Phonenumber = phoneNumberVal;
//
//                             // Check if the phone number starts with '+'
//                             if (phoneNumberVal.isEmpty || !phoneNumberVal.startsWith('+')) {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                   content: Text(
//                                       'Phone Number is required and has to start with +.'),
//                                 ),
//                               );
//                               setState(() {
//                                 _isLoading = false; // Hide loading animation
//                               });
//                               print(
//                                   'Formatted Phone Number: $phoneNumberVal');
//                               return;
//
//                             }
//                             print('Formatted Phone Number: $phoneNumberVal');
//                             await authManager.beginPhoneAuth(
//                               context: context,
//                               phoneNumber: phoneNumberVal,
//                               onCodeSent: (context) async {
//                                 setState(() {
//                                   _isLoading = false; // Hide loading animation
//                                 });
//                                 context.goNamedAuth(
//                                   'otp',
//                                   context.mounted,
//                                   ignoreRedirect: true,
//                                 );
//                               },
//                             );
//                           },
//                           text: FFLocalizations.of(context).getText(
//                             '0tfpy6v1' /* Confirm */,
//                           ),
//                           options: FFButtonOptions(
//                             width: 390.0,
//                             height: 60.0,
//                             padding: const EdgeInsetsDirectional.fromSTEB(
//                                 24.0, 0.0, 24.0, 0.0),
//                             iconPadding:
//                             const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
//                             color: const Color(0xFFFDA900),
//                             textStyle: FlutterFlowTheme.of(context)
//                                 .titleSmall
//                                 .override(
//                               fontFamily: 'Montserrat',
//                               color: FlutterFlowTheme.of(context).primaryText,
//                               fontSize: 15.0,
//                               letterSpacing: 0.0,
//                             ),
//                             elevation: 3.0,
//                             borderSide: const BorderSide(
//                               color: Colors.transparent,
//                               width: 1.0,
//                             ),
//                             borderRadius: BorderRadius.circular(10.0),
//                           ),
//                           showLoadingIndicator: false,
//                         ),
//                       ),
//                     ),
//                     if (_isLoading)
//                       Center(
//                         child: CircularProgressIndicator(
//                           color: Colors.black,
//                         ),
//                       ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         )
//     );
//   }
// }

//In the above we set the globe image for defualt country code
//below code login works fine

import "package:country_picker/country_picker.dart";
import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';


import 'login_page_model.dart';
export 'login_page_model.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({super.key});

  @override
  State<LoginPageWidget> createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  late LoginPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  String selectedCountryCode = ''; // Default country code for India
  String selectedCountryFlag = '🌍';// Default country flag
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginPageModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    authManager.handlePhoneAuthStateChanges(context);
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }
  void _showCountryPicker() {
    showCountryPicker(
      context: context,
      showPhoneCode: true, // Show the phone code
      onSelect: (Country country) {
        setState(() {
          selectedCountryCode =
              country.phoneCode; // Update the selected country code
          selectedCountryFlag =
              country.flagEmoji; // Update the selected country flag
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: SafeArea(
            top: true,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                'assets/images/Logo_-_default_style.png',
                                width: 268,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            width: 358,
                            height: 350,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, -0.29),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15, 0, 15, 0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 90,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Align(
                                            alignment:
                                            AlignmentDirectional(-1, 0),
                                            child: Text(
                                              FFLocalizations.of(context).getText(
                                                'yn4aea2v' /* Enter your mobile number */,
                                              ),
                                              style: FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily: 'Montserrat',
                                                color: Colors.black,
                                                fontSize: 14,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                lineHeight: 1.5,
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                            AlignmentDirectional(-1, 0),
                                            child: Padding(
                                              padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 10, 0, 0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '5t8s4y4s' /* Type in your mobile number to ... */,
                                                ),
                                                style:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                  fontFamily: 'Jaldi',
                                                  fontSize: 15,
                                                  letterSpacing: 0.0,
                                                  lineHeight: 1.2,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, 0.28),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15, 0, 15, 0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 66,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(5),
                                          bottomRight: Radius.circular(5),
                                          topLeft: Radius.circular(5),
                                          topRight: Radius.circular(5),
                                        ),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          InkWell(
                                            onTap: _showCountryPicker, // Show the country picker on tap
                                            child: Padding(
                                              padding: const EdgeInsets.all(12.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    selectedCountryFlag, // Display the flag
                                                    style: const TextStyle(fontSize: 20),
                                                  ),
                                                  // const SizedBox(width: 8.0),
                                                  // Text(
                                                  //   selectedCountryCode, // Display the selected country code
                                                  //   style: FlutterFlowTheme.of(context)
                                                  //       .bodyMedium
                                                  //       .override(
                                                  //     fontFamily: 'Readex Pro',
                                                  //     letterSpacing: 0.0,
                                                  //   ),
                                                  // ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                  8.0, 0.0, 8.0, 0.0),
                                              child: TextFormField(
                                                controller:
                                                _model.textController,
                                                focusNode:
                                                _model.textFieldFocusNode,
                                                autofocus: true,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelStyle: FlutterFlowTheme
                                                      .of(context)
                                                      .labelMedium
                                                      .override(
                                                    fontFamily:
                                                    'Readex Pro',
                                                    color: FlutterFlowTheme
                                                        .of(context)
                                                        .alternate,
                                                    letterSpacing: 0.0,
                                                  ),
                                                  hintText:
                                                  FFLocalizations.of(
                                                      context)
                                                      .getText(
                                                    'o0oqu2if' /* Mobile Number */,
                                                  ),
                                                  hintStyle: FlutterFlowTheme
                                                      .of(context)
                                                      .labelMedium
                                                      .override(
                                                    fontFamily: 'Jaldi',
                                                    color:
                                                    const Color(0xFFD2D2D2),
                                                    letterSpacing: 0.0,
                                                  ),
                                                  prefixText: selectedCountryCode.isNotEmpty ? '+${selectedCountryCode}' : '', // Show country code with +
                                                  prefixStyle: FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                    fontFamily: 'Readex Pro',
                                                    letterSpacing: 0.0,
                                                  ),
                                                  enabledBorder:
                                                  InputBorder.none,
                                                  focusedBorder:
                                                  InputBorder.none,
                                                  errorBorder:
                                                  InputBorder.none,
                                                  focusedErrorBorder:
                                                  InputBorder.none,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                    context)
                                                    .bodyMedium
                                                    .override(
                                                  fontFamily:
                                                  'Readex Pro',
                                                  letterSpacing: 0.0,
                                                ),
                                                keyboardType:
                                                TextInputType.phone,
                                                validator: _model
                                                    .textControllerValidator
                                                    .asValidator(context),
                                                inputFormatters: [
                                                  _model.textFieldMask
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding:
                        const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 15.0),
                        child: FFButtonWidget(
                          onPressed: _isLoading
                              ? null // Disable button while loading
                              : () async {
                            setState(() {
                              _isLoading = true;
                            });
                            safeSetState(() {});

                            // Get the phone number entered by the user
                            String enteredPhoneNumber = _model.textController.text.trim();
                            print('Country Code: "${selectedCountryCode}-", Phone Number: "$enteredPhoneNumber"');
                            final cleanedPhoneNumber = enteredPhoneNumber.replaceAll(RegExp(r'\D'), '');

                            // Check if the phone number has 10 digits
                            if (cleanedPhoneNumber.isEmpty || cleanedPhoneNumber.length != 10) {
                              // Show a SnackBar message if the phone number is not 10 digits
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please enter a valid 10-digit phone number.'),
                                ),
                              );
                              setState(() {
                                _isLoading = false; // Hide loading animation
                              });
                              return; // Exit the function early
                            }

                            // Format the phone number with country code
                            final phoneNumberVal = selectedCountryCode.startsWith('+')
                                ? selectedCountryCode+'-' + cleanedPhoneNumber
                                : '+' + selectedCountryCode +'-'+ cleanedPhoneNumber;

                            // Store the formatted phone number in FFAppState
                            FFAppState().Phonenumber = phoneNumberVal;

                            // Check if the phone number starts with '+'
                            if (phoneNumberVal.isEmpty || !phoneNumberVal.startsWith('+')) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Phone Number is required and has to start with +.'),
                                ),
                              );
                              setState(() {
                                _isLoading = false; // Hide loading animation
                              });
                              print(
                                  'Formatted Phone Number: $phoneNumberVal');
                              return;

                            }
                            print('Formatted Phone Number: $phoneNumberVal');
                            await authManager.beginPhoneAuth(
                              context: context,
                              phoneNumber: phoneNumberVal,
                              onCodeSent: (context) async {
                                setState(() {
                                  _isLoading = false; // Hide loading animation
                                });
                                context.goNamedAuth(
                                  'otp',
                                  context.mounted,
                                  ignoreRedirect: true,
                                );
                              },
                            );
                          },
                          text: FFLocalizations.of(context).getText(
                            '0tfpy6v1' /* Confirm */,
                          ),
                          options: FFButtonOptions(
                            width: 390.0,
                            height: 60.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                            color: const Color(0xFFFDA900),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                              fontFamily: 'Montserrat',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 15.0,
                              letterSpacing: 0.0,
                            ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          showLoadingIndicator: false,
                        ),
                      ),
                    ),
                    if (_isLoading)
                      Center(
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}