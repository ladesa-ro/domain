using Ladesa.Domain.v4.Generics;
using Ladesa.Domain.v4.Generics.Entities;

namespace Ladesa.Domain.v4.Schemas;

/**
 * Visão completa de um arquivo.
 */
@Metadata.EntityId(Tokens.Arquivo_View)
model ArquivoView {
  ...Arquivo;
}

/**
 * Dados de entrada para encontrar um arquivo por id.
 */
@Metadata.EntityId(Tokens.Arquivo_FindOneInput_View)
model ArquivoFindOneInputView {
  ...PickProperties<Arquivo, "id">;
}

/**
 * Dados de saída para encontrar um arquivo por id.
 */
@Metadata.EntityId(Tokens.Arquivo_FindOneResult_View)
@Metadata.EntityPartialOfId(Tokens.Arquivo_View)
model ArquivoFindOneResultView {
  ...PickProperties<ArquivoView, "id">;

  //

  ...PickProperties<
    ArquivoView,
    "name" | "mimeType" | "sizeBytes" | "storageType"
  >;

  //

  ...PickProperties<ArquivoView, "dateCreated" | "dateUpdated" | "dateDeleted">;
}
