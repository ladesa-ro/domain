using TypeSpec.JsonSchema;

using Ladesa.v3.Generics;
using Ladesa.v3.Generics.Entities;
using Ladesa.Schemas.Pagination.Result;

namespace Ladesa.v3.Schemas;

/** HorarioGerado. */
@Metadata.EntityId(Tokens.HorarioGerado)
model HorarioGerado {
  ...EntityIdUuid;

  /** Status do horário gerado. */
  status: string | null;

  /** Tipo do horário gerado. */
  tipo: string | null;

  /** Data em que o horário foi gerado. */
  dataGeracao: date_time | null;

  /** Início da vigência do horário gerado. */
  vigenciaInicio: date | null;

  /** Fim da vigência do horário gerado. */
  vigenciaFim: date | null;

  /** calendário. */
  calendario: CalendarioLetivo;

  ...EntityDated;
}

/** Visão completa de um HorarioGerado. */
@Metadata.EntityId(Tokens.HorarioGerado_View)
model HorarioGeradoView {
  ...OmitProperties<HorarioGerado, "calendario">;
  calendario: CalendarioLetivoFindOneResultView;
}

/** Dados de entrada para encontrar um HorarioGerado por ID. */
@Metadata.EntityId(Tokens.HorarioGerado_FindOneInput_View)
model HorarioGeradoFindOneInputView {
  @extension("x-unispec-constraint-entity-exists", Json<Tokens.HorarioGerado>)
  id: HorarioGerado.id;
}

/** Visão FindOne de um HorarioGerado. */
@Metadata.EntityId(Tokens.HorarioGerado_FindOneResult_View)
@Metadata.EntityPartialOfId(Tokens.HorarioGerado)
model HorarioGeradoFindOneResultView {
  ...PickProperties<HorarioGeradoView, "id">;
  ...PickProperties<
    HorarioGeradoView,
    "status" | "tipo" | "dataGeracao" | "vigenciaInicio" | "vigenciaFim"
  >;
  ...PickProperties<HorarioGeradoView, "calendario">;
  ...PickProperties<
    HorarioGeradoView,
    "dateCreated" | "dateUpdated" | "dateDeleted"
  >;
}

/** Dados de entrada para a criação de um HorarioGerado. */
@Metadata.EntityId(Tokens.HorarioGerado_InputCreate_View)
model HorarioGeradoInputCreateView {
  status: HorarioGerado.status;
  tipo: HorarioGerado.tipo;
  dataGeracao: HorarioGerado.dataGeracao;
  vigenciaInicio: HorarioGerado.vigenciaInicio;
  vigenciaFim: HorarioGerado.vigenciaFim;

  //
  calendario: CalendarioLetivoFindOneInputView;
}

/** Dados de entrada para a atualização de um HorarioGerado. */
@Metadata.EntityId(Tokens.HorarioGerado_InputUpdate_View)
model HorarioGeradoInputUpdateView
  is OptionalProperties<HorarioGeradoInputCreateView>;

/** Resultados da busca de HorariosGerados. */
@Metadata.EntityId(Tokens.HorarioGerado_ListResult_View)
model HorarioGeradoListResultView
  is PaginationResultView<HorarioGeradoFindOneResultView>;
