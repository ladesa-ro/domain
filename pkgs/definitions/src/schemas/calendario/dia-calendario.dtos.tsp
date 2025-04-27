using Ladesa.Domain.v4.Generics;
using Ladesa.Domain.v4.Generics.Entities;

namespace Ladesa.Domain.v4.Schemas;

/** Visão completa de um DiaCalendario. */
@Metadata.EntityId(Tokens.DiaCalendario_View)
model DiaCalendarioView {
  ...OmitProperties<DiaCalendario, "calendario">;
  calendario: CalendarioLetivoFindOneResultView;
}

/** Dados de entrada para encontrar um DiaCalendario por ID. */
@Metadata.EntityId(Tokens.DiaCalendario_FindOneInput_View)
model DiaCalendarioFindOneInputView {
  @Metadata.Constraints.EntityExists(Tokens.DiaCalendario)
  id: DiaCalendario.id;
}

/** Visão FindOne de um DiaCalendario. */
@Metadata.EntityId(Tokens.DiaCalendario_FindOneResult_View)
@Metadata.EntityPartialOfId(Tokens.DiaCalendario_View)
model DiaCalendarioFindOneResultView {
  ...PickProperties<DiaCalendarioView, "id">;
  ...PickProperties<DiaCalendarioView, "data" | "diaLetivo" | "feriado">;
  ...PickProperties<DiaCalendarioView, "calendario">;
  ...PickProperties<
    DiaCalendarioView,
    "dateCreated" | "dateUpdated" | "dateDeleted"
  >;
}

/** Dados de entrada para a criação de um DiaCalendario. */
@Metadata.EntityId(Tokens.DiaCalendario_InputCreate_View)
model DiaCalendarioInputCreateView {
  data: date;
  feriado: boolean;
  diaLetivo: boolean;
  calendario: CalendarioLetivoFindOneInputView | null;
}

/** Dados de entrada para a atualização de um DiaCalendario. */
@Metadata.EntityId(Tokens.DiaCalendario_InputUpdate_View)
model DiaCalendarioInputUpdateView
  is OptionalProperties<DiaCalendarioInputCreateView>;

/** Resultados da busca a DiaCalendarios. */
@Metadata.EntityId(Tokens.DiaCalendario_ListResult_View)
model DiaCalendarioListResultView
  is Pagination.Result.View<DiaCalendarioFindOneResultView>;
