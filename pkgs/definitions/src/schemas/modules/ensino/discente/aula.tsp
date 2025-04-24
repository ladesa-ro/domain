using TypeSpec.JsonSchema;

using Ladesa.v3.Generics;
using Ladesa.v3.Generics.Entities;
using Ladesa.v3.Generics.Pagination.Result;

namespace Ladesa.v3.Schemas;

/** Aula. */
@Metadata.EntityId(Tokens.Aula)
model Aula {
  ...EntityIdUuid;

  /** Data da aula. */
  data: date;

  /** Modalidade da aula. */
  modalidade: string | null;

  /** Intervalo de Tempo associado à aula. */
  intervaloDeTempo: IntervaloDeTempo;

  /** Diário associado à aula. */
  diario: Diario;

  /** Ambiente associado à aula. */
  ambiente: Ambiente | null;

  ...EntityDated;
}

/** Visão completa de uma Aula. */
@Metadata.EntityId(Tokens.Aula_View)
model AulaView {
  ...OmitProperties<Aula, "intervaloDeTempo" | "diario" | "ambiente">;
  intervaloDeTempo: IntervaloDeTempoFindOneResultView;
  diario: DiarioFindOneResultView;
  ambiente: AmbienteFindOneResultView | null;
}

/** Dados de entrada para encontrar uma Aula por ID. */
@Metadata.EntityId(Tokens.Aula_FindOneInput_View)
model AulaFindOneInputView {
  @extension("x-unispec-constraint-entity-exists", Json<Tokens.Aula>)
  id: Aula.id;
}

/** Visão FindOne de uma Aula. */
@Metadata.EntityId(Tokens.Aula_FindOneResult_View)
@Metadata.EntityPartialOfId(Tokens.Aula_View)
model AulaFindOneResultView {
  ...PickProperties<AulaView, "id">;
  ...PickProperties<AulaView, "data" | "modalidade">;
  ...PickProperties<AulaView, "intervaloDeTempo" | "diario" | "ambiente">;
  ...PickProperties<AulaView, "dateCreated" | "dateUpdated" | "dateDeleted">;
}

/** Dados de entrada para a criação de uma Aula. */
@Metadata.EntityId(Tokens.Aula_InputCreate_View)
model AulaInputCreateView {
  data: date;
  modalidade: string | null;
  intervaloDeTempo: IntervaloDeTempoInputView;
  diario: DiarioFindOneInputView;
  ambiente: AmbienteFindOneInputView | null;
}

/** Dados de entrada para a atualização de uma Aula. */
@Metadata.EntityId(Tokens.Aula_InputUpdate_View)
model AulaInputUpdateView is OptionalProperties<AulaInputCreateView>;

/** Resultados da busca a Aulas. */
@Metadata.EntityId(Tokens.Aula_ListResult_View)
model AulaListResultView is PaginationResultView<AulaFindOneResultView>;
