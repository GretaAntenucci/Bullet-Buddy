import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  /// This variable checks if the field is a password field or not
  final bool isPass;
  final ValueNotifier<bool> open = ValueNotifier(true);
  final String? hintText;
  final Widget? icon;
  final TextInputType textInputType;

  final BorderRadius defaultBorderRadius = BorderRadius.circular(50);

  CustomTextField({
    super.key,
    this.isPass = false,
    this.icon,
    this.hintText,
    this.textInputType = TextInputType.text,
  });

  CustomTextField.password({
    super.key,
    this.isPass = true,
    this.hintText,
    this.icon,
    this.textInputType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return isPass
        ? ValueListenableBuilder(
            valueListenable: open,
            builder: (BuildContext context, bool value, Widget? child) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: defaultBorderRadius,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.7),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    )
                  ],
                ),
                child: TextField(
                  keyboardType: textInputType,
                  obscureText: open.value,
                  decoration: InputDecoration(
                    constraints: BoxConstraints(
                      maxHeight: 70,
                      maxWidth: MediaQuery.of(context).size.width,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () => open.value = !open.value,
                      icon: open.value
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.remove_red_eye),
                    ),
                    prefixIcon: icon ??
                        const Icon(
                          Icons.lock,
                        ),
                    hintText: hintText,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: defaultBorderRadius,
                    ),
                  ),
                ),
              );
            },
          )
        : notPasswordCustomTextField();
  }

  Widget notPasswordCustomTextField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: defaultBorderRadius,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: TextField(
        keyboardType: textInputType,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefixIcon: icon ?? const Icon(Icons.person),
          hintText: hintText,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: defaultBorderRadius,
          ),
        ),
      ),
    );
  }
}
