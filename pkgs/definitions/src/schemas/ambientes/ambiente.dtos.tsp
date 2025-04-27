using Ladesa.Domain.v4.Generics;
using Ladesa.Domain.v4.Generics.Entities;

namespace Ladesa.Domain.v4.Schemas;

/** Visão completa de um ambiente. */
@Metadata.EntityId(Tokens.Ambiente_View)
model AmbienteView {
  ...OmitProperties<Ambiente, "bloco" | "imagemCapa">;
  bloco: BlocoFindOneResultView;
  imagemCapa: ImagemFindOneResultView | null;
}

/**
 * Dados de entrada para encontrar um ambiente por id.
 */
@Metadata.EntityId(Tokens.Ambiente_FindOneInput_View)
model AmbienteFindOneInputView {
  @Metadata.Constraints.EntityExists(Tokens.Ambiente)
  id: Ambiente.id;
}

/**
 * Visão FindOne de um ambiente.
 */
@Metadata.EntityId(Tokens.Ambiente_FindOneResult_View)
@Metadata.EntityPartialOfId(Tokens.Ambiente_View)
model AmbienteFindOneResultView {
  //
  ...PickProperties<AmbienteView, "id">;

  ...PickProperties<AmbienteView, "nome">;
  ...PickProperties<AmbienteView, "descricao">;
  ...PickProperties<AmbienteView, "codigo">;
  ...PickProperties<AmbienteView, "capacidade">;
  ...PickProperties<AmbienteView, "tipo">;

  //
  ...PickProperties<AmbienteView, "bloco">;

  ...PickProperties<AmbienteView, "imagemCapa">;

  //
  ...PickProperties<
    AmbienteView,
    "dateCreated" | "dateUpdated" | "dateDeleted"
  >;
}

/** Dados de entrada para a criação de um ambiente. */
@Metadata.EntityId(Tokens.Ambiente_InputCreate_View)
model AmbienteInputCreateView {
  ...PickProperties<AmbienteView, "nome">;
  ...PickProperties<AmbienteView, "descricao">;
  ...PickProperties<AmbienteView, "codigo">;
  ...PickProperties<AmbienteView, "capacidade">;
  ...PickProperties<AmbienteView, "tipo">;
  bloco: BlocoFindOneInputView;
}

/** Dados de entrada para a atualização de um ambiente. */
@Metadata.EntityId(Tokens.Ambiente_InputUpdate_View)
model AmbienteInputUpdateView is OptionalProperties<AmbienteInputCreateView>;

/** Resultados da busca a ambientes. */
@Metadata.EntityId(Tokens.Ambiente_ListResult_View)
model AmbienteListResultView
  is Pagination.Result.View<AmbienteFindOneResultView>;
