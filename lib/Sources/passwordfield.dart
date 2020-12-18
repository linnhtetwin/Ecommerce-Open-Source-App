import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import '../Sources/password_bloc.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    this.autoFocus = false,
    this.border,
    this.focusedBorder,
    this.color,
    this.controller,
    this.hasFloatingPlaceholder = false,
    this.hintText,
    this.hintStyle,
    this.inputStyle,
    this.floatingText,
    this.maxLength,
    this.errorMaxLines,
    this.onSubmit,
    this.backgroundColor,
    this.backgroundBorderRadius,
    this.textPadding,
    this.errorStyle,
    this.errorFocusedBorder,
    this.errorMessage,
    this.suffixIcon,
    this.pattern,
    this.labeltext,
    this.suffixIconEnabled = true,
    @deprecated this.onChanged,
  }) : assert((backgroundColor == null && backgroundBorderRadius == null) ||
            (backgroundColor != null && backgroundBorderRadius != null));
  final bool autoFocus;
  final InputBorder border;
  final Color color;
  final Color backgroundColor;
  final BorderRadiusGeometry backgroundBorderRadius;
  final InputBorder focusedBorder;
  final InputBorder errorFocusedBorder;
  final EdgeInsetsGeometry textPadding;
  final TextEditingController controller;
  final String pattern;
  final String labeltext;
  final bool hasFloatingPlaceholder;
  final String hintText;
  final TextStyle hintStyle;
  final TextStyle inputStyle;
  final TextStyle errorStyle;
  final int errorMaxLines;
  final String errorMessage;
  final String floatingText;
  final int maxLength;
  final Function(String) onSubmit;
  @deprecated
  final Function onChanged;
  final Icon suffixIcon;
  final bool suffixIconEnabled;
  @override
  State createState() {
    return PasswordFieldState();
  }
}
class PasswordFieldState extends State<PasswordField> {
  bool obscureText = true;
  void inContact(TapDownDetails details) {
    setState(() {
      obscureText = false;
    });
  }

  void outContact(TapUpDetails details) {
    setState(() {
      obscureText = true;
    });
  }
  PasswordBloc bloc = PasswordBloc();
  Widget passwordFieldWidget() {
    return Theme(
      data: ThemeData(
          primaryColor:
              widget.color ?? Theme.of(context).primaryColor ?? Colors.green),
      child: StreamBuilder<String>(
        stream: bloc.password,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            padding: widget.backgroundColor != null ? widget.textPadding : null,
            decoration: widget.backgroundColor != null
                ? BoxDecoration(
                    color: widget.backgroundColor,
                    borderRadius: widget.backgroundBorderRadius)
                : null,
            child: TextField(
              maxLength: widget.maxLength,
              controller: widget.controller,
              obscureText: obscureText,
              autofocus: widget.autoFocus,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                border: widget.backgroundColor != null
                    ? InputBorder.none
                    : widget.border,
                errorText: snapshot.hasError
                    ? widget.errorMessage ?? snapshot.error
                    : null,
                errorMaxLines: widget.errorMaxLines,
                errorStyle: widget.errorStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 35, 250, 35),
                  ),
                ),
                focusedBorder: widget.focusedBorder,
                hintText:
                    widget.hasFloatingPlaceholder ? null : widget.hintText,
                hintStyle: widget.hintStyle ?? widget.inputStyle,
                counterText: '',
                focusedErrorBorder: widget.errorFocusedBorder,
                floatingLabelBehavior: widget.hasFloatingPlaceholder
                    ? FloatingLabelBehavior.auto
                    : FloatingLabelBehavior.never,
                labelText: widget.hasFloatingPlaceholder
                    ? widget.floatingText ?? widget.labeltext
                    : (widget.hintText ?? 'Type Password'),
                labelStyle: widget.hintStyle ?? widget.inputStyle,
                suffixIcon: widget.suffixIconEnabled
                    ? GestureDetector(
                        child: widget.suffixIcon ?? Icon(Icons.remove_red_eye),
                        onTapDown: inContact,
                        onTapUp: outContact,
                      )
                    : null,
              ),
              onSubmitted: widget.onSubmit,
              style: widget.inputStyle,
              onChanged: (text) =>
                  bloc.onPasswordChanged(widget.pattern ?? '.*', text),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return passwordFieldWidget();
  }
}
