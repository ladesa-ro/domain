using Ladesa.v3.Generics;
using Ladesa.v3.Generics.Entities;

namespace Ladesa.v3.Schemas;

/** Dados de entrada para autenticação. */
@Metadata.EntityId(Tokens.Auth_LoginInput_View)
model AuthLoginInputView {
  /** Matrícula SIAPE. */
  matriculaSiape: string;

  /** Senha do usuário. */
  senha: string;
}

/** Dados de entrada para refresh de autenticação. */
@Metadata.EntityId(Tokens.Auth_RefreshInput_View)
model AuthRefreshInputView {
  /** Token de refresh. */
  refreshToken: string;
}

/** Informações sobre o ator.. */
@Metadata.EntityId(Tokens.Auth_WhoAmIResult_View)
model AuthWhoAmIResultView {
  /** Usuário autenticado. */
  usuario: UsuarioFindOneResultView | null;

  /** Vínculos do usuário logado. */
  perfisAtivos: PerfilFindOneResultView[];
}

/** Credenciais de sessão. */
@Metadata.EntityId(Tokens.Auth_SessionCredentials_View)
model AuthSessionCredentialsView {
  /** Token de acesso. */
  access_token: string | null;

  /** Tipo do token. */
  token_type: string | null;

  /** Token de identificação. */
  id_token: string | null;

  /** Token de refresh. */
  refresh_token: string | null;

  /** Tempo de expiração do token. */
  expires_in: integer | null;

  /** Tempo de expiração do token. */
  expires_at: integer | null;

  /** Estado da sessão. */
  session_state: string | null;

  /** Escopo da autenticação. */
  scope: string | null;
}

/** Dados de entrada para definir a senha inicial. */
@Metadata.EntityId(Tokens.Auth_SetInitialPasswordInput_View)
model AuthCredentialsSetInitialPasswordInputView {
  /** Matrícula SIAPE. */
  matriculaSiape: string;

  /** Nova senha. */
  senha: string;
}

/** Dados de entrada para autenticação. */
@Metadata.EntityId(Tokens.Auth_RecoverPasswordInput_View)
model AuthRecoverPasswordInputView {
  /** E-mail. */
  email: string;
}
