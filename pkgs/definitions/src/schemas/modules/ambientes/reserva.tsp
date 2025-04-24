using TypeSpec.JsonSchema;

using Ladesa.v3.Generics;
using Ladesa.v3.Generics.Entities;
using Ladesa.Schemas.Pagination.Result;

namespace Ladesa.v3.Schemas;

/** Reserva. */
@Metadata.EntityId(Tokens.Reserva)
model Reserva {
  ...EntityIdUuid;

  /** Situação da reserva. */
  @minLength(1)
  situacao: string;

  /** Motivo da reserva. */
  @minLength(1)
  motivo: string | null;

  /** Tipo da reserva. */
  @minLength(1)
  tipo: string | null;

  /** Regra RRule para a recorrência da reserva. Segue a RFC 5545 do iCalendar. */
  rrule: string;

  /** Usuário que fez a reserva. */
  usuario: Usuario;

  /** Ambiente reservado. */
  ambiente: Ambiente;

  ...EntityDated;
}

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
  @extension("x-unispec-constraint-entity-exists", Json<Tokens.Reserva>)
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
model ReservaListResultView is PaginationResultView<ReservaFindOneResultView>;
