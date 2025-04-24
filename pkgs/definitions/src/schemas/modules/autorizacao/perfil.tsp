using TypeSpec.JsonSchema;

using Ladesa.v3.Generics;
using Ladesa.v3.Generics.Entities;
using Ladesa.Schemas.Pagination.Result;

namespace Ladesa.v3.Schemas;

/** Vínculo. */
@Metadata.EntityId(Tokens.Perfil)
model Perfil {
  ...EntityIdUuid;

  /** Indica se o vínculo está ativo. */
  ativo: boolean;

  /** Cargo do usuário no vínculo. */
  cargo: string;

  /** Campus associado ao vínculo. */
  campus: Campus;

  /** Usuário associado ao vínculo. */
  usuario: Usuario;

  ...EntityDated;
}

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
  @extension("x-unispec-constraint-entity-exists", Json<Tokens.Perfil>)
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
model PerfilListResultView is PaginationResultView<PerfilFindOneResultView>;

/** Dados de entrada para a alteração de vínculo de um Usuário a um Campus. */
@Metadata.EntityId(Tokens.Perfil_InputUpdate_View)
model PerfilUpdateView {
  /** Cargos do usuário no vínculo. */
  cargos: string[];

  campus: CampusFindOneInputView;
  usuario: UsuarioFindOneInputView;
}
