using Ladesa.Domain.v4.Generics;
using Ladesa.Domain.v4.Generics.Entities;

namespace Ladesa.Domain.v4.Schemas;

/** Disciplina. */
@Metadata.EntityId(Tokens.Disciplina)
model Disciplina {
  ...EntityIdUuid;

  /** Nome da disciplina. */
  @minLength(1)
  nome: string;

  /** Nome abreviado da disciplina. */
  @minLength(1)
  nomeAbreviado: string;

  /** Carga horária da disciplina. */
  @minValue(1)
  cargaHoraria: uint16;

  /** Imagem de capa da disciplina. */
  imagemCapa: Imagem | null;

  /** Diários que vinculam esta disciplina. */
  diarios: Diario[];

  ...EntityDated;
}
