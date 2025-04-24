import { setTypeSpecNamespace } from "@typespec/compiler"
import { $extension } from "@typespec/json-schema"

const namespace = "Ladesa.v3.Generics.Entities.Metadata";

export function $EntityId(context, target, entityId) {
  $extension(context, target, "x-ladesa-schema-kind", "entity")
  $extension(context, target, "x-ladesa-schema-entity-id", entityId.value)
  $extension(context, target, "additionalProperties", false)
}

export function $EntityPartialOfId(context, target, partialOf) {
  $extension(context, target, "x-ladesa-schema-entity-partial-of-id", partialOf.value)
}

setTypeSpecNamespace(namespace, $EntityId)
setTypeSpecNamespace(namespace, $EntityPartialOfId)
