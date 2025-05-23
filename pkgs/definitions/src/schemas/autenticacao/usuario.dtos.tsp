using Ladesa.Domain.v4.Generics;
using Ladesa.Domain.v4.Generics.Entities;

namespace Ladesa.Domain.v4.Schemas;

/** Visão completa de um Usuário. */
@Metadata.EntityId(Tokens.Usuario_View)
model UsuarioView {
  ...OmitProperties<Usuario, "imagemCapa" | "imagemPerfil">;
  imagemCapa: ImagemFindOneResultView | null;
  imagemPerfil: ImagemFindOneResultView | null;
}

/** Dados de entrada para encontrar um Usuário por ID. */
@Metadata.EntityId(Tokens.Usuario_FindOneInput_View)
model UsuarioFindOneInputView {
  @Metadata.Constraints.EntityExists(Tokens.Usuario)
  id: Usuario.id;
}

/** Visão FindOne de um Usuário. */
@Metadata.EntityId(Tokens.Usuario_FindOneResult_View)
@Metadata.EntityPartialOfId(Tokens.Usuario_View)
model UsuarioFindOneResultView {
  //
  ...PickProperties<UsuarioView, "id">;

  ...PickProperties<UsuarioView, "nome">;
  ...PickProperties<UsuarioView, "matriculaSiape">;
  ...PickProperties<UsuarioView, "email">;
  ...PickProperties<UsuarioView, "isSuperUser">;

  //
  ...PickProperties<UsuarioView, "imagemCapa">;

  //
  ...PickProperties<UsuarioView, "imagemPerfil">;

  //
  ...PickProperties<UsuarioView, "dateCreated" | "dateUpdated" | "dateDeleted">;
}

/** Resultados da busca a usuários. */
@Metadata.EntityId(Tokens.Usuario_ListResult_View)
model UsuarioListResultView is Pagination.Result.View<UsuarioFindOneResultView>;

/** Dados de entrada para a criação de um usuário. */
@Metadata.EntityId(Tokens.Usuario_InputCreate_View)
model UsuarioInputCreateView {
  ...PickProperties<UsuarioView, "nome">;
  ...PickProperties<UsuarioView, "matriculaSiape">;
  ...PickProperties<UsuarioView, "email">;
}

/** Dados de entrada para a atualização de um Usuário. */
@Metadata.EntityId(Tokens.Usuario_InputUpdate_View)
model UsuarioInputUpdateView is OptionalProperties<UsuarioInputCreateView>;
