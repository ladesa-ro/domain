import "@typespec/json-schema";

import "./schemas/index.tsp";
import "./generics/index.tsp";

using TypeSpec.JsonSchema;

@jsonSchema
@baseUri("ladesa://domain/v4/")
namespace Ladesa.Domain.v4.Schemas;
