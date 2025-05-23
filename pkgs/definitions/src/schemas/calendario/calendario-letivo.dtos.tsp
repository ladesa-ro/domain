using Ladesa.Domain.v4.Generics;
using Ladesa.Domain.v4.Generics.Entities;

namespace Ladesa.Domain.v4.Schemas;

/** Visão completa de um calendário letivo. */
@Metadata.EntityId(Tokens.CalendarioLetivo_View)
model CalendarioLetivoView {
  ...OmitProperties<CalendarioLetivo, "campus" | "ofertaFormacao">;
  campus: CampusFindOneResultView;
  ofertaFormacao: OfertaFormacaoFindOneResultView;
}

/** Dados de entrada para encontrar um calendário letivo por ID. */
@Metadata.EntityId(Tokens.CalendarioLetivo_FindOneInput_View)
model CalendarioLetivoFindOneInputView {
  @Metadata.Constraints.EntityExists(Tokens.CalendarioLetivo)
  id: CalendarioLetivo.id;
}

/** Visão FindOne de um calendário letivo. */
@Metadata.EntityId(Tokens.CalendarioLetivo_FindOneResult_View)
@Metadata.EntityPartialOfId(Tokens.CalendarioLetivo_View)
model CalendarioLetivoFindOneResultView {
  //
  ...PickProperties<CalendarioLetivoView, "id">;

  ...PickProperties<CalendarioLetivoView, "nome" | "ano">;

  //
  ...PickProperties<CalendarioLetivoView, "campus" | "ofertaFormacao">;

  //
  ...PickProperties<
    CalendarioLetivoView,
    "dateCreated" | "dateUpdated" | "dateDeleted"
  >;
}

/** Dados de entrada para a criação de um calendário letivo. */
@Metadata.EntityId(Tokens.CalendarioLetivo_InputCreate_View)
model CalendarioLetivoInputCreateView {
  ...PickProperties<CalendarioLetivoView, "nome" | "ano">;
  campus: CampusFindOneInputView;
  ofertaFormacao: OfertaFormacaoFindOneInputView;
}

/** Dados de entrada para a atualização de um calendário letivo. */
@Metadata.EntityId(Tokens.CalendarioLetivo_InputUpdate_View)
model CalendarioLetivoInputUpdateView
  is OptionalProperties<CalendarioLetivoInputCreateView>;

/** Resultados da busca a CalendarioLetivos. */
@Metadata.EntityId(Tokens.CalendarioLetivo_ListResult_View)
model CalendarioLetivoListResultView
  is Pagination.Result.View<CalendarioLetivoFindOneResultView>;
