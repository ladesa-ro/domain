using TypeSpec.JsonSchema;

using Ladesa.v3.Generics;
using Ladesa.v3.Generics.Entities;

namespace Ladesa.v3.Schemas;

/** Usuário. */
@Metadata.EntityId(Tokens.Usuario)
model Usuario {
  ...EntityIdUuid;

  /** Nome do usuário. */
  @minLength(1)
  nome: string | null;

  /** Matrícula SIAPE do usuário. */
  @minLength(1)
  matriculaSiape: string | null;

  /** E-mail do usuário. */
  @format("email")
  email: string | null;

  /** Diz que o usuário tem poderes de administrador. */
  isSuperUser: boolean;

  /** Imagem de capa do usuário. */
  imagemCapa: Imagem | null;

  /** Imagem de perfil do usuário. */
  imagemPerfil: Imagem | null;

  ...EntityDated;
}

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
  @extension("x-unispec-constraint-entity-exists", Json<Tokens.Usuario>)
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
