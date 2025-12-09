# PR 2.2.3 — Atualizações desta branch em relação à `main`

## Resumo

### Novas Funcionalidades
- **`vw_plantoes_pagamentos`**: Nova view para consolidar plantões e recebimentos.

### Correções de Bugs
- **Check-in/Check-out**: Reutiliza registros existentes por vaga, se houver. Nova funcionalidade do Houston também pode agora adicionar linhas à tabela.
- **Calendário**: Corrigida verificação para eventos que atravessam a meia-noite na função de adicionar ao calendário.
- **Perfil**: Corrigida atualização de data de nascimento.

### Refatorações
- **Normalização do Schema Supabase**: Pluralização/renomeação de tabelas e views (`beneficios`, `periodos`, `requisitos`, `tipos_vaga`, `vagas_beneficios`, `vagas_requisitos`, `hospitais`, `grupos`, `vagas_recorrencias`, `whatsapp_number`, `codigos_area`, `escalistas`). Remoção de artefatos legados (`carteira_digital`, `validacao_documentos`, `sistema_logs`, `vagas_completo`, views antigas `vw_*`). Reescrita de `vw_vagas_abertas`/`vw_vagas_candidaturas`.
- **Modelos Sincronizados**: Classes de dados revisadas (`vagas`, `medicos`, `pagamentos`, `especialidades`, `candidaturas`, etc.) com novos campos/nomes alinhados ao banco.
- **Funções Customizadas**: Nomes de campos atualizados em `initialize_deeplinks`, `insert_candidaturas`, `check_in_check_out` e `conciergenumber` para consistência com o novo schema.
- **Listagens e UI**: Home, Explorar, Escalas, Histórico, Perfil e Header consumindo as novas views, com ordenação e filtros. Bottom sheet enriquecido com contratante, forma de recebimento, valores e geolocalização.
- **Médico Favorito**: Consulta de médico favorito na abertura da página de vagas. A informação foi removida da view pois era uma coluna que demandava muito esforço do banco de dados.
- **Formulários**: Dropdowns redefinidos como nulo ao resetar formulários (Explorar/Histórico). Listas de especialidades e códigos de área ordenadas alfabeticamente no Perfil.
- **Pagamentos**: Removido switch de pagamento da página de vagas — responsabilidade transferida para o Houston (lado contratante).
- **Limpeza**: Remoção de lógica redundante de requisições, simplificação de filtros em Escalas, reorganização geral de código. Removidos componente e função não utilizados. Componente de loading migrado para pasta adequada.

### Dependências
- `flutter_inappwebview_android`: 1.1.8 → 1.1.9+1
- `flutter_inappwebview_ios`: 1.1.5 → 1.1.6
