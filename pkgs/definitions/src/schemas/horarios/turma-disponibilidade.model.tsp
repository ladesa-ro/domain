using Ladesa.Domain.v4.Generics;
using Ladesa.Domain.v4.Generics.Entities;

namespace Ladesa.Domain.v4.Schemas;

/** TurmaDisponibilidade. */
@Metadata.EntityId(Tokens.TurmaDisponibilidade)
model TurmaDisponibilidade {
  ...EntityIdUuid;

  /** Disponibilidade. */
  disponibilidade: Disponibilidade;

  /** Turma. */
  turma: Turma;

  ...EntityDated;
}
