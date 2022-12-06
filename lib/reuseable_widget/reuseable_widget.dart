import 'package:flutter/material.dart';
import 'package:jemputah_app/constants/color.dart';

TextField reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.black.withOpacity(0.9)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: AppColors.mainGreen,
      ),
      contentPadding: EdgeInsets.zero,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      labelText: text,
      labelStyle: TextStyle(color: AppColors.hintTextColor),
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

Container signInSignUpButton(
    BuildContext context, bool isLogin, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.only(left: 30, right: 30, top: 60),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(
        isLogin ? 'MASUK' : 'DAFTAR',
        style: TextStyle(color: Colors.white),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return AppColors.buttonBackground;
            }
            return AppColors.buttonBackground;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
    ),
  );
}
