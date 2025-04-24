import "@typespec/json-schema";

import "./schemas/index.tsp";
import "./generics/index.tsp";

using TypeSpec.JsonSchema;

@jsonSchema
@baseUri("ladesa://schemas/v3/")
namespace Ladesa.v3.Schemas;
