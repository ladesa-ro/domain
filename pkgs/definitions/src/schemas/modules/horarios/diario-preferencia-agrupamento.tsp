using Ladesa.Domain.v4.Generics;
using Ladesa.Domain.v4.Generics.Entities;

namespace Ladesa.Domain.v4.Schemas;

/** DiarioPreferenciaAgrupamento. */
@Metadata.EntityId(Tokens.DiarioPreferenciaAgrupamento)
model DiarioPreferenciaAgrupamento {
  ...EntityIdUuid;

  /** Início da vigência da preferência de agrupamento. */
  dataInicio: date;

  /** Fim da vigência da preferência de agrupamento. */
  dataFim: date | null;

  /** Dia da semana. */
  diaSemanaIso: uint8;

  /** Quantidade de aulas seguidas. */
  aulasSeguidas: uint8;

  /** Intervalo de tempo. */
  intervaloDeTempo: IntervaloDeTempo;

  /** Diário vinculado. */
  diario: Diario;

  ...EntityDated;
}

/** Visão completa de um DiarioPreferenciaAgrupamento. */
@Metadata.EntityId(Tokens.DiarioPreferenciaAgrupamento_View)
model DiarioPreferenciaAgrupamentoView {
  ...OmitProperties<
    DiarioPreferenciaAgrupamento,
    "intervaloDeTempo" | "diario"
  >;
  intervaloDeTempo: IntervaloDeTempoFindOneResultView;
  diario: DiarioFindOneResultView;
}

/** Dados de entrada para encontrar um DiarioPreferenciaAgrupamento por ID. */
@Metadata.EntityId(Tokens.DiarioPreferenciaAgrupamento_FindOneInput_View)
model DiarioPreferenciaAgrupamentoFindOneInputView {
  @Metadata.Constraints.EntityExists(Tokens.DiarioPreferenciaAgrupamento)
  id: DiarioPreferenciaAgrupamento.id;
}

/** Visão FindOne de um DiarioPreferenciaAgrupamento. */
@Metadata.EntityId(Tokens.DiarioPreferenciaAgrupamento_FindOneResult_View)
@Metadata.EntityPartialOfId(Tokens.DiarioPreferenciaAgrupamento)
model DiarioPreferenciaAgrupamentoFindOneResultView {
  ...PickProperties<DiarioPreferenciaAgrupamentoView, "id">;
  ...PickProperties<
    DiarioPreferenciaAgrupamentoView,
    "diaSemanaIso" | "aulasSeguidas" | "dataInicio" | "dataFim"
  >;
  ...PickProperties<
    DiarioPreferenciaAgrupamentoView,
    "intervaloDeTempo" | "diario"
  >;
  ...PickProperties<
    DiarioPreferenciaAgrupamentoView,
    "dateCreated" | "dateUpdated" | "dateDeleted"
  >;
}

/** Dados de entrada para a criação de um DiarioPreferenciaAgrupamento. */
@Metadata.EntityId(Tokens.DiarioPreferenciaAgrupamento_InputCreate_View)
model DiarioPreferenciaAgrupamentoInputCreateView {
  diaSemanaIso: DiarioPreferenciaAgrupamento.diaSemanaIso;
  aulasSeguidas: DiarioPreferenciaAgrupamento.aulasSeguidas;
  dataInicio: DiarioPreferenciaAgrupamento.dataInicio;
  dataFim: DiarioPreferenciaAgrupamento.dataFim;

  //
  intervaloDeTempo: IntervaloDeTempoInputView;

  //
  diario: DiarioFindOneInputView;
}

/** Dados de entrada para a atualização de um DiarioPreferenciaAgrupamento. */
@Metadata.EntityId(Tokens.DiarioPreferenciaAgrupamento_InputUpdate_View)
model DiarioPreferenciaAgrupamentoInputUpdateView
  is OptionalProperties<DiarioPreferenciaAgrupamentoInputCreateView>;

/** Resultados da busca de DiarioPreferenciaAgrupamentos. */
@Metadata.EntityId(Tokens.DiarioPreferenciaAgrupamento_ListResult_View)
model DiarioPreferenciaAgrupamentoListResultView
  is Pagination.Result.View<DiarioPreferenciaAgrupamentoFindOneResultView>;
