import "./entities-metadata.js";

using Ladesa.v3.Generics;
using TypeSpec.JsonSchema;
using TypeSpec.Reflection;

@baseUri("ladesa://schemas/v3/generics/entities")
namespace Ladesa.v3.Generics.Entities;

/**
 * Estrutura identificada por id no formato uuid.
 */
model EntityIdUuid {
  /** Identificador do registro (uuid). */
  id: id_uuid;
}

/**
 * Estrutura identificada por id no formato numérico.
 */
model EntityIdInteger {
  /** Identificador do registro (numérico). */
  id: id_integer;
}

/**
 * Estrutura datada.
 */
model EntityDated {
  /** Data e hora da criação do registro. */
  dateCreated: date_time;

  /** Data e hora da alteração do registro. */
  dateUpdated: date_time;

  /** Data e hora da exclusão do registro. */
  dateDeleted: date_time | null;
}

namespace Metadata {
  extern dec EntityId(target: Model, entityToken: string | unknown);
  extern dec EntityPartialOfId(target: unknown, partialOf: string | unknown);
}
