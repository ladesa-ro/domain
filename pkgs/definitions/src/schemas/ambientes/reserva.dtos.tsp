using Ladesa.Domain.v4.Generics;
using Ladesa.Domain.v4.Generics.Entities;

namespace Ladesa.Domain.v4.Schemas;

/** Visão completa de uma Reserva. */
@Metadata.EntityId(Tokens.Reserva_View)
model ReservaView {
  ...OmitProperties<Reserva, "usuario" | "ambiente">;
  usuario: UsuarioFindOneResultView;
  ambiente: AmbienteFindOneResultView;
}

/** Dados de entrada para encontrar uma Reserva por ID. */
@Metadata.EntityId(Tokens.Reserva_FindOneInput_View)
model ReservaFindOneInputView {
  @Metadata.Constraints.EntityExists(Tokens.Reserva)
  id: Reserva.id;
}

/** Visão FindOne de uma Reserva. */
@Metadata.EntityId(Tokens.Reserva_FindOneResult_View)
@Metadata.EntityPartialOfId(Tokens.Reserva_View)
model ReservaFindOneResultView {
  //
  ...PickProperties<ReservaView, "id">;

  ...PickProperties<ReservaView, "situacao" | "motivo" | "tipo" | "rrule">;

  //
  ...PickProperties<ReservaView, "usuario" | "ambiente">;

  //
  ...PickProperties<ReservaView, "dateCreated" | "dateUpdated" | "dateDeleted">;
}

/** Dados de entrada para a criação de uma Reserva. */
@Metadata.EntityId(Tokens.Reserva_InputCreate_View)
model ReservaInputCreateView {
  ...PickProperties<ReservaView, "situacao" | "motivo" | "tipo" | "rrule">;
  usuario: UsuarioFindOneInputView;
  ambiente: AmbienteFindOneInputView;
}

/** Dados de entrada para a atualização de uma Reserva. */
@Metadata.EntityId(Tokens.Reserva_InputUpdate_View)
model ReservaInputUpdateView is OptionalProperties<ReservaInputCreateView>;

/** Resultados da busca a Reservas. */
@Metadata.EntityId(Tokens.Reserva_ListResult_View)
model ReservaListResultView is Pagination.Result.View<ReservaFindOneResultView>;
