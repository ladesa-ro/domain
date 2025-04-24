using Ladesa.v3.Generics;
using Ladesa.v3.Generics.Entities;

namespace Ladesa.v3.Schemas;

/** GradeHorarioOfertaFormacaoIntervaloDeTempo. */
@Metadata.EntityId(Tokens.GradeHorarioOfertaFormacaoIntervaloDeTempo)
model GradeHorarioOfertaFormacaoIntervaloDeTempo {
  ...EntityIdUuid;

  /** Grade de horário da oferta de formação. */
  gradeHorarioOfertaFormacao: GradeHorarioOfertaFormacao;

  /** Intervalo de tempo. */
  intervaloDeTempo: IntervaloDeTempo;

  ...EntityDated;
}

/** Visão completa de uma oferta de formação. */
@Metadata.EntityId(Tokens.GradeHorarioOfertaFormacaoIntervaloDeTempo_View)
model GradeHorarioOfertaFormacaoIntervaloDeTempoView {
  ...OmitProperties<
    GradeHorarioOfertaFormacaoIntervaloDeTempo,
    "gradeHorarioOfertaFormacao" | "intervaloDeTempo"
  >;
  gradeHorarioOfertaFormacao: GradeHorarioOfertaFormacaoFindOneResultView;
  intervaloDeTempo: IntervaloDeTempoFindOneResultView;
}

/** Dados de entrada para encontrar uma oferta de formação por ID. */
@Metadata.EntityId(
  Tokens.GradeHorarioOfertaFormacaoIntervaloDeTempo_FindOneInput_View
)
model GradeHorarioOfertaFormacaoIntervaloDeTempoFindOneInputView {
  @Metadata.Constraints.EntityExists(
    Tokens.GradeHorarioOfertaFormacaoIntervaloDeTempo
  )
  id: GradeHorarioOfertaFormacaoIntervaloDeTempo.id;
}

/** Visão FindOne de uma oferta de formação. */
@Metadata.EntityId(
  Tokens.GradeHorarioOfertaFormacaoIntervaloDeTempo_FindOneResult_View
)
@Metadata.EntityPartialOfId(
  Tokens.GradeHorarioOfertaFormacaoIntervaloDeTempo_View
)
model GradeHorarioOfertaFormacaoIntervaloDeTempoFindOneResultView {
  ...PickProperties<GradeHorarioOfertaFormacaoIntervaloDeTempoView, "id">;
  ...PickProperties<
    GradeHorarioOfertaFormacaoIntervaloDeTempoView,
    "gradeHorarioOfertaFormacao" | "intervaloDeTempo"
  >;
  ...PickProperties<
    GradeHorarioOfertaFormacaoIntervaloDeTempoView,
    "dateCreated" | "dateUpdated" | "dateDeleted"
  >;
}

/** Dados de entrada para a criação de uma oferta de formação. */
@Metadata.EntityId(
  Tokens.GradeHorarioOfertaFormacaoIntervaloDeTempo_InputCreate_View
)
model GradeHorarioOfertaFormacaoIntervaloDeTempoInputCreateView {
  gradeHorarioOfertaFormacao: GradeHorarioOfertaFormacaoFindOneInputView;
  intervaloDeTempo: IntervaloDeTempoInputView;
}

/** Dados de entrada para a atualização de uma oferta de formação. */
@Metadata.EntityId(
  Tokens.GradeHorarioOfertaFormacaoIntervaloDeTempo_InputUpdate_View
)
model GradeHorarioOfertaFormacaoIntervaloDeTempoInputUpdateView
  is OptionalProperties<GradeHorarioOfertaFormacaoIntervaloDeTempoInputCreateView>;

/** Resultados da busca a GradeHorarioOfertaFormacaoIntervaloDeTempos. */
@Metadata.EntityId(
  Tokens.GradeHorarioOfertaFormacaoIntervaloDeTempo_ListResult_View
)
model GradeHorarioOfertaFormacaoIntervaloDeTempoListResultView
  is Pagination.Result.View<GradeHorarioOfertaFormacaoIntervaloDeTempoFindOneResultView>;
