using Ladesa.Domain.v4.Generics;
using Ladesa.Domain.v4.Generics.Entities;

namespace Ladesa.Domain.v4.Schemas;

/** Visão completa de uma Disponibilidade. */
@Metadata.EntityId(Tokens.Disponibilidade_View)
model DisponibilidadeView {
  ...Disponibilidade;
}

/** Dados de entrada para encontrar uma Disponibilidade por ID. */
@Metadata.EntityId(Tokens.Disponibilidade_FindOneInput_View)
model DisponibilidadeFindOneInputView {
  @Metadata.Constraints.EntityExists(Tokens.Disponibilidade)
  id: Disponibilidade.id;
}

/** Visão FindOne de uma Disponibilidade. */
@Metadata.EntityId(Tokens.Disponibilidade_FindOneResult_View)
@Metadata.EntityPartialOfId(Tokens.Disponibilidade)
model DisponibilidadeFindOneResultView {
  ...PickProperties<DisponibilidadeView, "id">;
  ...PickProperties<DisponibilidadeView, "dataInicio" | "dataFim">;
  ...PickProperties<
    DisponibilidadeView,
    "dateCreated" | "dateUpdated" | "dateDeleted"
  >;
}

/** Dados de entrada para a criação de uma Disponibilidade. */
@Metadata.EntityId(Tokens.Disponibilidade_InputCreate_View)
model DisponibilidadeInputCreateView {
  dataInicio: date;
  dataFim: date | null;
}

/** Dados de entrada para a atualização de uma Disponibilidade. */
@Metadata.EntityId(Tokens.Disponibilidade_InputUpdate_View)
model DisponibilidadeInputUpdateView
  is OptionalProperties<DisponibilidadeInputCreateView>;

/** Resultados da busca a Disponibilidades. */
@Metadata.EntityId(Tokens.Disponibilidade_ListResult_View)
model DisponibilidadeListResultView
  is Pagination.Result.View<DisponibilidadeFindOneResultView>;
