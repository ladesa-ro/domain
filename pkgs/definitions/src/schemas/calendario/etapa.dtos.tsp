using Ladesa.Domain.v4.Generics;
using Ladesa.Domain.v4.Generics.Entities;

namespace Ladesa.Domain.v4.Schemas;

/** Visão completa de uma Etapa. */
@Metadata.EntityId(Tokens.Etapa_View)
model EtapaView {
  ...OmitProperties<Etapa, "calendario">;
  calendario: CalendarioLetivoFindOneResultView;
}

/** Dados de entrada para encontrar uma Etapa por ID. */
@Metadata.EntityId(Tokens.Etapa_FindOneInput_View)
model EtapaFindOneInputView {
  @Metadata.Constraints.EntityExists(Tokens.Etapa)
  id: Etapa.id;
}

/** Visão FindOne de uma Etapa. */
@Metadata.EntityId(Tokens.Etapa_FindOneResult_View)
@Metadata.EntityPartialOfId(Tokens.Etapa_View)
model EtapaFindOneResultView {
  ...PickProperties<EtapaView, "id">;
  ...PickProperties<EtapaView, "numero" | "dataInicio" | "dataTermino" | "cor">;
  ...PickProperties<EtapaView, "calendario">;
  ...PickProperties<EtapaView, "dateCreated" | "dateUpdated" | "dateDeleted">;
}

/** Dados de entrada para a criação de uma Etapa. */
@Metadata.EntityId(Tokens.Etapa_InputCreate_View)
model EtapaInputCreateView {
  numero: uint8 | null;
  dataInicio: date;
  dataTermino: date;
  cor: string | null;
  calendario: CalendarioLetivoFindOneInputView;
}

/** Dados de entrada para a atualização de uma Etapa. */
@Metadata.EntityId(Tokens.Etapa_InputUpdate_View)
model EtapaInputUpdateView is OptionalProperties<EtapaInputCreateView>;

/** Resultados da busca a Etapas. */
@Metadata.EntityId(Tokens.Etapa_ListResult_View)
model EtapaListResultView is Pagination.Result.View<EtapaFindOneResultView>;
