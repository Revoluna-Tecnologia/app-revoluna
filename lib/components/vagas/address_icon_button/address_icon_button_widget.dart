import '/components/dialogs/small_dialog/small_dialog_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'address_icon_button_model.dart';
export 'address_icon_button_model.dart';

class AddressIconButtonWidget extends StatefulWidget {
  const AddressIconButtonWidget({
    super.key,
    this.address,
  });

  final String? address;

  @override
  State<AddressIconButtonWidget> createState() =>
      _AddressIconButtonWidgetState();
}

class _AddressIconButtonWidgetState extends State<AddressIconButtonWidget> {
  late AddressIconButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddressIconButtonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => FlutterFlowIconButton(
        borderRadius: 8.0,
        buttonSize: 30.0,
        icon: Icon(
          FFIcons.kcopy,
          color: FlutterFlowTheme.of(context).tertiary,
          size: 16.0,
        ),
        onPressed: () async {
          logFirebaseEvent('ADDRESS_ICON_BUTTON_COMP_copy_ICN_ON_TAP');
          logFirebaseEvent('IconButton_copy_to_clipboard');
          await Clipboard.setData(ClipboardData(text: widget!.address!));
          if (isiOS) {
            logFirebaseEvent('IconButton_alert_dialog');
            await showAlignedDialog(
              barrierColor: Colors.transparent,
              context: context,
              isGlobal: false,
              avoidOverflow: false,
              targetAnchor: AlignmentDirectional(0.0, 0.0)
                  .resolve(Directionality.of(context)),
              followerAnchor: AlignmentDirectional(0.0, -0.1)
                  .resolve(Directionality.of(context)),
              builder: (dialogContext) {
                return Material(
                  color: Colors.transparent,
                  child: SmallDialogWidget(
                    dialog: 'Endereço copiado!',
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
