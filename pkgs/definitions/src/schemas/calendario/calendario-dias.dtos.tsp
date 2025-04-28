using Ladesa.Domain.v4.Generics;
using Ladesa.Domain.v4.Generics.Entities;

namespace Ladesa.Domain.v4;

/** Tokens de Identificadores das Views */
model Tokens {
  CalendarioDias_FindInput_View: string = "CalendarioDias_FindInput_View";
  CalendarioDias_FindResult_View: string = "CalendarioDias_FindResult_View";
}

/** Dados de entrada para buscar dias do calendário. */
@Metadata.EntityId(Tokens.CalendarioDias_FindInput_View)
model CalendarioDiasFindInputView {
  ano: int32;

  /** Mês opcional. */
  mes?: int32;
}

/** Resultado da busca de dias do calendário. */
@Metadata.EntityId(Tokens.CalendarioDias_FindResult_View)
model CalendarioDiasFindResultView {
  /** Lista de dias do calendário encontrados. */
  dias: DiaCalendario[];
}
