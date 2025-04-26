using Ladesa.Domain.v3.Generics;
using Ladesa.Domain.v3.Generics.Entities;

namespace Ladesa.Domain.v3.Schemas;

/** DiarioProfessor. */
@Metadata.EntityId(Tokens.DiarioProfessor)
model DiarioProfessor {
  ...EntityIdUuid;

  /** Situação do vínculo. */
  situacao: boolean;

  /** Perfil do usuário ao campus. */
  perfil: Perfil;

  /** Diário vinculado. */
  diario: Diario;

  ...EntityDated;
}

/** Visão completa de um DiarioProfessor. */
@Metadata.EntityId(Tokens.DiarioProfessor_View)
model DiarioProfessorView {
  ...OmitProperties<DiarioProfessor, "perfil" | "diario">;
  perfil: PerfilFindOneResultView;
  diario: DiarioFindOneResultView;
}

/** Dados de entrada para encontrar um DiarioProfessor por ID. */
@Metadata.EntityId(Tokens.DiarioProfessor_FindOneInput_View)
model DiarioProfessorFindOneInputView {
  @Metadata.Constraints.EntityExists(Tokens.DiarioProfessor)
  id: DiarioProfessor.id;
}

/** Visão FindOne de um DiarioProfessor. */
@Metadata.EntityId(Tokens.DiarioProfessor_FindOneResult_View)
@Metadata.EntityPartialOfId(Tokens.DiarioProfessor_View)
model DiarioProfessorFindOneResultView {
  ...PickProperties<DiarioProfessorView, "id">;
  ...PickProperties<DiarioProfessorView, "situacao">;
  ...PickProperties<DiarioProfessorView, "perfil" | "diario">;
  ...PickProperties<
    DiarioProfessorView,
    "dateCreated" | "dateUpdated" | "dateDeleted"
  >;
}

/** Dados de entrada para a criação de um DiarioProfessor. */
@Metadata.EntityId(Tokens.DiarioProfessor_InputCreate_View)
model DiarioProfessorInputCreateView {
  situacao: boolean;
  perfil: PerfilFindOneInputView;
  diario: DiarioFindOneInputView;
}

/** Dados de entrada para a atualização de um DiarioProfessor. */
@Metadata.EntityId(Tokens.DiarioProfessor_InputUpdate_View)
model DiarioProfessorInputUpdateView
  is OptionalProperties<DiarioProfessorInputCreateView>;

/** Resultados da busca a DiarioProfessor. */
@Metadata.EntityId(Tokens.DiarioProfessor_ListResult_View)
model DiarioProfessorListResultView
  is Pagination.Result.View<DiarioProfessorFindOneResultView>;
