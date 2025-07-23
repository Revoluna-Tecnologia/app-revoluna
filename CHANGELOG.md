# Histórico de Versões - Revoluna

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