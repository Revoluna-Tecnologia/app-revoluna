# Revoluna 👨‍⚕️

**Revoluna** é um aplicativo móvel Flutter que conecta profissionais de saúde com oportunidades de trabalho em plantões médicos. O app facilita a busca e candidatura para vagas em hospitais de todo o Brasil.

## 🚀 Sobre o Projeto

O Revoluna é uma plataforma abrangente de gestão de escalas médicas que oferece:
- 👨‍⚕️ Cadastro completo de médicos com validação profissional
- 🏥 Visualização de vagas de plantão com informações detalhadas e geolocalização  
- 📅 Sistema de escalas com check-in/check-out baseado em GPS
- 💰 Sistema de acompanhamento de pagamentos integrado
- 🔐 Autenticação segura com múltiplas opções (email, telefone, Google, Apple)
- 🗓️ Integração com calendário do dispositivo
- 🔔 Central de notificações com deep linking
- 📍 Geofencing hospitalar com validação de presença

## ✨ Principais Funcionalidades

### 🔐 **Autenticação**
- Login por telefone com OTP e magic link por email
- Login social com Google e Apple
- Cadastro em 3 etapas com validação de documentos
- Verificação de CPF e dados profissionais

### 👨‍⚕️ **Perfil Médico**  
- Dados pessoais e profissionais completos
- CRM, RQE e especialidade médica
- Sistema de verificação profissional

### 🏥 **Sistema de Vagas**
- Listagem de plantões disponíveis com mapas interativos
- Filtros avançados por especialidade, data e localização
- Candidatura com um toque e rastreamento de status
- Bottom sheet detalhado para cada vaga
- Sistema de vagas favoritas

### 📅 **Escalas e Check-in**
- Aba dedicada para gerenciar horários e plantões
- Check-in/check-out baseado em GPS com geofencing de 100m
- Validação automática de presença nos hospitais
- Rastreamento de localização em tempo real

### 🗓️ **Integração com Calendário**
- Adicione plantões diretamente ao calendário do dispositivo
- Widget de calendário personalizado com visualização de eventos
- Sincronização automática de horários confirmados

### 🔔 **Central de Notificações**
- Página dedicada para gerenciar todas as notificações
- Sistema de deep linking para navegação direta
- Notificações push otimizadas por plataforma (iOS/Android)
- Gerenciamento inteligente de badges

### 📍 **Localização e Mapas**
- Geofencing hospitalar com validação de limites GPS
- Cálculos de distância em tempo real
- Integração com Google Maps, Waze, Uber e 99
- Marcadores hospitalares interativos

### 📊 **Dashboard**
- Métricas pessoais de plantões com analytics
- Histórico de candidaturas e status
- Agenda de plantões confirmados
- Controle detalhado de pagamentos

## 🛠️ Stack Tecnológica

### **Frontend**
- **Flutter** - Framework multiplataforma para desenvolvimento mobile
- **FlutterFlow** - Plataforma visual para desenvolvimento Flutter
- **Dart** - Linguagem de programação

### **Backend & Banco de Dados**
- **Supabase** - Backend-as-a-Service com PostgreSQL
- **Firebase** - Cloud functions, messaging e Firestore
- **PostgreSQL** - Banco de dados relacional principal

### **Serviços & Integrações**
- **Firebase Cloud Messaging (FCM)** - Notificações push
- **Google Maps API** - Mapas e geolocalização
- **Twilio** - Serviços de comunicação
- **Apple Push Notifications (APN)** - Notificações iOS

### **Autenticação**
- **Supabase Auth** - Sistema de autenticação principal
- **Google Sign-In** - Login social Google
- **Apple Sign-In** - Login social Apple
- **Magic Link** - Autenticação sem senha por email
- **OTP** - Verificação por código via telefone

### **Desenvolvimento & Deploy**
- **GitHub Actions** - CI/CD
- **Firebase Hosting** - Deploy de funções
- **App Store Connect** - Deploy iOS
- **Google Play Console** - Deploy Android

## 📱 Arquitetura do App

### **Estrutura FlutterFlow**
- Projeto gerado pelo FlutterFlow com extensões customizadas
- Arquitetura baseada em páginas e componentes
- Estado global gerenciado via `FFAppState`
- Navegação com GoRouter

### **Organização de Pastas**
```
lib/
├── pages/                 # Páginas da UI (login, cadastro, nav)
├── components/            # Componentes reutilizáveis
├── backend/               # Integração com Supabase
├── auth/                  # Lógica de autenticação
├── custom_code/           # Ações e widgets customizados
└── flutter_flow/          # Arquivos gerados pelo FlutterFlow

firebase/
└── functions/             # Cloud Functions (Node.js)
```

### **Gerenciamento de Estado**
- **Provider Pattern** com `FFAppState` para estado global
- **Local State** gerenciado via modelo de página do FlutterFlow
- **Persistência** via SharedPreferences para dados locais

### **Banco de Dados**
- **Schema PostgreSQL** com tabelas especializadas:
  - `user_profile`, `medicos` - Gestão de usuários
  - `vagas`, `vagas_completo` - Sistema de vagas
  - `candidaturas` - Candidaturas e aplicações
  - `hospitais` - Base de dados hospitalares
  - `notifications` - Sistema de notificações

## 🚀 Recursos Avançados v2.0

### **Sistema de Deep Linking**
- Links universais para navegação direta no app
- Suporte a `revoluna://revoluna.com/explorar?id={vaga_id}`
- Integração com notificações push para abertura de vagas específicas
- Configuração para iOS (`Info.plist`) e Android (`AndroidManifest.xml`)

### **Geofencing Inteligente**
- Validação de presença hospitalar com precisão de 100 metros
- Check-in/check-out automático baseado em GPS
- Rastreamento em tempo real de localização durante plantões
- Prevenção de fraudes de presença com tecnologia de geolocalização

### **Otimizações de Performance**
- Redução significativa no tempo de inicialização do app
- Gerenciamento eficiente de memória e estado
- Otimização de consultas ao banco de dados
- Sistema de cache inteligente para dados frequentemente acessados

### **Segurança e Privacidade**
- Conformidade com App Tracking Transparency (iOS)
- Criptografia de dados sensíveis em trânsito e repouso
- Validação rigorosa de tokens de autenticação
- Sistema de permissões granulares para acesso a dados

## 📋 Requisitos do Sistema

### **iOS**
- iOS 12.0 ou superior
- Xcode 14+ para desenvolvimento
- Permissões: Localização, Calendário, Notificações, Câmera

### **Android**
- Android API Level 21 (Android 5.0) ou superior
- Android Studio 2022+ para desenvolvimento
- Permissões: Localização, Calendário, Notificações, Câmera

## 🔧 Comandos de Desenvolvimento

### **Flutter**
```bash
flutter run                # Executar em modo debug
flutter build apk          # Build Android
flutter build ios          # Build iOS
flutter test               # Executar testes
flutter analyze           # Analisar código
flutter clean             # Limpar cache de build
```

### **Firebase Functions**
```bash
cd firebase/functions
npm run serve              # Emulador local
npm run lint              # Verificar código
firebase functions:deploy # Deploy para produção
```

## 📈 Versão Atual

**v2.2.1**

Para detalhes completos das mudanças, consulte o [CHANGELOG.md](CHANGELOG.md).
