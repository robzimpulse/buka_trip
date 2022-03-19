import 'package:buka_trip/infrastructure/util/constant.dart';
import 'package:buka_trip/infrastructure/util/modal.dart';
import 'package:buka_trip/infrastructure/util/log.dart';
import 'package:buka_trip/infrastructure/widgets/translucent_multiple_button_horizontal.widget.dart';
import 'package:buka_trip/infrastructure/widgets/translucent_text_field.widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProfileScreen();

}

class _ProfileScreen extends State<StatefulWidget> {

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _isUpdate = false;
  bool _isLoading = false;

  void _onTapSave() async {
    try {
      setState(() { _isLoading = true; });
      String username = _usernameController.text;
      String email = _emailController.text;
      String password = _passwordController.text;
      User? user = _auth.currentUser;
      if (username.isNotEmpty) { await user?.updateDisplayName(username); }
      if (email.isNotEmpty) { await user?.updateEmail(email); }
      if (password.isNotEmpty) { await user?.updatePassword(password); }
      await user?.reload();
    } on FirebaseAuthException catch (e) {
      Modal.alert(context, title: 'Error', content: '${e.message}');
    } catch (e) {
      Log.debug('_onTapSave ${e.toString()}');
    } finally {
      setState(() { _isLoading = false; });
      _onTapCancel();
    }
  }

  void fetchData() async {
    User? user = _auth.currentUser;
    _usernameController.text = user?.displayName ?? '';
    _emailController.text = user?.email ?? '';
    _passwordController.clear();
  }

  void _onTapEdit() {
    setState(() { _isUpdate = true; });

  }

  void _onTapCancel() {
    setState(() { _isUpdate = false; });
    fetchData();
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.green,
      body: ListView(
        children: <Widget>[
          SizedBox(height: size.width * .2),
          CircleAvatar(
            backgroundColor: Colors.transparent,
            maxRadius: 50,
            child: ClipOval(
              child: Image.network(
                  Constant.placeholder(width: 100, height: 100),
                  width: 100
              ),
            ),
          ),
          TranslucentTextField(
            hintText: 'Username',
            enabled: _isUpdate,
            controller: _usernameController,
            icon: Icons.account_circle_outlined,
            margin: EdgeInsets.only(
              top: size.width * .1,
                left: size.width * .05,
                right: size.width * .05,
                bottom: size.height * .01,
            ),
          ),
          TranslucentTextField(
            hintText: 'Email',
            enabled: _isUpdate,
            controller: _emailController,
            icon: Icons.email_outlined,
            margin: EdgeInsets.only(
                left: size.width * .05,
                right: size.width * .05,
                bottom: size.height * .01
            ),
          ),
          TranslucentTextField(
            hintText: 'Password',
            enabled: _isUpdate,
            controller: _passwordController,
            icon: Icons.lock_outline,
            obscureText: true,
            margin: EdgeInsets.only(
                left: size.width * .05,
                right: size.width * .05,
                bottom: size.height * .01
            ),
          ),
          Visibility(
            visible: !_isLoading,
            replacement: Center(
              child: Container(
                  width: 32,
                  height: 32,
                  child: const CircularProgressIndicator(),
                  margin: EdgeInsets.only(
                      left: size.width * .3,
                      right: size.width * .3,
                      bottom: size.height * .01,
                      top: size.height * .01
                  ),
              ),
            ),
            child: TranslucentMultipleButtonHorizontal(
              size: Size(size.width * 0.8, 44),
              leftText: _isUpdate ? 'Cancel' : null,
              onTapLeftText: _isUpdate ? _onTapCancel : null,
              rightText: !_isUpdate ? 'Edit' : 'Save',
              onTapRightText: !_isUpdate ? _onTapEdit : _onTapSave,
              margin: EdgeInsets.only(
                  left: size.width * .3,
                  right: size.width * .3,
                  bottom: size.height * .01,
                  top: size.height * .01
              ),
            ),
          ),
        ],
      ),
    );
  }

}