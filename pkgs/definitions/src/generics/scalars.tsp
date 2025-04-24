using TypeSpec.JsonSchema;

@baseUri("ladesa://schemas/v3/generics")
namespace Ladesa.v3.Generics;

/**
 * Identificador Único Universal.
 */
@format("uuid")
scalar id_uuid extends string;

/**
 * Identificador numérico.
 */
@minValue(1)
scalar id_integer extends integer;

/**
 * Date time ISO 8601.
 */
@format("date-time")
scalar date_time extends string;

/**
 * Date ISO 8601.
 */
@format("date")
scalar date extends string;

/**
 * Time ISO 8601.
 */
@format("time")
scalar time extends string;
