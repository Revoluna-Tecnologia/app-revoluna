// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

//import 'package:uni_links/uni_links.dart';
import 'package:app_links/app_links.dart';
import 'dart:async';
import '/pages/other/vaga_bottom_sheet/vaga_bottom_sheet_widget.dart';

Future<void> _showVagaBottomSheet(String vagaId) async {
  try {
    // Buscar dados da vaga e todas as candidaturas para esta vaga
    final vagaData = await SupaFlow.client
        .from('vw_vagas_candidaturas')
        .select()
        .eq('vagas_id', vagaId);

    if (vagaData.isEmpty) {
      return;
    }

    // Pegar a primeira linha para os dados principais da vaga
    final vagaRow = VwVagasCandidaturasRow(vagaData.first);

    // Converter todas as linhas para lista de candidaturas
    final candidatesList =
        vagaData.map((item) => VwVagasCandidaturasRow(item)).toList();

    // Determinar se é favorito (baseado no campo medico_favorito da primeira linha)
    final isFavorite = vagaRow.medicoFavorito ?? false;

    final BuildContext? context = appNavigatorKey.currentContext;

    if (context != null && context.mounted) {
      await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        useSafeArea: true,
        builder: (context) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Padding(
              padding: MediaQuery.viewInsetsOf(context),
              child: VagaBottomSheetWidget(
                speciality: vagaRow.especialidadeNome,
                value: vagaRow.vagasValor?.toDouble(),
                hospital: vagaRow.hospitalNome,
                date: vagaRow.vagasData,
                datecreated: vagaRow.vagasCreatedate,
                startTime: vagaRow.vagasHorainicio?.time,
                endTime: vagaRow.vagasHorafim?.time,
                shift: vagaRow.vagasPeriodoNome,
                type: vagaRow.vagasTipoNome,
                lat: vagaRow.hospitalLat,
                lon: vagaRow.hospitalLog,
                address: vagaRow.hospitalEnd,
                jobid: vagaRow.vagasId,
                contractor: vagaRow.grupoNome,
                contractorName: vagaRow.escalistaNome,
                contractorPhone: vagaRow.escalistaTelefone ?? 'Não informado',
                contractorEmail: vagaRow.escalistaEmail ?? 'Não informado',
                payday: vagaRow.vagasDatapagamento,
                payment: vagaRow.vagasFormarecebimentoNome,
                avatarHospital: vagaRow.hospitalAvatar,
                sector: vagaRow.setorNome,
                candidates: candidatesList,
                showFavorite: isFavorite,
              ),
            ),
          );
        },
      );
    }
  } catch (e) {
    //debugPrint('Erro ao mostrar bottom sheet: $e');
  }
}

Future<void> initializeDeeplinks() async {
  // Handle app start from deeplink
  final appLinks = AppLinks();

  final initialLink = await appLinks.getInitialLink();
  if (initialLink != null) {
    await handleDeeplink(initialLink.toString());
  }

  // Handle link when app is already running
  appLinks.uriLinkStream.listen((Uri uri) {
    handleDeeplink(uri.toString());
  }, onError: (err) {
    //debugPrint('Erro no stream de links: $err');
  });
}

Future<void> handleDeeplink(String link) async {
  //debugPrint('Deeplink recebido: $link');

  final Uri uri = Uri.parse(link);
  //debugPrint('URI parseada - host: ${uri.host}, path: ${uri.path}, segments: ${uri.pathSegments}, query: ${uri.queryParameters}');

  final String? route = uri.pathSegments[0];
  final String? vagaId = uri.queryParameters['id'];

  if (vagaId != null &&
      vagaId.isNotEmpty &&
      route != null &&
      route.isNotEmpty) {
    // Navigate to route page first
    GoRouter.of(appNavigatorKey.currentContext!).go('/$route');

    await _showVagaBottomSheet(vagaId);
  }
}
