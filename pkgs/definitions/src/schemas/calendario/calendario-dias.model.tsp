using Ladesa.Domain.v4.Generics;
using Ladesa.Domain.v4.Generics.Entities;

/** Tipos de dias possíveis no calendário. */

union TipoDiaCalendario {
  /** Aula Presencial */
  "Aula Presencial";

  /** Aula Não Presencial (Letiva) */
  "Aula Não Presencial (Letiva)";

  /** Feriado */
  "Feriado";

  /** Sábado */
  "Sábado";

  /** Domingo */
  "Domingo";

  /** Outro */
  "Outro";
}
/** Representa um dia no calendário. */
model DiaCalendario {
  /** Data */
  data: date;

  /** Indica se o dia é letivo (true ou false) */
  diaLetivo: boolean;

  /** Modalidade do dia: "presencial" ou "não presencial" */
  diaModalidade: "presencial" | "não presencial";

  /** Feriado (pode ser null se não for feriado) */
  feriado: string | null;
}


/** Input para obter o calendário de um determinado ano e mês. */
model GetCalendarioInput {
  /** Identificador do calendário */
  idCalendario: int32;

  /** Ano a ser consultado */
  ano: int16;

  /** Mês a ser consultado (opcional) */
  mes?: int8;
}


/** Retorno da consulta de calendário. */
model GetCalendarioOutput {
  /** Lista dos dias do calendário */
  dias: DiaCalendario[];
}
