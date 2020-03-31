import 'dart:async';
import 'package:rxdart/rxdart.dart';
import './validators.dart';

//object is empty class, we adding it just for we can add mixin class Validators
class BLOC extends Object with Validators
{
  final _emailController= BehaviorSubject<String>();
  final _passwordController= BehaviorSubject<String>();
  final _registerName= BehaviorSubject<String>();
  final _registerCountryCode= BehaviorSubject<int>();                   
  final _registerMobile= BehaviorSubject<int>();
  final _registerGender= BehaviorSubject<int>();
  final _registerEmail= BehaviorSubject<String>();
  final _registerPassword= BehaviorSubject<String>();
  final _registerRePassword= BehaviorSubject<String>();
  

  BLOC()
  {
    print('block constructor');
    _registerCountryCode.sink.add(91);     //91 is India's code and it is by default value.
  }

  
  //Take value from validator class and validate input data
  Stream<String> get email=> _emailController.stream.transform(validateEmail).asBroadcastStream();
  Stream<String> get password=> _passwordController.stream.transform(validatePassword);
  Stream<bool> get submitValid=> Observable.combineLatest2(email, password, (String a, String b)
  {
    if(a!= null && b!= null)
    {
      return true;
    }
    else
    {
      return false;
    }
  }).asBroadcastStream();

  //Take data from textfeild and add into stream
  Function(String) get emailChanged=> _emailController.sink.add;
  Function(String) get passwordChanged=> _passwordController.sink.add;

  submit()
  {
    print('email ${_emailController.value}');
    print('password ${_passwordController.value}');

    _emailController.onResume.call();
  }


  //Register page streams
  Stream<String> get name=> _registerName.stream.transform(validateName);
  Function(String) get nameChanged=> _registerName.sink.add;
  Stream<int> get countryCode=> _registerCountryCode.stream.transform(validateCountryCode);
  Stream<int> get mobile=> _registerMobile.stream.transform(validateMobile);
  Stream<int> get gender=> _registerGender.stream;
  Stream<bool> get submitRegister1=> Observable.combineLatest4(name, countryCode, mobile, gender, (String a, int b, int c, int d)
    {
      if(a!= null && b!= null && c!= null && d!= null)
      {
        return true;
      }
      else
      {
        return false;
      }
    }).asBroadcastStream();
  
    setsCountryCode(int value)
    {
      _registerCountryCode.sink.add(value);
    }
  
    setsMobile(int value)
    {
      _registerMobile.sink.add(value);
    }
  
    setsGender(int value)
    {
      _registerGender.sink.add(value);
    }
  
    registerPage()
    {
      print('name: ${_registerName.value}');
      print('Country Code: ${_registerCountryCode.value}');
      print('Mobile: ${_registerMobile.value}');
      print('Gender: ${_registerGender.value}');
    }

    //Register page 2


    Stream<String> get registerEmail=> _registerEmail.stream.transform(validateEmail);
    Stream<String> get registerPassword=> _registerPassword.stream.transform(validatePassword);
    
    getPassword()
    {
      return _registerPassword.value;
    }

    Stream<String> get registerRePassword=> _registerRePassword.stream.transform(validateRePassword);
    Stream<bool> get submitRegister2=> Observable.combineLatest3(registerEmail, registerPassword, registerRePassword, (String a, String b, String c)
    {
      if(a!= null && b!= null && c!= null)
      {
        return true;
      }
      else
      {
        return false;
      }
    }).asBroadcastStream();

    //Take data from textfeild and add into stream
    Function(String) get registerEmailChanged=> _registerEmail.sink.add;
    Function(String) get registerPasswordChanged=> _registerPassword.sink.add;
    Function(String) get registerRePasswordChanged=> _registerRePassword.sink.add;

    registerPage1()
    {
      print('email: ${_registerEmail.value}');
      print('password: ${_registerPassword.value}');
      print('Re password: ${_registerRePassword.value}');
    }
  
    void dispose()
    {
      _emailController.close();
      _passwordController.close();
      _registerName.close();
      _registerCountryCode.close();
      _registerMobile.close();
      _registerGender.close();
      _registerEmail.close();
      _registerPassword.close();
      _registerRePassword.close();
    }
  }

final bloc= BLOC();