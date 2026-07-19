# Third-party specs

OpenAPI 3.x specs from the web, kept as a regression corpus — they
surface the edge cases the synthetic fixtures one level up miss.
`gen_tests.yaml` is the manifest; run them with
`dart run tool/gen_tests.dart` from the package root.

**Copyrights belong to their respective rights holders.** Nothing here
is authored by this project, and none of it ships in the published
package (see `.pubignore`).

* `spacetraders.json` from spacetraders.io
* `petstore.json` from https://petstore3.swagger.io/
* `train-travel.yaml` from
  https://github.com/bump-sh-examples/train-travel-api
* `backstage.yaml` — catalog API from
  https://github.com/backstage/backstage/blob/master/plugins/catalog-backend/src/schema/openapi.yaml
  (exercises `additionalProperties` / `JsonObject` / `allOf`-with-open-member)
* `api.github.com.json` from https://github.com/github/rest-api-description
* `discord.json` from https://github.com/discord/discord-api-spec

Because this is all third-party text, the directory is excluded from the
spell checker — see `ignorePaths` in the root `cspell.config.yaml`. Its
vocabulary runs to roughly 600 words (API terms, place names, base64
fixture data) which would otherwise have to enter the project
dictionary, weakening the check on hand-written code.

A generator change can rewrite thousands of lines across these packages.
That churn is expected: CI regenerates everything and fails on any diff,
so a change that alters output must be committed with the regenerated
fixtures.
