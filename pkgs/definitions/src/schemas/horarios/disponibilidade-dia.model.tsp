using Ladesa.Domain.v4.Generics;
using Ladesa.Domain.v4.Generics.Entities;

namespace Ladesa.Domain.v4.Schemas;

/** DisponibilidadeDia. */
@Metadata.EntityId(Tokens.DisponibilidadeDia)
model DisponibilidadeDia {
  ...EntityIdUuid;

  /** Regra RRule para a recorrência do evento. Segue a RFC 5545 do iCalendar. */
  rrule: string;

  /** Intervalo de tempo. */
  intervaloDeTempo: IntervaloDeTempo;

  /** Disponibilidade. */
  disponibilidade: Disponibilidade;

  ...EntityDated;
}
