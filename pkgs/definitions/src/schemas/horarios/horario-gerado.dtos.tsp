using Ladesa.Domain.v4.Generics;
using Ladesa.Domain.v4.Generics.Entities;

namespace Ladesa.Domain.v4.Schemas;

/** Visão completa de um HorarioGerado. */
@Metadata.EntityId(Tokens.HorarioGerado_View)
model HorarioGeradoView {
  ...OmitProperties<HorarioGerado, "calendario">;
  calendario: CalendarioLetivoFindOneResultView;
}

/** Dados de entrada para encontrar um HorarioGerado por ID. */
@Metadata.EntityId(Tokens.HorarioGerado_FindOneInput_View)
model HorarioGeradoFindOneInputView {
  @Metadata.Constraints.EntityExists(Tokens.HorarioGerado)
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
  is Pagination.Result.View<HorarioGeradoFindOneResultView>;
