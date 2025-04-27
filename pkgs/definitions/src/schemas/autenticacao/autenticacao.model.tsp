using Ladesa.Domain.v4.Generics;
using Ladesa.Domain.v4.Generics.Entities;

namespace Ladesa.Domain.v4.Schemas;

/** Dados de entrada para autenticação. */
@Metadata.EntityId(Tokens.Auth_LoginInput_View)
model AuthLoginInputView {
  /** Matrícula SIAPE. */
  matriculaSiape: string;

  /** Senha do usuário. */
  senha: string;
}
