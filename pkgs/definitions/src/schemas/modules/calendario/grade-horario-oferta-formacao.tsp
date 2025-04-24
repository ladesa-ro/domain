using TypeSpec.JsonSchema;

using Ladesa.v3.Generics;
using Ladesa.v3.Generics.Entities;
using Ladesa.Schemas.Pagination.Result;

namespace Ladesa.v3.Schemas;

/** GradeHorarioOfertaFormacao. */
@Metadata.EntityId(Tokens.GradeHorarioOfertaFormacao)
model GradeHorarioOfertaFormacao {
  ...EntityIdUuid;

  /** Campus. */
  campus: Campus;

  /** Oferta de formação. */
  ofertaFormacao: OfertaFormacao;

  ...EntityDated;
}

/** Visão completa de uma oferta de formação. */
@Metadata.EntityId(Tokens.GradeHorarioOfertaFormacao_View)
model GradeHorarioOfertaFormacaoView {
  ...OmitProperties<GradeHorarioOfertaFormacao, "campus" | "ofertaFormacao">;
  campus: CampusFindOneResultView;
  ofertaFormacao: OfertaFormacaoFindOneResultView;
}

/** Dados de entrada para encontrar uma oferta de formação por ID. */
@Metadata.EntityId(Tokens.GradeHorarioOfertaFormacao_FindOneInput_View)
model GradeHorarioOfertaFormacaoFindOneInputView {
  @extension(
    "x-unispec-constraint-entity-exists",
    Json<Tokens.GradeHorarioOfertaFormacao>
  )
  id: GradeHorarioOfertaFormacao.id;
}

/** Visão FindOne de uma oferta de formação. */
@Metadata.EntityId(Tokens.GradeHorarioOfertaFormacao_FindOneResult_View)
@Metadata.EntityPartialOfId(Tokens.GradeHorarioOfertaFormacao_View)
model GradeHorarioOfertaFormacaoFindOneResultView {
  ...PickProperties<GradeHorarioOfertaFormacaoView, "id">;
  ...PickProperties<
    GradeHorarioOfertaFormacaoView,
    "campus" | "ofertaFormacao"
  >;
  ...PickProperties<
    GradeHorarioOfertaFormacaoView,
    "dateCreated" | "dateUpdated" | "dateDeleted"
  >;
}

/** Dados de entrada para a criação de uma oferta de formação. */
@Metadata.EntityId(Tokens.GradeHorarioOfertaFormacao_InputCreate_View)
model GradeHorarioOfertaFormacaoInputCreateView {
  campus: CampusFindOneInputView;
  ofertaFormacao: OfertaFormacaoFindOneInputView;
}

/** Dados de entrada para a atualização de uma oferta de formação. */
@Metadata.EntityId(Tokens.GradeHorarioOfertaFormacao_InputUpdate_View)
model GradeHorarioOfertaFormacaoInputUpdateView
  is OptionalProperties<GradeHorarioOfertaFormacaoInputCreateView>;

/** Resultados da busca a GradeHorarioOfertaFormacaos. */
@Metadata.EntityId(Tokens.GradeHorarioOfertaFormacao_ListResult_View)
model GradeHorarioOfertaFormacaoListResultView
  is PaginationResultView<GradeHorarioOfertaFormacaoFindOneResultView>;
