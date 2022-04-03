// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Email o contraseña incorrectos`
  String get nonExistentUserWithEmailAndPassword {
    return Intl.message(
      'Email o contraseña incorrectos',
      name: 'nonExistentUserWithEmailAndPassword',
      desc: '',
      args: [],
    );
  }

  /// `Error en el servidor`
  String get serverError {
    return Intl.message(
      'Error en el servidor',
      name: 'serverError',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Registrarse`
  String get register {
    return Intl.message(
      'Registrarse',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Correo electrónico`
  String get email {
    return Intl.message(
      'Correo electrónico',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Contraseña`
  String get password {
    return Intl.message(
      'Contraseña',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `¿Olvidaste tu contraseña?`
  String get forgotPassword {
    return Intl.message(
      '¿Olvidaste tu contraseña?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `¿No tienes una cuenta?`
  String get dontHaveAccount {
    return Intl.message(
      '¿No tienes una cuenta?',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Registrar`
  String get signup {
    return Intl.message(
      'Registrar',
      name: 'signup',
      desc: '',
      args: [],
    );
  }

  /// `Nombre completo`
  String get fullName {
    return Intl.message(
      'Nombre completo',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `Confirmar contraseña`
  String get passwordConfirmation {
    return Intl.message(
      'Confirmar contraseña',
      name: 'passwordConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `¿Ya tienes una cuenta?`
  String get alderadyHaveAccount {
    return Intl.message(
      '¿Ya tienes una cuenta?',
      name: 'alderadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `No puede estar vacío`
  String get empty {
    return Intl.message(
      'No puede estar vacío',
      name: 'empty',
      desc: '',
      args: [],
    );
  }

  /// `Email inválido`
  String get invalidEmail {
    return Intl.message(
      'Email inválido',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Muy largo`
  String get tooLong {
    return Intl.message(
      'Muy largo',
      name: 'tooLong',
      desc: '',
      args: [],
    );
  }

  /// `Muy corto`
  String get tooShot {
    return Intl.message(
      'Muy corto',
      name: 'tooShot',
      desc: '',
      args: [],
    );
  }

  /// `Las contraseñas no coinciden`
  String get mismatchedPasswords {
    return Intl.message(
      'Las contraseñas no coinciden',
      name: 'mismatchedPasswords',
      desc: '',
      args: [],
    );
  }

  /// `Nombre completo inválido`
  String get invalidFullName {
    return Intl.message(
      'Nombre completo inválido',
      name: 'invalidFullName',
      desc: '',
      args: [],
    );
  }

  /// `El email ya está en uso`
  String get emailAlreadyInUser {
    return Intl.message(
      'El email ya está en uso',
      name: 'emailAlreadyInUser',
      desc: '',
      args: [],
    );
  }

  /// `Contraseña débil`
  String get weakPassword {
    return Intl.message(
      'Contraseña débil',
      name: 'weakPassword',
      desc: '',
      args: [],
    );
  }

  /// `Operación no permitida`
  String get operationNotAllowed {
    return Intl.message(
      'Operación no permitida',
      name: 'operationNotAllowed',
      desc: '',
      args: [],
    );
  }

  /// `Error desconocido`
  String get unknownError {
    return Intl.message(
      'Error desconocido',
      name: 'unknownError',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
