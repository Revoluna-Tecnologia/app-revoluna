// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

class WidgetRichText extends StatefulWidget {
  const WidgetRichText({
    super.key,
    this.width,
    this.height,
    this.widgetbuilder,
    this.address,
  });
  final double? width;
  final double? height;
  final Widget Function()? widgetbuilder;
  final String? address;

  @override
  State<WidgetRichText> createState() => _WidgetRichTextState();
}

class _WidgetRichTextState extends State<WidgetRichText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Endereço: ',
              style: FlutterFlowTheme.of(context).titleSmall.override(
                    letterSpacing: 0.0,
                  ),
            ),
            TextSpan(
              text: valueOrDefault<String>(widget.address, '[address]'),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    letterSpacing: 0.0,
                    decoration: TextDecoration.underline,
                  ),
            ),
            if (widget.widgetbuilder != null)
              WidgetSpan(
                child: widget.widgetbuilder!(),
                alignment: PlaceholderAlignment.middle,
              ),
          ],
        ),
      ),
    );
  }
}
