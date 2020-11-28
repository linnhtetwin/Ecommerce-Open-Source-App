import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:EOA/Sources/nominatim/nominatimLocationPicker.dart';

class AddressField extends StatefulWidget {
  const AddressField({
    this.autoFocus = false,
    this.border,
    this.focusedBorder,
    this.color,
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
    // ignore: deprecated_member_use_from_same_package
    @deprecated this.onChanged,
  }) : assert((backgroundColor == null && backgroundBorderRadius == null) ||
            (backgroundColor != null && backgroundBorderRadius != null));
  // assert((hasFloatingPlaceholder == true && hintText == null) ||
  //     (hasFloatingPlaceholder == false && hintText != null));

  /// if autofocus is true keyboard pops up as soon as the widget is rendered on screen
  /// defaults to false
  final bool autoFocus;

  /// Input Border for the password field when not in focus
  final InputBorder border;

  /// changes the primary color of the AddressField
  final Color color;

  /// Background Color for the textfield must be specified with [backgroundBorderRadius]
  final Color backgroundColor;

  /// Border for the textfield background must be specified with backgroundColor
  final BorderRadiusGeometry backgroundBorderRadius;

  /// Input Border for the password Field when in Focus
  final InputBorder focusedBorder;

  /// Input Border for the password Field when in Focus and has an error
  final InputBorder errorFocusedBorder;

  /// paddint for the textfield when [backgroundBorderRadius] != null
  final EdgeInsetsGeometry textPadding;

  /// A controller for an editable AddressField.

  final String pattern;

  /// whether the placeholder can float to left top on focus
  final String labeltext;

  final bool hasFloatingPlaceholder;

  ///default text to show on the AddressField
  /// This hint is hidden/does not take effect if [hasFloatingPlaceholder] = true
  final String hintText;

  /// styling fpr the the hint and the floating label,
  /// defaults to same as inputStyle if not specified
  final TextStyle hintStyle;

  /// styling the AddressField Text
  final TextStyle inputStyle;

  /// style for the the errorMessage
  final TextStyle errorStyle;

  /// The maximum number of lines the [errorText] can occupy.
  ///
  /// Defaults to null, which means that the [errorText] will be limited
  /// to a single line with [TextOverflow.ellipsis].
  final int errorMaxLines;

  /// custom message to show if the input password does not match the pattern.
  final String errorMessage;

  /// if hasFloatingPlaceholder==true
  /// a text label floats to left top on focus
  /// The label defaults to "Password" if not specified,
  ///
  /// floating text can be styled using [hintStyle]
  ///
  /// Note: either [floatingText]/ [hintText] can be shown at a time
  /// that mainly depends on property [hasFloatingPlaceholder]
  final String floatingText;

  /// the max number of characters the password field can support
  final int maxLength;

  /// function triggerred when the submit button on keyboard is pressed
  final Function(String) onSubmit;

  /// A Callback function triggered when the text insude the AddressField changes
  ///
  @deprecated
  final Function onChanged;

  /// Icon used to unhide the password when touch in Contact with the icon
  final Icon suffixIcon;

  /// The Icon to show at the right end of the textfield, suffix Icon can be removed by setting suffixIconEnabled to false,defaults to true
  final bool suffixIconEnabled;

  @override
  State createState() {
    return AddressFieldState();
  }
}

class AddressFieldState extends State<AddressField> {
  bool obscureText = false;
//wrap your toggle icon in Gesture Detector
  var controltext = TextEditingController();

  Future getLocationWithNominatim() async {
    Map result = await showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return NominatimLocationPicker(
            //searchHint: 'Yangon',
            awaitingForLocation: "Yangon",
          );
        });
    if (result != null) {
      print('result retuned');
      print(result);
      controltext.text = "Building__  Room__\n" +
          result['road'] +
          result['neighbourhood'] +
          "\n" +
          result['suburb'] +
          result['postcode'] +
          "\n" +
          result['state'] +
          "\n" +
          result['latitide'].toString() +
          "  " +
          result['longitude'].toString();
    } else {
      return;
    }
  }

  Widget addressFieldWidget() {
    return Theme(
      data: ThemeData(
          primaryColor:
              widget.color ?? Theme.of(context).primaryColor ?? Colors.red),
      child: StreamBuilder<String>(
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
              controller: controltext,
              minLines: 1,
              maxLines: 5,
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
                    color: Color.fromARGB(255, 250, 35, 35),
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
                    : (widget.hintText ?? 'Deliver Address'),
                labelStyle: widget.hintStyle ?? widget.inputStyle,
                suffixIcon: widget.suffixIconEnabled
                    ? GestureDetector(
                        child: widget.suffixIcon ?? Icon(Icons.add_location),
                        onTap: () async {
                          await getLocationWithNominatim();
                        },
                      )
                    : null,
              ),
              onSubmitted: widget.onSubmit,
              style: widget.inputStyle,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return addressFieldWidget();
  }
}
