using Ladesa.Domain.v4.Generics;
using Ladesa.Domain.v4.Generics.Entities;

namespace Ladesa.Domain.v4.Schemas;

/** Visão completa de um Vínculo. */
@Metadata.EntityId(Tokens.Perfil_View)
model PerfilView {
  ...OmitProperties<Perfil, "campus" | "usuario">;
  campus: CampusFindOneResultView;
  usuario: UsuarioFindOneResultView;
}

/** Dados de entrada para encontrar um Vínculo por ID. */
@Metadata.EntityId(Tokens.Perfil_FindOneInput_View)
model PerfilFindOneInputView {
  @Metadata.Constraints.EntityExists(Tokens.Perfil)
  id: Perfil.id;
}

/** Visão FindOne de um Vínculo. */
@Metadata.EntityId(Tokens.Perfil_FindOneResult_View)
@Metadata.EntityPartialOfId(Tokens.Perfil_View)
model PerfilFindOneResultView {
  //
  ...PickProperties<PerfilView, "id">;

  ...PickProperties<PerfilView, "ativo">;
  ...PickProperties<PerfilView, "cargo">;

  //
  ...PickProperties<PerfilView, "campus">;

  //
  ...PickProperties<PerfilView, "usuario">;

  //
  ...PickProperties<PerfilView, "dateCreated" | "dateUpdated" | "dateDeleted">;
}

/** Resultados da busca a Vínculos. */
@Metadata.EntityId(Tokens.Perfil_ListResult_View)
model PerfilListResultView is Pagination.Result.View<PerfilFindOneResultView>;

/** Dados de entrada para a alteração de vínculo de um Usuário a um Campus. */
@Metadata.EntityId(Tokens.Perfil_InputUpdate_View)
model PerfilUpdateView {
  /** Cargos do usuário no vínculo. */
  cargos: string[];

  campus: CampusFindOneInputView;
  usuario: UsuarioFindOneInputView;
}
