 # Contexto Técnico: Revoluna

**Framework Principal:** Flutter (Versão SDK: >=3.0.0 <4.0.0)

**Backend e Banco de Dados:**
- **Provedor:** Supabase
- **Serviços Utilizados:**
  - **Authentication:** Gerencia o login via Email/Senha, Magic Link (email), Telefone (OTP), Google Sign-In e Apple Sign-In.
  - **Database:** PostgreSQL para armazenar todos os dados da aplicação (vagas, usuários, candidaturas, etc.).
  - **Storage:** Para armazenamento de arquivos como fotos de perfil ou documentos.

**Navegação:**
- **Pacote:** `go_router`
- **Abordagem:** Navegação baseada em rotas nomeadas, gerenciando o fluxo entre as diferentes telas do aplicativo.

**Gerenciamento de Estado:**
- **Principal:** `provider` em conjunto com o `FFAppState` (gerenciamento de estado nativo do FlutterFlow).

**Dependências Chave:**
- `supabase_flutter`: Integração com o backend Supabase.
- `geolocator`: Para funcionalidades baseadas em localização (distância até o hospital).
- `image_picker` / `file_picker`: Para upload de documentos e fotos.
- `google_sign_in` / `sign_in_with_apple`: Para login com redes sociais.
- `flutter_native_splash`: Para a tela de carregamento inicial.
- `lottie`: Para animações.

