 # Padrões de Sistema: Revoluna

**Arquitetura Geral:** O projeto segue a estrutura padrão gerada pelo FlutterFlow, que pode ser descrita como uma abordagem Model-View.

- **`lib/pages/`**: Contém as telas principais da aplicação. Cada tela é um "Widget" que possui um arquivo `_widget.dart` (a View) e um `_model.dart` (o Model, que gerencia o estado e a lógica daquela tela específica).
- **`lib/components/`**: Contém widgets reutilizáveis que são usados em múltiplas páginas (ex: `header`, `card_vagas`). Seguem a mesma estrutura `_widget.dart` e `_model.dart`.
- **`lib/backend/`**: Centraliza toda a comunicação com o backend (Supabase). Contém as definições de tabelas, chamadas de API e interações com o banco de dados.
- **`lib/auth/`**: Isola a lógica de autenticação, incluindo os diferentes provedores (Email, Google, Apple, etc.).
- **`lib/custom_code/`**: Abriga código Dart customizado (Actions e Widgets) para funcionalidades que não podem ser criadas diretamente no editor do FlutterFlow, como a validação de CPF ou a chamada de intents nativas (WhatsApp).
- **`lib/flutter_flow/`**: Código de utilitários e helpers gerado pelo FlutterFlow para dar suporte à aplicação.

**Fluxo de Dados:**
- A UI (definida em `pages` e `components`) interage com o `FFAppState` e os Models de página para gerenciar o estado local.
- Para obter ou enviar dados, a UI chama funções e classes definidas no diretório `lib/backend/supabase/`.
- O Supabase atua como o ponto central de verdade (single source of truth) para todos os dados persistentes.
- O `go_router` controla a navegação, recebendo contextos e parâmetros para exibir as páginas corretas.

