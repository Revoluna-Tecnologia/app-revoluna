import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'placeholder_loading_model.dart';
export 'placeholder_loading_model.dart';

class PlaceholderLoadingWidget extends StatefulWidget {
  const PlaceholderLoadingWidget({super.key});

  @override
  State<PlaceholderLoadingWidget> createState() =>
      _PlaceholderLoadingWidgetState();
}

class _PlaceholderLoadingWidgetState extends State<PlaceholderLoadingWidget> {
  late PlaceholderLoadingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlaceholderLoadingModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
