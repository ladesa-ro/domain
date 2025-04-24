using Ladesa.v3.Generics;
using Ladesa.v3.Generics.Entities;

namespace Ladesa.v3.Schemas;

/** DisponibilidadeDia. */
@Metadata.EntityId(Tokens.DisponibilidadeDia)
model DisponibilidadeDia {
  ...EntityIdUuid;

  /** Regra RRule para a recorrência do evento. Segue a RFC 5545 do iCalendar. */
  rrule: string;

  /** Intervalo de tempo. */
  intervaloDeTempo: IntervaloDeTempo;

  /** Disponibilidade. */
  disponibilidade: Disponibilidade;

  ...EntityDated;
}

/** Visão completa de um DisponibilidadeDia. */
@Metadata.EntityId(Tokens.DisponibilidadeDia_View)
model DisponibilidadeDiaView {
  ...OmitProperties<DisponibilidadeDia, "intervaloDeTempo" | "disponibilidade">;
  intervaloDeTempo: IntervaloDeTempoFindOneResultView;
  disponibilidade: DisponibilidadeFindOneResultView;
}

/** Dados de entrada para encontrar um DisponibilidadeDia por ID. */
@Metadata.EntityId(Tokens.DisponibilidadeDia_FindOneInput_View)
model DisponibilidadeDiaFindOneInputView {
  @Metadata.Constraints.EntityExists(Tokens.DisponibilidadeDia)
  id: DisponibilidadeDia.id;
}

/** Visão FindOne de um DisponibilidadeDia. */
@Metadata.EntityId(Tokens.DisponibilidadeDia_FindOneResult_View)
@Metadata.EntityPartialOfId(Tokens.DisponibilidadeDia_View)
model DisponibilidadeDiaFindOneResultView {
  ...PickProperties<DisponibilidadeDiaView, "id">;
  ...PickProperties<DisponibilidadeDiaView, "rrule">;
  ...PickProperties<
    DisponibilidadeDiaView,
    "intervaloDeTempo" | "disponibilidade"
  >;
  ...PickProperties<
    DisponibilidadeDiaView,
    "dateCreated" | "dateUpdated" | "dateDeleted"
  >;
}

/** Dados de entrada para a criação de um DisponibilidadeDia. */
@Metadata.EntityId(Tokens.DisponibilidadeDia_InputCreate_View)
model DisponibilidadeDiaInputCreateView {
  rrule: DisponibilidadeDia.rrule;
  intervaloDeTempo: IntervaloDeTempoInputView;
  disponibilidade: DisponibilidadeFindOneInputView;
}

/** Dados de entrada para a atualização de um DisponibilidadeDia. */
@Metadata.EntityId(Tokens.DisponibilidadeDia_InputUpdate_View)
model DisponibilidadeDiaInputUpdateView
  is OptionalProperties<DisponibilidadeDiaInputCreateView>;

/** Resultados da busca a DisponibilidadeDia. */
@Metadata.EntityId(Tokens.DisponibilidadeDia_ListResult_View)
model DisponibilidadeDiaListResultView
  is Pagination.Result.View<DisponibilidadeDiaFindOneResultView>;
