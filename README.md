## Proof of concept for Telelport config generation

This chart relies on toYaml, fromYaml and mustMergeOverwrite to generate
Teleport configuration while allowing users to override specific values.

To run the chart, do `helm template .`

### How it works

- config is defined in a template
- the right template is chosen based on the `chartMode` value
- the template is rendered, then loaded as an object in memory
- the object is merged with the user-provided object from the `teleportConfig` value
- the result is rendered back to YAML

The biggest drawback is that Helm's YAML engine does not support
round-tripping, hence comments and value ordering are lost.
