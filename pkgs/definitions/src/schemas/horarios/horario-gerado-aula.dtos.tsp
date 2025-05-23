using Ladesa.Domain.v4.Generics;
using Ladesa.Domain.v4.Generics.Entities;

namespace Ladesa.Domain.v4.Schemas;

/** Visão completa de um HorarioGeradoAula. */
@Metadata.EntityId(Tokens.HorarioGeradoAula_View)
model HorarioGeradoAulaView {
  ...OmitProperties<
    HorarioGeradoAula,
    "intervaloDeTempo" | "diarioProfessor" | "horarioGerado"
  >;
  intervaloDeTempo: IntervaloDeTempoFindOneResultView;
  diarioProfessor: DiarioProfessorFindOneResultView;
  horarioGerado: HorarioGeradoFindOneResultView;
}

/** Dados de entrada para encontrar um HorarioGeradoAula por ID. */
@Metadata.EntityId(Tokens.HorarioGeradoAula_FindOneInput_View)
model HorarioGeradoAulaFindOneInputView {
  @Metadata.Constraints.EntityExists(Tokens.HorarioGeradoAula)
  id: HorarioGeradoAula.id;
}

/** Visão FindOne de um HorarioGeradoAula. */
@Metadata.EntityId(Tokens.HorarioGeradoAula_FindOneResult_View)
@Metadata.EntityPartialOfId(Tokens.HorarioGeradoAula)
model HorarioGeradoAulaFindOneResultView {
  ...PickProperties<HorarioGeradoAulaView, "id" | "data">;
  ...PickProperties<
    HorarioGeradoAulaView,
    "intervaloDeTempo" | "diarioProfessor" | "horarioGerado"
  >;
  ...PickProperties<
    HorarioGeradoAulaView,
    "dateCreated" | "dateUpdated" | "dateDeleted"
  >;
}

/** Dados de entrada para a criação de um HorarioGeradoAula. */
@Metadata.EntityId(Tokens.HorarioGeradoAula_InputCreate_View)
model HorarioGeradoAulaInputCreateView {
  data: HorarioGeradoAula.data;
  intervaloDeTempo: IntervaloDeTempoInputView;
  diarioProfessor: DiarioProfessorFindOneInputView;
  horarioGerado: HorarioGeradoFindOneInputView;
}

/** Dados de entrada para a atualização de um HorarioGeradoAula. */
@Metadata.EntityId(Tokens.HorarioGeradoAula_InputUpdate_View)
model HorarioGeradoAulaInputUpdateView
  is OptionalProperties<HorarioGeradoAulaInputCreateView>;

/** Resultados da busca de HorarioGeradoAulas. */
@Metadata.EntityId(Tokens.HorarioGeradoAula_ListResult_View)
model HorarioGeradoAulaListResultView
  is Pagination.Result.View<HorarioGeradoAulaFindOneResultView>;
