using Ladesa.Domain.v4.Generics;
using Ladesa.Domain.v4.Generics.Entities;

namespace Ladesa.Domain.v4.Schemas;

/** Evento. */
@Metadata.EntityId(Tokens.Evento)
model Evento {
  ...EntityIdUuid;

  /** Nome do evento. */
  nome: string | null;

  /** Regra RRule para a recorrência do evento. Segue a RFC 5545 do iCalendar. */
  rrule: string;

  /** Cor da Evento. */
  cor: string | null;

  /** Calendario. */
  calendario: CalendarioLetivo;

  ...EntityDated;
}
