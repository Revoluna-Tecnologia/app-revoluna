# Histórico de Versões - Revoluna

## [2.2.0] - 11/11/2025

### 🎨 **Redesign de Interface**

#### 🔄 **Refatoração Completa da UI**
- **Nova Página Inicial**: Redesign completo da área deslogada com interface modernizada
- **Header Aprimorado**: Novo header com contagem de plantões integrada
- **Página de Vagas Renovada**: Refatoração completa da página de vagas com melhor organização e usabilidade
- **Navegação Redesenhada**: Refatoração do sistema de navegação para melhor experiência do usuário

#### 🎯 **Acesso Ampliado**
- **Acesso para Usuários Não Cadastrados**: Usuários não logados agora podem visualizar vagas
- **Nova Lógica de Candidatura**: Sistema de candidatura repensado para suportar diferentes tipos de acesso


#### **Logo atualizado**
-  Novo logo e suas aplicações em toda a plataforma

### 🔧 **Melhorias Técnicas**
- **Atualizações de Dependências**: Atualização de bibliotecas e pacotes do projeto

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