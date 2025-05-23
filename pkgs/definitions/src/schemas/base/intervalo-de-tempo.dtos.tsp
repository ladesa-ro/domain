using Ladesa.Domain.v4.Generics;
using Ladesa.Domain.v4.Generics.Entities;

namespace Ladesa.Domain.v4.Schemas;

/** Visão completa de um Intervalo de Tempo. */
@Metadata.EntityId(Tokens.IntervaloDeTempo_View)
model IntervaloDeTempoView {
  ...IntervaloDeTempo;
}

/** Visão FindOne de um Intervalo de Tempo. */
@Metadata.EntityId(Tokens.IntervaloDeTempo_FindOneResult_View)
@Metadata.EntityPartialOfId(Tokens.IntervaloDeTempo_View)
model IntervaloDeTempoFindOneResultView {
  ...PickProperties<IntervaloDeTempoView, "id">;
  ...PickProperties<IntervaloDeTempoView, "periodoInicio">;
  ...PickProperties<IntervaloDeTempoView, "periodoFim">;
  ...PickProperties<
    IntervaloDeTempoView,
    "dateCreated" | "dateUpdated" | "dateDeleted"
  >;
}

/** Dados de entrada para um Intervalo de Tempo. */
@Metadata.EntityId(Tokens.IntervaloDeTempo_Input_View)
model IntervaloDeTempoInputView {
  ...PickProperties<IntervaloDeTempoView, "periodoInicio">;
  ...PickProperties<IntervaloDeTempoView, "periodoFim">;
}
