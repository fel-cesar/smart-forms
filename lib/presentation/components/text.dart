import 'package:flutter/material.dart';
import 'package:smart_forms/constants.dart';

enum TextSize { xs, sm, base, lg, xl, xl2, xl3, xl4, xl5 }

const textStyles = {
  TextSize.xs: TextStyle(fontSize: 10.5, fontWeight: FontWeight.w400),
  TextSize.sm: TextStyle(fontSize: 12.25, fontWeight: FontWeight.w400),
  TextSize.base: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
  TextSize.lg: TextStyle(fontSize: 15.75, fontWeight: FontWeight.w400),
  TextSize.xl2: TextStyle(fontSize: 21, fontWeight: FontWeight.w400),
  TextSize.xl3: TextStyle(fontSize: 26.25, fontWeight: FontWeight.w400),
  TextSize.xl4: TextStyle(fontSize: 31.5, fontWeight: FontWeight.w400),
  TextSize.xl5: TextStyle(fontSize: 42, fontWeight: FontWeight.w400),
};

class _Text extends StatelessWidget {
  const _Text(this.text,
      {required this.baseStyle, required this.fontWeight, this.style});

  final String text;
  final FontWeight fontWeight;
  final TextStyle baseStyle;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: baseStyle
          .copyWith(fontWeight: fontWeight, color: Constants.gray800)
          .merge(style),
    );
  }
}

class TextXS extends StatelessWidget {
  const TextXS(this.text, {super.key, this.style})
      : fontWeight = FontWeight.w400;
  const TextXS.bold(this.text, {super.key, this.style})
      : fontWeight = FontWeight.bold;

  final String text;
  final FontWeight fontWeight;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return _Text(text,
        baseStyle: textStyles[TextSize.xs]!,
        fontWeight: fontWeight,
        style: style);
  }
}

class TextSM extends StatelessWidget {
  const TextSM(this.text, {super.key, this.style})
      : fontWeight = FontWeight.w400;
  const TextSM.bold(this.text, {super.key, this.style})
      : fontWeight = FontWeight.bold;

  final String text;
  final FontWeight fontWeight;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return _Text(text,
        baseStyle: textStyles[TextSize.sm]!,
        fontWeight: fontWeight,
        style: style);
  }
}

class TextBase extends StatelessWidget {
  const TextBase(this.text, {super.key, this.style})
      : fontWeight = FontWeight.w400;
  const TextBase.bold(this.text, {super.key, this.style})
      : fontWeight = FontWeight.bold;

  final String text;
  final FontWeight fontWeight;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return _Text(text,
        baseStyle: textStyles[TextSize.base]!,
        fontWeight: fontWeight,
        style: style);
  }
}

class TextLG extends StatelessWidget {
  const TextLG(this.text, {super.key, this.style})
      : fontWeight = FontWeight.w400;
  const TextLG.bold(this.text, {super.key, this.style})
      : fontWeight = FontWeight.bold;

  final String text;
  final FontWeight fontWeight;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return _Text(text,
        baseStyle: textStyles[TextSize.lg]!,
        fontWeight: fontWeight,
        style: style);
  }
}

class TextXL extends StatelessWidget {
  const TextXL(this.text, {super.key, this.style})
      : fontWeight = FontWeight.w400;
  const TextXL.bold(this.text, {super.key, this.style})
      : fontWeight = FontWeight.bold;

  final String text;
  final FontWeight fontWeight;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return _Text(text,
        baseStyle: textStyles[TextSize.xl]!,
        fontWeight: fontWeight,
        style: style);
  }
}

class TextXL2 extends StatelessWidget {
  const TextXL2(this.text, {super.key, this.style})
      : fontWeight = FontWeight.w400;
  const TextXL2.bold(this.text, {super.key, this.style})
      : fontWeight = FontWeight.bold;

  final String text;
  final FontWeight fontWeight;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return _Text(text,
        baseStyle: textStyles[TextSize.xl2]!,
        fontWeight: fontWeight,
        style: style);
  }
}

class TextXL3 extends StatelessWidget {
  const TextXL3(this.text, {super.key, this.style})
      : fontWeight = FontWeight.w400;
  const TextXL3.bold(this.text, {super.key, this.style})
      : fontWeight = FontWeight.bold;

  final String text;
  final FontWeight fontWeight;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return _Text(text,
        baseStyle: textStyles[TextSize.xl3]!,
        fontWeight: fontWeight,
        style: style);
  }
}

class TextXL4 extends StatelessWidget {
  const TextXL4(this.text, {super.key, this.style})
      : fontWeight = FontWeight.w400;
  const TextXL4.bold(this.text, {super.key, this.style})
      : fontWeight = FontWeight.bold;

  final String text;
  final FontWeight fontWeight;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return _Text(text,
        baseStyle: textStyles[TextSize.xl4]!,
        fontWeight: fontWeight,
        style: style);
  }
}

class TextXL5 extends StatelessWidget {
  const TextXL5(this.text, {super.key, this.style})
      : fontWeight = FontWeight.w400;
  const TextXL5.bold(this.text, {super.key, this.style})
      : fontWeight = FontWeight.bold;

  final String text;
  final FontWeight fontWeight;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return _Text(text,
        baseStyle: textStyles[TextSize.xl5]!,
        fontWeight: fontWeight,
        style: style);
  }
}
