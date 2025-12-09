// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
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
import '/auth/supabase_auth/auth_util.dart';

Future<void> _showVagaBottomSheet(String vagaId) async {
  //print("🔗 _showVagaBottomSheet INICIADO para vagaId: $vagaId");

  try {
    //print("🔗 Buscando dados da vaga no Supabase...");

    // Buscar dados da vaga
    final vagaData = await SupaFlow.client
        .from('vw_vagas_abertas')
        .select()
        .eq('vaga_id', vagaId);

    // Verificar se o usuário está autenticado
    final isAuthenticated = currentUserUid.isNotEmpty;

// Buscar dados de candidaturas apenas se o usuário estiver autenticado
    VwVagasCandidaturasRow? candidatesData;
    if (isAuthenticated) {
      try {
        // Tentar buscar a linha específica do médico logado
        final medicoData = await SupaFlow.client
            .from('vw_vagas_candidaturas')
            .select()
            .eq('vaga_id', vagaId)
            .eq('medico_id', currentUserUid)
            .maybeSingle();

        if (medicoData != null) {
          candidatesData = VwVagasCandidaturasRow(medicoData);
        } else {
          // Se não houver linha do médico, buscar qualquer linha da vaga
          final anyData = await SupaFlow.client
              .from('vw_vagas_candidaturas')
              .select()
              .eq('vaga_id', vagaId)
              .limit(1)
              .maybeSingle();

          if (anyData != null) {
            candidatesData = VwVagasCandidaturasRow(anyData);
          }
        }
      } catch (e) {
        // Em caso de erro, candidatesData fica null
      }
    }

    // Pegar a primeira linha para os dados principais da vaga
    final vagaRow = VwVagasAbertasRow(vagaData.first);

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
                  value: vagaRow.vagaValor?.toDouble(),
                  hospital: vagaRow.hospitalNome,
                  date: vagaRow.vagaData,
                  datecreated: vagaRow.vagaCreatedate,
                  startTime: vagaRow.vagaHorainicio?.time,
                  endTime: vagaRow.vagaHorafim?.time,
                  shift: vagaRow.periodoNome,
                  type: vagaRow.tiposVagaNome,
                  lat: vagaRow.hospitalLat,
                  lon: vagaRow.hospitalLog,
                  address: vagaRow.hospitalEnd,
                  jobid: vagaRow.vagaId,
                  contractor: vagaRow.grupoNome,
                  contractorName: vagaRow.escalistaNome,
                  contractorPhone: vagaRow.escalistaTelefone ?? 'Não informado',
                  contractorEmail: vagaRow.escalistaEmail ?? 'Não informado',
                  payday: vagaRow.vagaDatapagamento,
                  payment: vagaRow.formarecebimentoNome,
                  avatarHospital: vagaRow.hospitalAvatar,
                  sector: vagaRow.setorNome,
                  candidates: candidatesData),
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
  try {
    //print("🔗 INICIANDO initializeDeeplinks");

    final appLinks = AppLinks();
    //print("🔗 AppLinks criado");

    await Future.delayed(Duration(milliseconds: 500));

    final initialLink = await appLinks.getInitialLink();
    //print("🔗 initialLink: $initialLink");

    if (initialLink != null) {
      //print("🔗 Deeplink inicial detectado");

      // Verificar se app já carregou via AppState
      if (FFAppState().appFullyLoaded) {
        //print("🔗 App já carregado (AppState) - processando imediatamente");
        await handleDeeplink(initialLink.toString());
      } else {
        //print("🔗 App ainda carregando - salvando no AppState");
        FFAppState().update(() {
          FFAppState().pendingDeeplinkUrl = initialLink.toString();
        });

        // Timer de backup
        Timer(Duration(seconds: 4), () async {
          if (FFAppState().pendingDeeplinkUrl.isNotEmpty) {
            //print("🔗 Timer backup - processando deeplink do AppState");
            await processPendingDeeplinkFromAppState();
          }
        });
      }
    }

    // Stream para deeplinks quando app já está rodando
    appLinks.uriLinkStream.listen((Uri uri) {
      //print("🔗 Stream link - processando imediatamente: ${uri.toString()}");
      handleDeeplink(uri.toString());
    }, onError: (err) {
      //print("🔗 ERRO no stream: $err");
    });

    //print("🔗 initializeDeeplinks CONCLUÍDO");
  } catch (e) {
    //print("🔗 ERRO em initializeDeeplinks: $e");
  }
}

Future<void> processPendingDeeplinkFromAppState() async {
  if (FFAppState().pendingDeeplinkUrl.isNotEmpty) {
    //print("🔗 Processando deeplink do AppState: ${FFAppState().pendingDeeplinkUrl}");
    final link = FFAppState().pendingDeeplinkUrl;

    // Limpar AppState
    FFAppState().update(() {
      FFAppState().pendingDeeplinkUrl = '';
    });

    await handleDeeplink(link);
  } else {
    //print("🔗 Nenhum deeplink pendente no AppState");
  }
}

Future<void> handleDeeplink(String link) async {
  try {
    //print('🔗 handleDeeplink: $link');

    final Uri uri = Uri.parse(link);
    //print('🔗 URI parseada - host: ${uri.host}, path: ${uri.path}');

    // Aguardar context estar disponível (até 5 tentativas)
    BuildContext? context;
    for (int i = 0; i < 5; i++) {
      context = appNavigatorKey.currentContext;
      if (context != null) break;
      //print('🔗 Aguardando context - tentativa ${i + 1}');
      await Future.delayed(Duration(milliseconds: 200));
    }

    if (context == null) {
      //print('🔗 Context ainda não disponível - salvando no AppState para retry');
      FFAppState().update(() {
        FFAppState().pendingDeeplinkUrl = link;
      });
      return;
    }

    //print('🔗 Context disponível - processando deeplink');

    // Processar custom scheme (revoluna://)
    if (uri.scheme == 'revoluna') {
      final String? route =
          uri.pathSegments.isNotEmpty ? uri.pathSegments[0] : null;
      final String? vagaId = uri.queryParameters['id'];

      //print('🔗 Custom scheme - route: $route, vagaId: $vagaId');

      if (vagaId != null &&
          vagaId.isNotEmpty &&
          route != null &&
          route.isNotEmpty) {
        //print('🔗 Navegando para /$route com vaga: $vagaId');
        GoRouter.of(context).go('/$route');

        // Aguardar navegação completar antes de mostrar bottom sheet
        await Future.delayed(Duration(milliseconds: 1000));
        await _showVagaBottomSheet(vagaId);
      }
    }
    // Processar Universal Links (HTTPS) - para futuro uso
    else if (uri.scheme == 'https' && uri.host == 'link.revoluna.com.br') {
      final String? path =
          uri.pathSegments.isNotEmpty ? uri.pathSegments[0] : null;
      final String? vagaId = uri.queryParameters['id'];

      //print('🔗 Universal Link - path: $path, vagaId: $vagaId');

      if (path == 'perfil') {
        //print('🔗 Navegando para perfil');
        GoRouter.of(context).go('/perfil');
      } else if (path == 'vaga' && vagaId != null && vagaId.isNotEmpty) {
        //print('🔗 Navegando para vaga: $vagaId');
        GoRouter.of(context).go('/explorar');
        await Future.delayed(Duration(milliseconds: 1000));
        await _showVagaBottomSheet(vagaId);
      }
    }
  } catch (e) {
    //print('🔗 ERRO em handleDeeplink: $e');
  }
}
