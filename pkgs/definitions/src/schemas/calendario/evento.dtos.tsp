using Ladesa.Domain.v4.Generics;
using Ladesa.Domain.v4.Generics.Entities;

namespace Ladesa.Domain.v4.Schemas;

/** Visão completa de um Evento. */
@Metadata.EntityId(Tokens.Evento_View)
model EventoView {
  ...OmitProperties<Evento, "calendario">;
  calendario: CalendarioLetivoFindOneResultView;
}

/** Dados de entrada para encontrar um Evento por ID. */
@Metadata.EntityId(Tokens.Evento_FindOneInput_View)
model EventoFindOneInputView {
  @Metadata.Constraints.EntityExists(Tokens.Evento)
  id: Evento.id;
}

/** Visão FindOne de um Evento. */
@Metadata.EntityId(Tokens.Evento_FindOneResult_View)
@Metadata.EntityPartialOfId(Tokens.Evento_View)
model EventoFindOneResultView {
  ...PickProperties<EventoView, "id">;
  ...PickProperties<EventoView, "nome" | "rrule" | "cor">;
  ...PickProperties<EventoView, "calendario">;
  ...PickProperties<EventoView, "dateCreated" | "dateUpdated" | "dateDeleted">;
}

/** Dados de entrada para a criação de um Evento. */
@Metadata.EntityId(Tokens.Evento_InputCreate_View)
model EventoInputCreateView {
  nome: string | null;
  rrule: string;
  cor: string | null;
  calendario: CalendarioLetivoFindOneInputView;
}

/** Dados de entrada para a atualização de um Evento. */
@Metadata.EntityId(Tokens.Evento_InputUpdate_View)
model EventoInputUpdateView is OptionalProperties<EventoInputCreateView>;

/** Resultados da busca a Eventos. */
@Metadata.EntityId(Tokens.Evento_ListResult_View)
model EventoListResultView is Pagination.Result.View<EventoFindOneResultView>;
