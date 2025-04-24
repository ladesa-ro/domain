using Ladesa.v3.Generics;
using Ladesa.v3.Generics.Entities;
using TypeSpec.JsonSchema;

namespace Ladesa.v3.Schemas;

/** Intervalo de Tempo. */
@Metadata.EntityId(Tokens.IntervaloDeTempo)
model IntervaloDeTempo {
  ...EntityIdUuid;

  /** Horário que o intervalo de tempo inicia. */
  periodoInicio: time;

  /** Horário que o intervalo de tempo termina. */
  periodoFim: time;

  ...EntityDated;
}

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
