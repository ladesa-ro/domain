using TypeSpec.JsonSchema;

using Ladesa.v3.Generics;
using Ladesa.v3.Generics.Entities;
using Ladesa.Schemas.Pagination.Result;

namespace Ladesa.v3.Schemas;

/** CalendarioLetivo. */
@Metadata.EntityId(Tokens.CalendarioLetivo)
model CalendarioLetivo {
  ...EntityIdUuid;

  /** Nome do calendário letivo. */
  nome: string;

  /** Ano do calendário letivo. */
  ano: uint16;

  /** Campus ao qual o calendário letivo pertence. */
  campus: Campus;

  /** Oferta de formação do calendário letivo. */
  ofertaFormacao: OfertaFormacao;

  ...EntityDated;
}

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
  @extension(
    "x-unispec-constraint-entity-exists",
    Json<Tokens.CalendarioLetivo>
  )
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
  is PaginationResultView<CalendarioLetivoFindOneResultView>;
