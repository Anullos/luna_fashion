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

  /// `Mi perfil`
  String get myProfile {
    return Intl.message(
      'Mi perfil',
      name: 'myProfile',
      desc: '',
      args: [],
    );
  }

  /// `Cambiar contraseña`
  String get changePassword {
    return Intl.message(
      'Cambiar contraseña',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Soporte`
  String get support {
    return Intl.message(
      'Soporte',
      name: 'support',
      desc: '',
      args: [],
    );
  }

  /// `Términos y condiciones`
  String get termAndConditions {
    return Intl.message(
      'Términos y condiciones',
      name: 'termAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `Cerrar sesión`
  String get signOut {
    return Intl.message(
      'Cerrar sesión',
      name: 'signOut',
      desc: '',
      args: [],
    );
  }

  /// `¿Sabías que?`
  String get didYouKnow {
    return Intl.message(
      '¿Sabías que?',
      name: 'didYouKnow',
      desc: '',
      args: [],
    );
  }

  /// `Esta aplicación es una demo para el proyecto final de DAM de Cesur. Esta aplicación no tiene ningún fin comercial y es de uso libre. A sido realizada por Daniel Aranda Maestro`
  String get profileInfoCard {
    return Intl.message(
      'Esta aplicación es una demo para el proyecto final de DAM de Cesur. Esta aplicación no tiene ningún fin comercial y es de uso libre. A sido realizada por Daniel Aranda Maestro',
      name: 'profileInfoCard',
      desc: '',
      args: [],
    );
  }

  /// `¡Quiero saber máS!`
  String get iWantToKnowMore {
    return Intl.message(
      '¡Quiero saber máS!',
      name: 'iWantToKnowMore',
      desc: '',
      args: [],
    );
  }

  /// `Añadir producto`
  String get addProduct {
    return Intl.message(
      'Añadir producto',
      name: 'addProduct',
      desc: '',
      args: [],
    );
  }

  /// `Tomar una foto`
  String get takeAPhoto {
    return Intl.message(
      'Tomar una foto',
      name: 'takeAPhoto',
      desc: '',
      args: [],
    );
  }

  /// `Elegir de la galería`
  String get chooseFromGallery {
    return Intl.message(
      'Elegir de la galería',
      name: 'chooseFromGallery',
      desc: '',
      args: [],
    );
  }

  /// `Nombre`
  String get name {
    return Intl.message(
      'Nombre',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Descripción`
  String get description {
    return Intl.message(
      'Descripción',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Categoría`
  String get category {
    return Intl.message(
      'Categoría',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `Precio`
  String get price {
    return Intl.message(
      'Precio',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Precio anterior`
  String get oldPrice {
    return Intl.message(
      'Precio anterior',
      name: 'oldPrice',
      desc: '',
      args: [],
    );
  }

  /// `Añadir`
  String get add {
    return Intl.message(
      'Añadir',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `El nombre no es válido`
  String get nameFieldIsInvalid {
    return Intl.message(
      'El nombre no es válido',
      name: 'nameFieldIsInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Producto añadido`
  String get productAdded {
    return Intl.message(
      'Producto añadido',
      name: 'productAdded',
      desc: '',
      args: [],
    );
  }

  /// `La imagen es obligatoria`
  String get imageIsRequired {
    return Intl.message(
      'La imagen es obligatoria',
      name: 'imageIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `No has realizado ningún pedido`
  String get haveNotPlacedOrder {
    return Intl.message(
      'No has realizado ningún pedido',
      name: 'haveNotPlacedOrder',
      desc: '',
      args: [],
    );
  }

  /// `No hay pedidos en este estado`
  String get thereNotOrderStatus {
    return Intl.message(
      'No hay pedidos en este estado',
      name: 'thereNotOrderStatus',
      desc: '',
      args: [],
    );
  }

  /// `Pendiente`
  String get pending {
    return Intl.message(
      'Pendiente',
      name: 'pending',
      desc: '',
      args: [],
    );
  }

  /// `Listo para recoger`
  String get pickUp {
    return Intl.message(
      'Listo para recoger',
      name: 'pickUp',
      desc: '',
      args: [],
    );
  }

  /// `Rechazado`
  String get rejected {
    return Intl.message(
      'Rechazado',
      name: 'rejected',
      desc: '',
      args: [],
    );
  }

  /// `Completado`
  String get completed {
    return Intl.message(
      'Completado',
      name: 'completed',
      desc: '',
      args: [],
    );
  }

  /// `Total de productos: `
  String get totalOfProducts {
    return Intl.message(
      'Total de productos: ',
      name: 'totalOfProducts',
      desc: '',
      args: [],
    );
  }

  /// `Total a pagar: `
  String get totalToPay {
    return Intl.message(
      'Total a pagar: ',
      name: 'totalToPay',
      desc: '',
      args: [],
    );
  }

  /// `Estado del pedido: `
  String get statusOrder {
    return Intl.message(
      'Estado del pedido: ',
      name: 'statusOrder',
      desc: '',
      args: [],
    );
  }

  /// `Cantidad: `
  String get quantity {
    return Intl.message(
      'Cantidad: ',
      name: 'quantity',
      desc: '',
      args: [],
    );
  }

  /// `Total: `
  String get total {
    return Intl.message(
      'Total: ',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Carrito`
  String get cart {
    return Intl.message(
      'Carrito',
      name: 'cart',
      desc: '',
      args: [],
    );
  }

  /// `Mis productos`
  String get myProducts {
    return Intl.message(
      'Mis productos',
      name: 'myProducts',
      desc: '',
      args: [],
    );
  }

  /// `Resumen`
  String get resume {
    return Intl.message(
      'Resumen',
      name: 'resume',
      desc: '',
      args: [],
    );
  }

  /// `Enviar pedido`
  String get sendOrder {
    return Intl.message(
      'Enviar pedido',
      name: 'sendOrder',
      desc: '',
      args: [],
    );
  }

  /// `No tienes productos en el carrito`
  String get haveNotItemsInCart {
    return Intl.message(
      'No tienes productos en el carrito',
      name: 'haveNotItemsInCart',
      desc: '',
      args: [],
    );
  }

  /// `Pedido enviado`
  String get orderSend {
    return Intl.message(
      'Pedido enviado',
      name: 'orderSend',
      desc: '',
      args: [],
    );
  }

  /// `Detalles del pedido`
  String get orderDetails {
    return Intl.message(
      'Detalles del pedido',
      name: 'orderDetails',
      desc: '',
      args: [],
    );
  }

  /// `Estado: {status}`
  String status(Object status) {
    return Intl.message(
      'Estado: $status',
      name: 'status',
      desc: '',
      args: [status],
    );
  }

  /// `Servicio Técnico:`
  String get serviceTecnic {
    return Intl.message(
      'Servicio Técnico:',
      name: 'serviceTecnic',
      desc: '',
      args: [],
    );
  }

  /// `Realizado por:`
  String get realiceBy {
    return Intl.message(
      'Realizado por:',
      name: 'realiceBy',
      desc: '',
      args: [],
    );
  }

  /// `Lista de pedidos`
  String get orderList {
    return Intl.message(
      'Lista de pedidos',
      name: 'orderList',
      desc: '',
      args: [],
    );
  }

  /// `Pasar a listo para recoger`
  String get goToPickUp {
    return Intl.message(
      'Pasar a listo para recoger',
      name: 'goToPickUp',
      desc: '',
      args: [],
    );
  }

  /// `Pasar a rechazado`
  String get goToRejected {
    return Intl.message(
      'Pasar a rechazado',
      name: 'goToRejected',
      desc: '',
      args: [],
    );
  }

  /// `Pasar a completado`
  String get goToCompleted {
    return Intl.message(
      'Pasar a completado',
      name: 'goToCompleted',
      desc: '',
      args: [],
    );
  }

  /// `Ver todos los productos`
  String get seeAllProducts {
    return Intl.message(
      'Ver todos los productos',
      name: 'seeAllProducts',
      desc: '',
      args: [],
    );
  }

  /// `Bienvenido a `
  String get wellcomeTo {
    return Intl.message(
      'Bienvenido a ',
      name: 'wellcomeTo',
      desc: '',
      args: [],
    );
  }

  /// `Productos destacados de la semana`
  String get topProductsOfWeek {
    return Intl.message(
      'Productos destacados de la semana',
      name: 'topProductsOfWeek',
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
