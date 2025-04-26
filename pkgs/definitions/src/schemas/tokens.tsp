namespace Ladesa.Domain.v4.Schemas;

@doc("Define os nomes de indentificação das entidades.")
enum Tokens {
  Shared_SearchInput_View: "SearchInputView",
  Shared_Pagination_SortBy_View: "PaginatedSortByView",
  Shared_Pagination_Filter_View: "PaginatedFilterView",
  Shared_Pagination_Input_View: "PaginatedInputView",
  Shared_Pagination_Input_Base_View: "PaginatedInputBaseView",
  Shared_Pagination_Result_Meta_View: "PaginatedResultMetaView",
  Shared_Pagination_Result_Links_View: "PaginatedResultLinksView",
  Shared_Pagination_Result_View: "PaginatedResultView",

  //

  Arquivo: "Arquivo",

  Arquivo_View: "ArquivoView",
  Arquivo_FindOneInput_View: "ArquivoFindOneInputView",
  Arquivo_FindOneResult_View: "ArquivoFindOneResultView",

  //

  Usuario: "Usuario",

  Usuario_View: "UsuarioView",
  Usuario_FindOneInput_View: "UsuarioFindOneInputView",
  Usuario_FindOneResult_View: "UsuarioFindOneResultView",
  Usuario_ListResult_View: "UsuarioListResultView",
  Usuario_InputCreate_View: "UsuarioInputCreateView",
  Usuario_InputUpdate_View: "UsuarioInputUpdateView",

  //
  Auth_LoginInput_View: "AuthLoginInputView",

  Auth_RecoverPasswordInput_View: "AuthRecoverPasswordInputView",
  Auth_WhoAmIResult_View: "AuthWhoAmIInputView",
  Auth_RefreshInput_View: "AuthRefreshInputView",
  Auth_SessionCredentials_View: "AuthSessionCredentialsView",
  Auth_SetInitialPasswordInput_View: "AuthSetInitialPasswordInputView",

  //

  Imagem: "Imagem",

  Imagem_View: "ImagemView",
  Imagem_FindOneInput_View: "ImagemFindOneInputView",
  Imagem_FindOneResult_View: "ImagemFindOneResultView",
  Imagem_FindOneFromImagemArquivoResult_View: "ImageFindOneFromImagemArquivoResultView",

  //

  ImagemArquivo: "ImagemArquivo",

  ImagemArquivo_View: "ImagemArquivoView",
  ImagemArquivo_FindOneInput_View: "ImagemArquivoFindOneInputView",
  ImagemArquivo_FindOneResult_View: "ImagemArquivoFindOneResultView",
  ImagemArquivo_FindOneFromImagemResult_View: "ImagemArquivoFindOneFromImagemResultView",

  //

  IntervaloDeTempo: "IntervaloDeTempo",

  IntervaloDeTempo_View: "IntervaloDeTempoView",
  IntervaloDeTempo_FindOneResult_View: "IntervaloDeTempoFindOneResultView",
  IntervaloDeTempo_Input_View: "IntervaloDeTempoInputView",

  //

  Estado: "Estado",

  Estado_View: "EstadoView",
  Estado_FindOneInput_View: "EstadoFindOneInputView",
  Estado_FindOneResult_View: "EstadoFindOneResultView",
  Estado_ListResult_View: "EstadoListResultView",

  //

  Cidade: "Cidade",

  Cidade_View: "CidadeView",
  Cidade_FindOneInput_View: "CidadeFindOneInputView",
  Cidade_FindOneResult_View: "CidadeFindOneResultView",
  Cidade_ListResult_View: "CidadeListResultView",

  //

  Endereco: "Endereco",

  Endereco_View: "EnderecoView",
  Endereco_FindOneInput_View: "EnderecoFindOneInputView",
  Endereco_FindOneResult_View: "EnderecoFindOneResultView",
  Endereco_Input_View: "EnderecoInputView",

  //
  Campus: "Campus",

  Campus_View: "CampusView",
  Campus_FindOneInput_View: "CampusFindOneInputView",
  Campus_FindOneResult_View: "CampusFindOneResultView",
  Campus_ListResult_View: "CampusListResultView",
  Campus_InputUpdate_View: "CampusInputUpdateView",
  Campus_InputCreate_View: "CampusInputCreateView",

  //
  Bloco: "Bloco",

  Bloco_View: "BlocoView",
  Bloco_InputUpdate_View: "BlocoInputUpdateView",
  Bloco_InputCreate_View: "BlocoInputCreateView",
  Bloco_FindOneInput_View: "BlocoFindOneInputView",
  Bloco_FindOneResult_View: "BlocoFindOneResultView",
  Bloco_ListResult_View: "BlocoListResultView",

  //
  Ambiente: "Ambiente",

  Ambiente_View: "AmbienteView",
  Ambiente_FindOneInput_View: "AmbienteFindOneInputView",
  Ambiente_FindOneResult_View: "AmbienteFindOneResultView",
  Ambiente_ListResult_View: "AmbienteListResultView",
  Ambiente_InputUpdate_View: "AmbienteInputUpdateView",
  Ambiente_InputCreate_View: "AmbienteInputCreateView",

  //

  Perfil: "Perfil",

  Perfil_View: "PerfilView",
  Perfil_FindOneInput_View: "PerfilFindOneInputView",
  Perfil_FindOneResult_View: "PerfilFindOneResultView",
  Perfil_ListResult_View: "PerfilListResultView",
  Perfil_InputUpdate_View: "PerfilInputUpdateView",
  Perfil_InputCreate_View: "PerfilInputCreateView",

  //
  NivelFormacao: "NivelFormacao",

  NivelFormacao_View: "NivelFormacaoView",
  NivelFormacao_FindOneInput_View: "NivelFormacaoFindOneInputView",
  NivelFormacao_FindOneResult_View: "NivelFormacaoFindOneResultView",
  NivelFormacao_ListResult_View: "NivelFormacaoListResultView",
  NivelFormacao_InputCreate_View: "NivelFormacaoInputCreateView",
  NivelFormacao_InputUpdate_View: "NivelFormacaoInputUpdateView",

  //
  Modalidade: "Modalidade",

  Modalidade_View: "ModalidadeView",
  Modalidade_FindOneInput_View: "ModalidadeFindOneInputView",
  Modalidade_FindOneResult_View: "ModalidadeFindOneResultView",
  Modalidade_ListResult_View: "ModalidadeListResultView",
  Modalidade_InputCreate_View: "ModalidadeInputCreateView",
  Modalidade_InputUpdate_View: "ModalidadeInputUpdateView",

  //
  OfertaFormacao: "OfertaFormacao",

  OfertaFormacao_View: "OfertaFormacaoView",
  OfertaFormacao_FindOneInput_View: "OfertaFormacaoFindOneInputView",
  OfertaFormacao_FindOneResult_View: "OfertaFormacaoFindOneResultView",
  OfertaFormacao_ListResult_View: "OfertaFormacaoListResultView",
  OfertaFormacao_InputCreate_View: "OfertaFormacaoInputCreateView",
  OfertaFormacao_InputUpdate_View: "OfertaFormacaoInputUpdateView",

  //
  OfertaFormacaoNivelFormacao: "OfertaFormacaoNivelFormacao",

  OfertaFormacaoNivelFormacao_View: "OfertaFormacaoNivelFormacaoView",
  OfertaFormacaoNivelFormacao_FindOneInput_View: "OfertaFormacaoNivelFormacaoFindOneInputView",
  OfertaFormacaoNivelFormacao_FindOneResult_View: "OfertaFormacaoNivelFormacaoFindOneResultView",
  OfertaFormacaoNivelFormacao_ListResult_View: "OfertaFormacaoNivelFormacaoListResultView",
  OfertaFormacaoNivelFormacao_InputCreate_View: "OfertaFormacaoNivelFormacaoInputCreateView",
  OfertaFormacaoNivelFormacao_InputUpdate_View: "OfertaFormacaoNivelFormacaoInputUpdateView",

  //
  Curso: "Curso",

  Curso_View: "CursoView",
  Curso_FindOneInput_View: "CursoFindOneInputView",
  Curso_FindOneResult_View: "CursoFindOneResultView",
  Curso_ListResult_View: "CursoListResultView",
  Curso_InputCreate_View: "CursoInputCreateView",
  Curso_InputUpdate_View: "CursoInputUpdateView",

  //
  Disciplina: "Disciplina",

  Disciplina_View: "DisciplinaView",
  Disciplina_FindOneInput_View: "DisciplinaFindOneInputView",
  Disciplina_FindOneResult_View: "DisciplinaFindOneResultView",
  Disciplina_ListResult_View: "DisciplinaListResultView",
  Disciplina_InputCreate_View: "DisciplinaInputCreateView",
  Disciplina_InputUpdate_View: "DisciplinaInputUpdateView",

  //
  CalendarioLetivo: "CalendarioLetivo",

  CalendarioLetivo_View: "CalendarioLetivoView",
  CalendarioLetivo_FindOneInput_View: "CalendarioLetivoFindOneInputView",
  CalendarioLetivo_FindOneResult_View: "CalendarioLetivoFindOneResultView",
  CalendarioLetivo_ListResult_View: "CalendarioLetivoListResultView",
  CalendarioLetivo_InputCreate_View: "CalendarioLetivoInputCreateView",
  CalendarioLetivo_InputUpdate_View: "CalendarioLetivoInputUpdateView",

  //
  Reserva: "Reserva",

  Reserva_View: "ReservaView",
  Reserva_FindOneInput_View: "ReservaFindOneInputView",
  Reserva_FindOneResult_View: "ReservaFindOneResultView",
  Reserva_ListResult_View: "ReservaListResultView",
  Reserva_InputUpdate_View: "ReservaInputUpdateView",
  Reserva_InputCreate_View: "ReservaInputCreateView",

  //
  GradeHorarioOfertaFormacao: "GradeHorarioOfertaFormacao",

  GradeHorarioOfertaFormacao_View: "GradeHorarioOfertaFormacaoView",
  GradeHorarioOfertaFormacao_FindOneInput_View: "GradeHorarioOfertaFormacaoFindOneInputView",
  GradeHorarioOfertaFormacao_FindOneResult_View: "GradeHorarioOfertaFormacaoFindOneResultView",
  GradeHorarioOfertaFormacao_ListResult_View: "GradeHorarioOfertaFormacaoListResultView",
  GradeHorarioOfertaFormacao_InputUpdate_View: "GradeHorarioOfertaFormacaoInputUpdateView",
  GradeHorarioOfertaFormacao_InputCreate_View: "GradeHorarioOfertaFormacaoInputCreateView",

  //
  GradeHorarioOfertaFormacaoIntervaloDeTempo: "GradeHorarioOfertaFormacaoIntervaloDeTempo",

  GradeHorarioOfertaFormacaoIntervaloDeTempo_View: "GradeHorarioOfertaFormacaoIntervaloDeTempoView",
  GradeHorarioOfertaFormacaoIntervaloDeTempo_FindOneInput_View: "GradeHorarioOfertaFormacaoIntervaloDeTempoFindOneInputView",
  GradeHorarioOfertaFormacaoIntervaloDeTempo_FindOneResult_View: "GradeHorarioOfertaFormacaoIntervaloDeTempoFindOneResultView",
  GradeHorarioOfertaFormacaoIntervaloDeTempo_ListResult_View: "GradeHorarioOfertaFormacaoIntervaloDeTempoListResultView",
  GradeHorarioOfertaFormacaoIntervaloDeTempo_InputUpdate_View: "GradeHorarioOfertaFormacaoIntervaloDeTempoInputUpdateView",
  GradeHorarioOfertaFormacaoIntervaloDeTempo_InputCreate_View: "GradeHorarioOfertaFormacaoIntervaloDeTempoInputCreateView",

  //
  DiaCalendario: "DiaCalendario",

  DiaCalendario_View: "DiaCalendarioView",
  DiaCalendario_InputUpdate_View: "DiaCalendarioInputUpdateView",
  DiaCalendario_InputCreate_View: "DiaCalendarioInputCreateView",
  DiaCalendario_FindOneInput_View: "DiaCalendarioFindOneInputView",
  DiaCalendario_FindOneResult_View: "DiaCalendarioFindOneResultView",
  DiaCalendario_ListResult_View: "DiaCalendarioListResultView",

  //
  Evento: "Evento",

  Evento_View: "EventoView",
  Evento_FindOneInput_View: "EventoFindOneInputView",
  Evento_FindOneResult_View: "EventoFindOneResultView",
  Evento_ListResult_View: "EventoListResultView",
  Evento_InputCreate_View: "EventoInputCreateView",
  Evento_InputUpdate_View: "EventoInputUpdateView",

  //
  Etapa: "Etapa",

  Etapa_View: "EtapaView",
  Etapa_FindOneInput_View: "EtapaFindOneInputView",
  Etapa_FindOneResult_View: "EtapaFindOneResultView",
  Etapa_ListResult_View: "EtapaListResultView",
  Etapa_InputCreate_View: "EtapaInputCreateView",
  Etapa_InputUpdate_View: "EtapaInputUpdateView",

  //
  Turma: "Turma",

  Turma_View: "TurmaView",
  Turma_FindOneInput_View: "TurmaFindOneInputView",
  Turma_FindOneResult_View: "TurmaFindOneResultView",
  Turma_ListResult_View: "TurmaListResultView",
  Turma_InputCreate_View: "TurmaInputCreateView",
  Turma_InputUpdate_View: "TurmaInputUpdateView",

  //
  Diario: "Diario",

  Diario_View: "DiarioView",
  Diario_FindOneInput_View: "DiarioFindOneInputView",
  Diario_FindOneResult_View: "DiarioFindOneResultView",
  Diario_ListResult_View: "DiarioListResultView",
  Diario_InputCreate_View: "DiarioInputCreateView",
  Diario_InputUpdate_View: "DiarioInputUpdateView",

  //
  DiarioProfessor: "DiarioProfessor",

  DiarioProfessor_View: "DiarioProfessorView",
  DiarioProfessor_FindOneInput_View: "DiarioProfessorFindOneInputView",
  DiarioProfessor_FindOneResult_View: "DiarioProfessorFindOneResultView",
  DiarioProfessor_ListResult_View: "DiarioProfessorListResultView",
  DiarioProfessor_InputCreate_View: "DiarioProfessorInputCreateView",
  DiarioProfessor_InputUpdate_View: "DiarioProfessorInputUpdateView",

  //
  Aula: "Aula",

  Aula_View: "AulaView",
  Aula_FindOneInput_View: "AulaFindOneInputView",
  Aula_FindOneResult_View: "AulaFindOneResultView",
  Aula_ListResult_View: "AulaListResultView",
  Aula_InputCreate_View: "AulaInputCreateView",
  Aula_InputUpdate_View: "AulaInputUpdateView",

  //
  Disponibilidade: "Disponibilidade",

  Disponibilidade_View: "DisponibilidadeView",
  Disponibilidade_FindOneInput_View: "DisponibilidadeFindOneInputView",
  Disponibilidade_FindOneResult_View: "DisponibilidadeFindOneResultView",
  Disponibilidade_ListResult_View: "DisponibilidadeListResultView",
  Disponibilidade_InputCreate_View: "DisponibilidadeInputCreateView",
  Disponibilidade_InputUpdate_View: "DisponibilidadeInputUpdateView",

  //
  DisponibilidadeDia: "DisponibilidadeDia",

  DisponibilidadeDia_View: "DisponibilidadeDiaView",
  DisponibilidadeDia_FindOneInput_View: "DisponibilidadeDiaFindOneInputView",
  DisponibilidadeDia_FindOneResult_View: "DisponibilidadeDiaFindOneResultView",
  DisponibilidadeDia_ListResult_View: "DisponibilidadeDiaListResultView",
  DisponibilidadeDia_InputCreate_View: "DisponibilidadeDiaInputCreateView",
  DisponibilidadeDia_InputUpdate_View: "DisponibilidadeDiaInputUpdateView",

  //
  TurmaDisponibilidade: "TurmaDisponibilidade",

  TurmaDisponibilidade_View: "TurmaDisponibilidadeView",
  TurmaDisponibilidade_FindOneInput_View: "TurmaDisponibilidadeFindOneInputView",
  TurmaDisponibilidade_FindOneResult_View: "TurmaDisponibilidadeFindOneResultView",
  TurmaDisponibilidade_ListResult_View: "TurmaDisponibilidadeListResultView",
  TurmaDisponibilidade_InputCreate_View: "TurmaDisponibilidadeInputCreateView",
  TurmaDisponibilidade_InputUpdate_View: "TurmaDisponibilidadeInputUpdateView",

  //
  ProfessorDisponibilidade: "ProfessorDisponibilidade",

  ProfessorDisponibilidade_View: "ProfessorDisponibilidadeView",
  ProfessorDisponibilidade_FindOneInput_View: "ProfessorDisponibilidadeFindOneInputView",
  ProfessorDisponibilidade_FindOneResult_View: "ProfessorDisponibilidadeFindOneResultView",
  ProfessorDisponibilidade_ListResult_View: "ProfessorDisponibilidadeListResultView",
  ProfessorDisponibilidade_InputCreate_View: "ProfessorDisponibilidadeInputCreateView",
  ProfessorDisponibilidade_InputUpdate_View: "ProfessorDisponibilidadeInputUpdateView",

  //

  DiarioPreferenciaAgrupamento: "DiarioPreferenciaAgrupamento",

  DiarioPreferenciaAgrupamento_View: "DiarioPreferenciaAgrupamentoView",
  DiarioPreferenciaAgrupamento_FindOneInput_View: "DiarioPreferenciaAgrupamentoFindOneInputView",
  DiarioPreferenciaAgrupamento_FindOneResult_View: "DiarioPreferenciaAgrupamentoFindOneResultView",
  DiarioPreferenciaAgrupamento_ListResult_View: "DiarioPreferenciaAgrupamentoListResultView",
  DiarioPreferenciaAgrupamento_InputCreate_View: "DiarioPreferenciaAgrupamentoInputCreateView",
  DiarioPreferenciaAgrupamento_InputUpdate_View: "DiarioPreferenciaAgrupamentoInputUpdateView",

  //

  HorarioGerado: "HorarioGerado",

  HorarioGerado_View: "HorarioGeradoView",
  HorarioGerado_FindOneInput_View: "HorarioGeradoFindOneInputView",
  HorarioGerado_FindOneResult_View: "HorarioGeradoFindOneResultView",
  HorarioGerado_ListResult_View: "HorarioGeradoListResultView",
  HorarioGerado_InputCreate_View: "HorarioGeradoInputCreateView",
  HorarioGerado_InputUpdate_View: "HorarioGeradoInputUpdateView",

  //

  HorarioGeradoAula: "HorarioGeradoAula",

  HorarioGeradoAula_View: "HorarioGeradoAulaView",
  HorarioGeradoAula_FindOneInput_View: "HorarioGeradoAulaFindOneInputView",
  HorarioGeradoAula_FindOneResult_View: "HorarioGeradoAulaFindOneResultView",
  HorarioGeradoAula_ListResult_View: "HorarioGeradoAulaListResultView",
  HorarioGeradoAula_InputCreate_View: "HorarioGeradoAulaInputCreateView",
  HorarioGeradoAula_InputUpdate_View: "HorarioGeradoAulaInputUpdateView",
}
