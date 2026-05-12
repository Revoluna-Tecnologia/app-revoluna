# Histórico de Versões - Revoluna

## [2.3.2] - 12/05/2026

### ✨ **Novas Funcionalidades**

#### 📝 **Cadastro**
- **Validação de Idade**: Adicionada validação de idade mínima no campo de data de nascimento da tela de cadastro, com mensagem de erro contextual

---

### 🐛 **Correções**

#### 🔄 **Navegação**
- **Serialização de Datas**: Corrigida atualização de parâmetros de navegação que perdiam datas ao serializar/desserializar entre páginas do FlutterFlow

---

### 🔄 **Melhorias e Refatorações**

#### 📋 **Listagens de Vagas**
- **Ordenação no Servidor**: Removida ordenação client-side das queries de vagas em Escalas, Explorar, Histórico e Home — a ordenação passa a ser feita diretamente no banco de dados

#### 🧹 **Limpeza de Código**
- **Arredondamento de Bordas**: Removidas redundâncias de `borderRadius` em componentes e páginas (checkemail, checkphone, initial, localização, paywall e bottom sheet de vagas)
- **main.dart**: Pequenos ajustes de limpeza no código gerado pelo FlutterFlow

---

### 🔧 **Configurações e Build**

#### 📦 **Dependências**
- **Atualizações do FlutterFlow**: Atualizações de dependências e ajustes em `flutter_flow_drop_down.dart` e `flutter_flow_widgets.dart`
- **pubspec.yaml**: Versões de pacotes sincronizadas

---

### 📊 **Estatísticas da Versão 2.3.2**

- **Total de Commits**: 6
- **Commits Principais**:
  - validação de idade no cadastro
  - correção de serialização de datas na navegação
  - atualizações de dependências do FlutterFlow
  - remoção de ordenação client-side das queries de vagas
  - limpeza de redundâncias de border radius
  - limpeza geral de código FlutterFlow

#### 🎯 **Impactos Principais**
- **UX**: Cadastro mais robusto com validação de idade e navegação preservando datas corretamente
- **Performance**: Ordenação de vagas delegada ao banco, reduzindo trabalho no cliente
- **Manutenibilidade**: Código FlutterFlow mais limpo e dependências atualizadas

---

## [2.3.1] - 18/03/2026

### 🐛 **Correções**

#### 📋 **Detalhe da Vaga**
- **Comparação de Data "Sem Data"**: Corrigida a comparação com `nodate` no bottom sheet de vagas, que falhava por diferença de fuso horário. Agora a comparação é feita via `dateTimeFormat` em vez de comparação direta de `DateTime`
- **Reorganização de Condicionais**: Ajustada a ordem dos blocos condicionais de prazo de pagamento para tratar corretamente vagas com data "a combinar"

---

## [2.3.0] - 16/03/2026

### ✨ **Novas Funcionalidades**

#### 🤖 **Suporte a Vagas da IA Jull.ia**
- **Nova Origem de Vagas**: O app agora trata corretamente vagas enviadas ao banco de dados pela IA Jull.ia
- **Vagas sem Data**: Adicionado suporte a vagas com data indefinida usando tratamento específico no estado e nas consultas
- **Período da Vaga**: Listagens passam a exibir `periodoNome` como turno quando esse dado vier da nova fonte

---

### 🎨 **Melhorias de Interface e Experiência**

#### 📋 **Cards e Listagens de Vagas**
- **Fallbacks de Exibição**: Cards agora mostram `Valor a combinar` quando o valor vier zerado
- **Data Opcional**: Separadores e textos foram ajustados para lidar corretamente com vagas sem data definida
- **Layout Mais Robusto**: Melhorias de ellipsis e distribuição do conteúdo para acomodar melhor os dados vindos da Jull.ia

#### 🧾 **Detalhe da Vaga**
- **Mensagens Contextuais**: Bottom sheet agora exibe `Data a combinar`, `A combinar` e outros fallbacks quando informações não vierem preenchidas
- **Contato e Contratante**: Ajustado o tratamento de nome, telefone e informações do contratante quando a vaga vier com dados ausentes ou genéricos
- **WhatsApp**: Texto compartilhado pelo botão de contato atualizado para refletir corretamente vagas da Jull.ia
- **Prazo de Pagamento**: Ajustada a exibição do prazo para casos como pagamento em até 24h

#### 📱 **Header**
- **Espaçamento no Android**: Adicionado padding extra no header para melhorar o encaixe visual no topo da tela

---

### 🔄 **Melhorias e Refatorações**

#### 🧹 **Limpeza de Código**
- **Custom Function Removida**: Removida função não utilizada de ordenação inicial por localização
- **Imports Duplicados**: Limpeza de código obsoleto em custom actions

#### 🛠️ **Depuração**
- **Nova Action**: Adicionada a custom action `console_log` para facilitar depurações rápidas durante desenvolvimento

---

### 🔧 **Configurações e Build**

#### 📦 **Versão e Dependências**
- **Versão do App**: Atualizada para `2.3.0+1`
- **Lockfile**: Dependências sincronizadas no `pubspec.lock`

---

### 📊 **Estatísticas da Versão 2.3.0**

- **Total de Commits**: 7
- **Arquivos Modificados**: 14
- **Commits Principais**:
  - suporte a vagas sem data no estado e nas consultas
  - fallbacks de exibição nos cards de vagas
  - fallbacks no detalhe de vagas da Jull.ia
  - padding extra no header
  - action `console_log` para depuração
  - remoção de código obsoleto
  - atualização de versão e dependências

#### 🎯 **Impactos Principais**
- **Compatibilidade**: O app passa a exibir corretamente vagas enviadas pela Jull.ia
- **UX**: Melhor tratamento para dados incompletos ou opcionais
- **Manutenibilidade**: Código legado removido e utilitário simples de debug adicionado

---

## [2.2.4] - 17/12/2025

### 🐛 **Correções de Bugs**

#### 📱 **Login por Telefone**
- **Reset de Campos**: Corrigida lógica de redefinição de campos no formulário de login por telefone

#### 📋 **Cards de Vagas**
- **Passagem de Dados**: Corrigidas passagens de informação para cards de vagas nas páginas Home e Histórico

---

### 🔄 **Melhorias e Refatorações**

#### 🖼️ **Imagens e Assets**
- **Fallback Local**: Substituídos fallbacks de imagens remotas por arquivos locais em 15+ componentes para melhor performance e confiabilidade
- **Banner de Escala**: Adicionado banner local (GIF) para lista vazia na página de escalas
- **Avatar Hospital**: Novo asset local `hospitalAvatar.png` para fallback de imagens de hospitais

#### 🎨 **Interface**
- **CardVagas**: Melhorias de layout e tratamento de overflow no componente

#### 🔄 **Componentes de Loading**
- **Reforma Completa**: Componentes de loading reformados para estado de loading reativados e componentes obsoletos removidos

---

### 🔧 **Configurações e Build**

#### 🔒 **Segurança**
- **Variáveis de Ambiente**: Proteção do arquivo `environment.json` via `.gitignore`, com adição de arquivo de exemplo

#### 📱 **Android**
- **Edge-to-Edge**: Aplicação de borda em tela cheia para Android (configuração automática FlutterFlow)

#### 🧹 **Limpeza**
- **Arquivos Obsoletos**: Removido arquivo `PR_NOTES_2.2.3.md`
- **Componente Radio Button**: Atualização automática do FlutterFlow

---

### 📊 **Estatísticas da Versão 2.2.4**

- **Total de Commits**: 9
- **Arquivos Modificados**: 31
- **Linhas Adicionadas**: ~778
- **Linhas Removidas**: ~577
- **Net Change**: +201 linhas

#### 🎯 **Impactos Principais**
- **Performance**: Imagens locais reduzem dependência de rede
- **Segurança**: Variáveis de ambiente protegidas
- **Estabilidade**: Correções em fluxos de login e exibição de vagas

---

## [2.2.3] - 09/12/2025

### ✨ **Novas Funcionalidades**

#### 📊 **Nova View de Pagamentos**
- **`vw_plantoes_pagamentos`**: Nova view para consolidar plantões e recebimentos

---

### 🐛 **Correções de Bugs**

#### 🕒 **Check-in/Check-out**
- **Sem Duplicidade**: Reutiliza o registro existente de `checkin_checkout` por vaga em vez de inserir novas linhas

#### 📅 **Calendário**
- **Eventos de Meia-Noite**: Corrigida verificação para eventos que atravessam a meia-noite na função de adicionar ao calendário

#### 👤 **Perfil**
- **Data de Nascimento**: Corrigida atualização de data de nascimento no perfil

---

### 🔄 **Melhorias e Refatorações**

#### 🗃️ **Normalização do Schema Supabase**
- **Pluralização e Limpeza**: Tabelas e views atualizadas para a nova convenção (`beneficios`, `periodos`, `requisitos`, `tipos_vaga`, `vagas_beneficios`, `vagas_requisitos`, `hospitais`, `grupos`, `vagas_recorrencias`, `whatsapp_number`, `codigos_area`, `escalistas`), removendo artefatos legados (ex.: `carteira_digital`, `validacao_documentos`, `sistema_logs`, `vagas_completo`, views antigas `vw_*`)
- **Modelos Sincronizados**: Classes de dados revisadas (`vagas`, `medicos`, `pagamentos`, `especialidades`, `candidaturas`, etc.) com novos campos/nomes alinhados ao banco
- **Views Atualizadas**: `vw_vagas_abertas` e `vw_vagas_candidaturas` reescritas para refletir status e relacionamentos atuais
- **Funções Customizadas**: Nomes de campos atualizados em `initialize_deeplinks`, `insert_candidaturas`, `check_in_check_out` e `conciergenumber` para consistência com o novo schema

#### 📱 **Listagens e UI de Vagas/Agenda**
- **Fontes Unificadas**: Home, Explorar, Escalas, Histórico, Perfil e Header agora consomem `VwVagasCandidaturas`/`VwVagasAbertas` com ordenação por horário, filtros de status e refresh por cache do `FFAppState`
- **Bottom Sheet Enriquecido**: Detalhes de vaga exibem contratante, forma de recebimento, valores e geolocalização usando os novos campos
- **Médico Favorito**: Página de vagas consulta na abertura se o médico é favorito. A informação foi removida da view pois era uma coluna que demandava muito esforço do banco de dados.
- **Lógica Simplificada**: Remoção de filtros desnecessários na consulta de candidaturas em Escalas

#### 🎛️ **Formulários e Filtros**
- **Reset de Dropdowns**: Dropdowns são redefinidos como nulo ao resetar formulários nas páginas Explorar e Histórico
- **Listas Ordenadas**: Listas de seleção de especialidades e códigos de área ordenadas alfabeticamente no Perfil

#### 💳 **Pagamentos**
- **Responsabilidade Transferida**: Removido switch de pagamento da página de vagas — a responsabilidade de marcar pagamento foi passada para o Houston (lado do contratante)

#### 🧹 **Limpeza de Código**
- **Queries Otimizadas**: Remoção de lógica redundante de requisições no banco de dados
- **Reorganização**: Limpeza geral e reorganização de código
- **Obsolescências**: Removidos componente e função não utilizadas mais no código
- **Organização**: Componente de loading migrado para pasta adequada

---

### 🔧 **Configurações e Build**

#### 📦 **Atualizações de Dependências**
- **flutter_inappwebview_android**: 1.1.8 → 1.1.9+1
- **flutter_inappwebview_ios**: 1.1.5 → 1.1.6
- Atualização automática de dependências FlutterFlow

---

### 📊 **Estatísticas da Versão 2.2.3**

- **Total de Commits**: 15
- **Arquivos Modificados**: 98
- **Linhas Adicionadas**: ~2.300
- **Linhas Removidas**: ~3.400
- **Net Change**: -1.100 linhas (limpeza e consolidação)

#### 🎯 **Impactos Principais**
- **Check-in/out**: Fluxo mais confiável com validação de GPS
- **Schema**: Banco normalizado e alinhado com convenções
- **Manutenibilidade**: Código mais limpo, menos duplicação

## [2.2.2] - 20/11/2025

### ✨ **Novas Funcionalidades**

#### 👨‍⚕️ **Edição de Dados Profissionais no Perfil**
- **Campos Editáveis**: CRM, Especialidade e RQE agora podem ser atualizados diretamente no perfil
- **Validação de CRM**: Campo CRM não pode ficar vazio, com validação em tempo real
- **Feedback Visual**: Diálogo de confirmação "Perfil atualizado!" após salvar com sucesso
- **Detecção de Mudanças**: Sistema detecta alterações e habilita botão de salvar automaticamente
- **Atualização de Estado**: CRMCheck atualizado automaticamente após edição bem-sucedida

---

### 🐛 **Correções de Bugs**

#### 🔒 **Proteção de Rotas e Informações para Estudantes**
- **Botão de Candidatura**: Desabilitado para estudantes usando verificação centralizada (`FFAppState().CRMCheck`)
- **Informações de Contato**: Dados do recrutador (nome, telefone, endereço) ocultos para estudantes
- **Remoção de Query Desnecessária**: Eliminada verificação inline que fazia query no banco a cada visualização
- **Performance Melhorada**: Verificação agora usa estado em memória ao invés de consultar banco de dados

---

### 🔄 **Melhorias e Refatorações**

#### 🎯 **Sistema Centralizado de Verificação de CRM**
- **Variável Global**: Novo campo `CRMCheck` no `FFAppState` armazenado em FlutterSecureStorage
- **Inicialização Automática**: Carregado na HomePage através de query única ao banco
- **Lógica Centralizada**: Verifica se CRM não começa com "estudante"
- **Atualização no Cadastro**: Definido automaticamente como `true` para médicos não-estudantes
- **Persistência**: Valor mantido entre sessões usando armazenamento seguro

#### 🔍 **Gestão Melhorada de Filtros de Vagas**
- **Mensagens Contextualizadas**:
  - "Sem vagas para mostrar, selecione outra data" - quando não há vagas na data
  - "Selecione uma região" - quando nenhuma região foi escolhida
- **Validação Estruturada**: Verifica disponibilidade de vagas antes de renderizar listas
- **Estados Vazios Separados**: Dois componentes EmptyList diferentes para contextos distintos
- **Filtros Robustos**: Lógica separada para filtros com e sem especialidade selecionada

---

### 🔧 **Configurações e Build**

#### 📦 **Atualizações de Dependências**
- **cross_file**: 0.3.5 → 0.3.5+1
- **file_selector_linux**: 0.9.3+2 → 0.9.3+3
- **file_selector_windows**: 0.9.3+4 → 0.9.3+5
- **Flutter SDK**: Requisito mínimo atualizado de 3.29.0 → 3.32.0

#### 🗂️ **GitIgnore**
- **VS Code**: Adicionada pasta `.vscode/` para ignorar configurações do editor

---

### 📊 **Estatísticas da Versão 2.2.2**

- **Total de Commits**: 5
- **Arquivos Modificados**: 13
- **Linhas Adicionadas**: ~7.900
- **Linhas Removidas**: ~7.600
- **Net Change**: +300 linhas (otimizações e novas funcionalidades)

#### 🎯 **Impactos Principais**
- **Segurança**: Proteção robusta contra acesso não autorizado de estudantes
- **Performance**: Redução de queries desnecessárias ao banco de dados
- **UX**: Feedback visual claro e mensagens contextualizadas
- **Manutenibilidade**: Lógica centralizada e código mais limpo
- **Conformidade**: Garantia de que apenas médicos registrados podem se candidatar

---

## [2.2.1] - 17/11/2025

### 🐛 **Correções de Bugs**

#### 🔐 **Sistema de Autenticação**
- **Login por E-mail**: Corrigido fluxo de navegação
- **Login por Telefone**: Corrigida verificação de número de telefone usando valores atuais do formulário ao invés de variáveis globais vazias
- **Cadastro de Estudantes**: Não enviava o Estado (UF) para variáveis globais e impedia o progresso no cadastro

#### 🎨 **Interface e Componentes**
- **Barra de Navegação Superior**: Removido logo da barra superior de voltar em 13 páginas para simplificação visual
- **Ícones Adaptativos**: Atualizados ícones adaptativos do Android

#### **Candidaturas**
- **Verificação de estudades**: Check de CRM para impedir estudantes de se candidatar

---

### ✨ **Novas Funcionalidades**

#### 📍 **Sistema Completo de Gerenciamento de Permissões de Localização**
- **Página Dedicada**: Nova tela para explicação do uso da localização para o usuário 
- **Integração nos Fluxos**:
  - Verificação automática após login (e-mail, telefone, senha)
  - Verificação após finalizar cadastro
  - Redirecionamento condicional: HomePage (com permissão) ou LocalizacaoWidget (sem permissão)
- **Queries Simplificadas**: Removidos filtros que faziam o sistema pedir permissão de localização (`hospital_lat`, `hospital_log`)

---

### 🔄 **Melhorias e Refatorações**

#### ✉️ **Login por E-mail com Verificação em Tempo Real**
- **Login por MagicLink**: Reconstrução do sistema que foi quebrado em alguma alteração acidental

#### 🎨 **Ajustes Visuais nas Páginas Inicial e Home**
- **HomePage**:
  - Calendário colocado dentro do scroll vertical
- **InitialPage**:
  - Removida obtenção automática de localização na inicialização
  - Carregamento imediato sem esperar geolocalização
  - Eliminado código de tracking de privacidade no dispose clonado da Home
- **Cards de Vagas**:
  - Adicionado ícone para os setores
  - Removido texto "Setor: "
  - Espaçamento padronizado
  - Melhor alinhamento visual
- **Avatar de Perfil**: Implementada lógica condicional utilizando arquivo de imagem local

---

### 🔧 **Configurações e Build**

#### 📱 **iOS - Entitlements**
- **Push Notifications**: Ambiente de produção configurado (`aps-environment: production`)
- **Sign in with Apple**: Habilitado com configuração padrão

#### 📋 **iOS - Registro de Aplicativos e Serviços Terceiros**
- **LSApplicationQueriesSchemes**: Registrados 12 esquemas de URL
  - **Mapas**: Waze, Google Maps, 99 Taxi
  - **Comunicação**: WhatsApp, Gmail, Outlook
  - **Calendários**: Apple Calendar, Fantastical, Spark, Outlook Calendar, Google Calendar
- **Background Modes**: Habilitados `processing`, `fetch`, `remote-notification`
- **Notificações**: Configuradas alertas, badges, sons e notificações críticas
- **Outras**: UIUserInterfaceStyle (Light), FirebaseAppDelegateProxyEnabled (true)

#### 🗂️ **GitIgnore Atualizado**
- **iOS**: Pods, symlinks, arquivos gerados, .DS_Store
- **Android**: .gradle, captures, local.properties, .DS_Store
- **Arquivos Removidos**: `flutter_lldb_helper.py`, `flutter_lldbinit`
- **Total**: 18 novas regras adicionadas

#### 📦 **Dependências**
- **file_selector_platform_interface**: 2.6.2 → 2.7.0

---

### 📊 **Estatísticas da Versão 2.2.1**

- **Total de Commits**: 11
- **Arquivos Modificados**: 40+
- **Linhas Adicionadas**: ~1.500
- **Linhas Removidas**: ~500
- **Arquivos Novos**: 5 (actions, widgets, models)

#### 🎯 **Impactos Principais**
- **Autenticação**: Correções críticas em 3 fluxos diferentes
- **Permissões**: Sistema completo implementado
- **UX**: Carregamento mais rápido, interface mais limpa
- **iOS**: Configurações completas para integrações e funcionalidades nativas
- **Manutenibilidade**: Código mais limpo, menos duplicação

---

## [2.2.0] - 11/11/2025

### 🎨 **Redesign Completo de Interface**

#### 🌟 **Nova Página Inicial para Área Deslogada**
- **Acesso Público a Vagas**: Usuários não autenticados podem visualizar vagas disponíveis antes de se cadastrar
- **Carrossel de Banners**: Sistema de banners de marketing para comunicação visual
- **Botão de WhatsApp Flutuante**: Contato direto com concierge via WhatsApp
- **Navegação Intuitiva**: Botão "Entrar" proeminente que direciona para login por telefone
- **Queries Otimizadas**: Filtragem automática de vagas com dados de localização válidos

#### 📊 **Header Inteligente com Contagem de Plantões**
- **Contagem Dinâmica**: Exibição automática da quantidade de plantões da semana atual
- **Pluralização Inteligente**: Sistema que adapta o texto ("plantão" vs "plantões") automaticamente
- **Filtro Temporal**: Contagem baseada em vagas dentro da semana corrente

#### 🏥 **Página de Vagas Completamente Refatorada**
- **Sistema de Paywall**: Implementado controle de acesso para candidaturas de usuários não cadastrados
- **Lógica de Candidatura Repensada**: Novo sistema com verificação de status (candidato, convocado, aprovado, check-in)
- **Integração Financeira**: Inserção automática em tabela de pagamentos ao se candidatar
- **Deep Links Otimizados**: Melhor tratamento de URLs compartilhadas de vagas
- **Estados de Candidatura**: Visualização clara do status em tempo real

#### 📱 **Nova Página de Histórico**
- **Visualização Completa**: Nova tela dedicada para histórico de plantões e candidaturas
- **Filtros Inteligentes**: Exclusão automática de vagas canceladas e sem geolocalização
- **Ordenação por Data**: Plantões ordenados por horário de início
- **Cards Otimizados**: Novo componente `card_escala` para melhor apresentação

#### 🎯 **Navegação Redesenhada**
- **Estrutura Reorganizada**: Sistema de navegação mais fluido e responsivo
- **Componentes Novos**:
  - `empty_list_houston` - Estado vazio personalizado
  - `dropdown_loading` - Loading específico para dropdowns
  - `calendar_loading` - Loading otimizado para calendário
- **Remoção de Redundâncias**: Página `plantoes` removida (1.743 linhas) em favor do novo histórico
- **Transições Melhoradas**: Animações de página mais suaves (500ms com rightToLeft)

#### 🔐 **Páginas de Login Modernizadas**
- **Botão de Voltar Reposicionado**: Movido para o topo para melhor ergonomia
- **Layout Otimizado**: Ajustes de espaçamento e posicionamento de elementos
- **Experiência Visual Melhorada**: Integração harmoniosa com novo logo

#### 🎨 **Identidade Visual Atualizada**
- **Novo Logo**: Design renovado em formato SVG (10 linhas otimizadas)
- **Ícone de App**: Atualizado de 3KB para 222KB (maior qualidade)
- **Splash Screen**: Nova tela de abertura (6.677 bytes)
- **Ícones Adaptativos Android**:
  - Foreground: 12.587 → 14.393 bytes
  - Background: 186.962 bytes (novo)
- **Aplicação Universal**: Logo atualizado em 30+ componentes e páginas do app

#### 🏗️ **Alterações Estruturais Profundas**
- **Migração de Armazenamento**: Transição de SharedPreferences para FlutterSecureStorage (maior segurança)
- **Novas Views de Banco de Dados**:
  - `VwVagasAbertasTable` - View otimizada para vagas abertas (134 linhas)
  - `VwFolhaPagamentoTable` - View para gestão de folha de pagamento (142 linhas)
- **Funções Customizadas**:
  - `cleanHospitalName()` - Limpeza automática de nomes de hospitais
  - `initialize_selected_day` - Inicialização de datas selecionadas
  - `load_clean_hospital_terms` - Carregamento de termos para limpeza
- **App State Expandido**:
  - Campo `estadoUF` migrado de `int` para `String`
  - Novo campo `estadoUFIndex` (int) para compatibilidade
  - Novo campo `cleanHospital` (List<String>) para termos de limpeza
  - Métodos `delete` adicionados a todos os campos
- **Componentes de Loading Refatorados**: Sistema modular com loading específico por contexto

---

### 🔧 **Melhorias Técnicas e Configurações**

#### 📦 **Atualizações de Dependências**
- **Commit**: eff6bcd2
- **Arquivos**: pubspec.lock atualizado
- **Objetivo**: Manter bibliotecas atualizadas e seguras

---

### 🗄️ **Backend e Banco de Dados**

#### 📊 **Novas Views Otimizadas**
- **VwVagasAbertasRow** (134 linhas):
  - Dados completos de vagas abertas
  - Informações de hospital com geolocalização
  - Períodos, tipos e formas de recebimento
  - Observações e metadados
- **VwFolhaPagamentoRow** (142 linhas):
  - Consolidação de dados para folha de pagamento
  - Informações do médico (nome, CPF, CRM)
  - Valores e datas de pagamento
  - Status de candidatura e razão social

#### 🔄 **Tabelas Atualizadas**
- `medicos.dart` - 18 linhas adicionadas
- `medicos_precadastro.dart` - 18 linhas adicionadas
- `pagamentos.dart` - 4 linhas modificadas
- `vw_vagas_candidaturas.dart` - 3 linhas adicionadas

#### 🎨 **Custom Widgets**
- **Calendário Customizado**: 28 linhas modificadas com melhorias na renderização
- **Serialization**: 4 linhas adicionadas para melhor tratamento de parâmetros de navegação

---

### 📊 **Estatísticas da Versão 2.2.0**

- **Total de Commits**: 11
- **Arquivos Modificados**: 110+
- **Linhas Totais**: ~13.500 modificadas
- **Arquivos Novos Criados**: 10+
- **Arquivos Removidos**: 5
- **Componentes Refatorados**: 80+

#### 🎯 **Impactos Principais**
- **Segurança**: Migração para FlutterSecureStorage
- **Performance**: Views otimizadas e queries eficientes
- **UX**: Acesso público para visualização de vagas
- **Manutenibilidade**: Código mais limpo, componentes reutilizáveis
- **Qualidade Visual**: Novo logo, ícones HD, splash screen renovado

---

## [2.1.4] - 18/09/2025

### ✨ **Novas Funcionalidades**

#### 👩‍🎓 **Acesso para Estudantes**
- **Cadastro de Estudantes**: Implementado cadastro para usuários estudantes sem CRM
- **Perfil Adaptativo**: Interface de perfil adaptada para usuários sem dados de CRM
- **Restrições Inteligentes**: Sistema de restrições para candidaturas baseado na presença de CRM

### 🔧 **Correções e Melhorias**

#### ⚡ **Performance e Cache**
- **Cache de Queries**: Implementado sistema de cache para consultas que envolvem cadastro e candidaturas
- **Contagem de Plantões**: Filtro aprimorado que exclui vagas canceladas da contagem na página inicial
- **Safe Area**: Correção na página de vagas para melhor compatibilidade com diferentes dispositivos

#### 🧹 **Limpeza e Manutenção**
- **Debug**: Remoção de prints de debug obsoletos
- **Código**: Refatorações e melhorias na organização do código

---

## [2.1.3] - 08/09/2025

### 🔧 **Melhorias e Refatorações**

#### 🏗️ **Ambientes de Desenvolvimento**
- **Separação de Ambientes**: Implementada estrutura para separação entre ambientes de desenvolvimento, homologação e produção
- **Configurações**: Melhor organização das configurações específicas por ambiente

#### 🧹 **Limpeza e Organização de Código**
- **Padronização de Nomenclatura**: Unificação da variável `medicos_id` para `medico_id` em todo o projeto, alinhando com o padrão do Supabase
- **Remoção de Arquivos**: Limpeza de arquivos obsoletos e desnecessários do projeto
- **Build iOS**: Atualização dos arquivos de build para iOS
- **Reorganização FlutterFlow**: Aplicadas reorganizações automáticas de código do FlutterFlow

#### 🐛 **Correções**
- **Contador de Plantões**: Corrigido filtro de contagem de plantões na página inicial

---

## [2.1.2] - 05/09/2025

### 🔧 **Hotfix**

#### 📅 **Página de Escalas**
- **Filtros**: Corrigida formação da lista de setores para considerar o dia selecionado pelo usuário
- **Otimização**: Melhorada lógica de filtragem unique baseada em `setorId` ao invés de `setorNome` 
- **Status**: Adicionado filtro para exibir apenas candidaturas com status 'APROVADO'

---

## [2.1.1] - 20/08/2025

### 🔧 **Hotfix**

#### 🔐 **Autenticação por Telefone**
- **Cadastro**:  Exclusão da função antiga que não habilitava OTP no cadastro e adição de função RPC para atualização do telefone no sistema de autenticação.

#### 👤 **Verificação de Usuário**
- **Login**: Corrigida verificação de novo usuário no processo de login

---

## [2.1.0] - 15/08/2025

### 🔧 **Correções e Otimizações**

#### 🚀 **Melhorias na Lista de Requisitos**
- **Bottom Sheet de Vagas**: Seção de requisitos agora só é exibida quando há requisitos para a vaga
- **Queries Otimizadas**: Revisão das consultas de requisitos para melhor performance
- **UI Aprimorada**: Interface mais limpa e focada no conteúdo relevante

#### 🔘 **Correções nos Botões de Ação**
- **Check-in/Check-out**: Corrigida lógica que causava desabilitação incorreta dos botões
- **Candidaturas**: Botões de candidatura revisados com novas lógicas de estado
- **Separação de Lógicas**: Check-in e candidaturas agora têm controles independentes

#### 🔐 **Autenticação Médica**
- **Login Restritivo**: Implementada lógica para permitir login apenas de usuários médicos (role == free)
- **Validação de Perfil**: Melhorias na validação de tipos de usuário durante o login

#### 🔗 **Deep Links Aprimorados**
- **App States**: Removidos estados obsoletos e adicionados novos para abertura via link
- **Funcionamento em Background**: Links de vagas agora funcionam quando o app está fechado
- **Navegação Direta**: Melhor redirecionamento para vagas específicas via deep links

#### 📍 **Correções de Localização**
- **Cálculos de Distância**: Adicionada validação de null para evitar erros em cálculos de distância
- **Estabilidade**: Melhor tratamento de dados de localização ausentes ou inválidos

#### 🧹 **Limpeza e Organização**
- **Código FlutterFlow**: Limpezas e reorganizações gerais do código gerado
- **Arquivos Desnecessários**: Remoção de arquivos obsoletos
- **Estrutura de Pastas**: Melhor organização dos diretórios do projeto
- **GitIgnore**: Atualizado para iOS e outras melhorias

---

## [2.0.3] - 25/07/2025

### 🔧 **Correções e Otimizações de Segurança**

#### 🔐 **Melhorias na Autenticação**
- **Apple Sign-In**: Atualizados entitlements e melhorada lógica de login para autenticação Apple
- **Correção de Login**: Aprimorada lógica de autenticação para melhor estabilidade

#### 📍 **Otimizações de Permissões**
- **Remoção de Permissões de Background**: Removidas permissões de localização em segundo plano do AndroidManifest.xml e Info.plist
- **iOS Device Capabilities**: Removidas capacidades relacionadas à localização em background do iOS
- **Segurança**: Reduzida superfície de ataque removendo permissões desnecessárias

#### 💼 **Melhorias de UI para Plantões**
- **Lógica de UI**: Refatorada lógica para passar e cancelar plantões
- **Experiência do Usuário**: Melhorada interface para gerenciamento de escalas

### 🔒 **Foco em Privacidade**
- Alinhamento com melhores práticas de privacidade removendo permissões em background
- Mantida funcionalidade essencial de check-in/check-out sem comprometer privacidade do usuário

---

## [2.0.0] - 21/07/2025

### 🎉 Lançamento Principal: Evolução Completa da Plataforma

Este lançamento transforma o Revoluna em uma plataforma abrangente de gestão de escalas médicas com recursos avançados para profissionais de saúde e instituições hospitalares.

---

### ✨ **Novas Funcionalidades**

#### 📱 **Funcionalidades Principais**
- **Aba Escalas**: Nova seção para gerenciar horários e plantões médicos
- **Sistema de Check-in/Check-out**: Rastreamento de presença baseado em GPS com validação de geofencing de 100m para localizações hospitalares
- **Integração com Calendário**: Adicione plantões diretamente aos calendários do seu dispositivo
- **Central de Notificações**: Página dedicada para gerenciar todas as notificações e comunicações do app

#### 🔗 **Sistema de Deep Linking**
- Suporte a links universais do app
- Navegação direta para vagas específicas a partir de fontes externas
- Integração com deep links de notificações

#### 📍 **Localização e Mapas**
- Geofencing hospitalar com validação de limites GPS
- Cálculos de distância em tempo real para locais de trabalho
- Integração aprimorada com Google Maps com marcadores hospitalares interativos
- Sistema de verificação de presença baseado em localização

---

### 🔄 **Funcionalidades Melhoradas**

#### 🔐 **Melhorias na Autenticação**
- Autenticação por magic link para login por email sem senha
- Sistema OTP aprimorado para verificação por telefone
- Integração melhorada com Google e Apple Sign-In
- Suporte a múltiplos métodos de autenticação

#### 🔔 **Sistema de Notificações**
- Notificações em primeiro e segundo plano
- Gerenciamento de contagem de badges
- Otimização específica por plataforma (iOS/Android)
- Integração de deep links com notificações

#### 💼 **Gerenciamento de Vagas**
- Bottom sheet de detalhes de vagas aprimorado com recursos interativos
- Sistema de candidatura a vagas com rastreamento de status
- Recursos avançados de filtragem e busca
- Gerenciamento de vagas favoritas

#### 👤 **Experiência do Usuário**
- Estados de carregamento e indicadores de progresso aprimorados
- Componentes de card profissionais para melhor apresentação de dados
- Sistema de diálogos melhorado para interações do usuário

#### 🏗️ **Arquitetura**
- Views aprimoradas para métricas de dashboard e analytics
- Otimização e redução na quantidade de consultas ao banco de dados

---

### 🎨 **Melhorias de UI/UX**

#### 🎯 **Novos Componentes**
- **Calendário Personalizado**: Widget de calendário avançado com visualização de eventos
- **Cards Aprimorados**: Cards profissionais para horários e listagem de vagas
- **Estados de Carregamento**: Componentes de carregamento diferentes para melhor UX
- **Sistema de Diálogos**: Diálogos especializados para várias interações

---

### 🔧 **Correções de Bugs e Otimizações**

#### 🐛 **Problemas Resolvidos**
- Corrigido aspas duplas em parâmetros UUID em chamadas de API
- Resolvidas solicitações concorrentes de permissão de localização

#### ⚡ **Performance**
- Reduzido tempo de inicialização do app
- Melhorias eficientes no gerenciamento de estado
- Otimizações de uso de memória

## [1.0.3] - 2025-04-29

### ✨ Funcionalidades Principais

#### 🔐 **Sistema de Autenticação**
-  Login por telefone com código OTP
-  Login por email com Magic Link
-  Login social com Google e Apple
-  Processo de cadastro em 3 etapas para médicos
-  Validação personalizada de CPF brasileiro
-  Verificação de email via tokens
-  Sistema de verificação de telefone via OTP

#### 👨‍⚕️ **Perfil e Dados Médicos**
-  Cadastro completo de dados pessoais
-  Registro de dados profissionais (CRM, RQE, especialidade)

#### 🏥 **Sistema de Vagas de Plantão**
-  Visualização de vagas disponíveis
-  Informações detalhadas das vagas (hospital, horário, valor, especialidade)
-  Sistema de candidatura para vagas
-  Status de candidaturas em tempo real
-  Filtros por especialidade, data e localização

#### 🗺️ **Navegação e Mapas**
-  Base de dados de hospitais com coordenadas
-  Integração com Uber, 99 Taxi, Waze e Google Maps

#### 📱 **Interface e Navegação**
-  Navegação principal com 3 tabs (Home, Explorar, Escala)
-  Dashboard personalizado na Home
-  Tela Explorar com busca e filtros
-  Agenda pessoal de plantões na Escala
-  Menu drawer com opções do usuário
-  Cards informativos para vagas
-  Página de vagas para detalhes expandidos
-  Contadore de candidatos por vaga


#### 💳 **Sistema Financeiro**
-  Registro de pagamentos por vaga
-  Informações de formas de recebimento
-  Histórico de pagamentos
-  Controle de pagamentos e remuneração

#### 🏢 **Gestão de Instituições**
-  Cadastro completo de hospitais
-  Informação sobre grupos contratantes
-  Contatos de escalistas responsáveis por vaga

### 🔧 **Funcionalidades Técnicas**

#### **Integrações**
-  Integração com WhatsApp para contato
-  Abertura automática de apps de email

### 🔒 **Privacidade e Segurança**
-  Conformidade com App Tracking Transparency (iOS)
-  Termos de uso do aplicativo
-  Sistema de tokens de verificação

### 📋 **Categorias e Tipos**
-  Especialidades médicas catalogadas
-  Sistema de benefícios por vaga
-  Períodos de trabalho padronizados
-  Setores hospitalares organizados

### 📱 **Suporte Multiplataforma**
-  Build para iOS
-  Build para Android
-  Permissões específicas por plataforma

---
