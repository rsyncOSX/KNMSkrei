# KNM Skrei restoration documentation

English-language documentation of the Norwegian engine department restoration project for RNoN Skrei (KNM Skrei).

## Build and preview

Install Hugo Extended 0.169.0 (minimum 0.164.0), Go and Node.js 22 or later. Then run:

```sh
npm ci
npm run build
npm run serve
```

The npm scripts put the local Dart Sass compiler on PATH. The production output is `public/`; the local preview is at http://localhost:1313/.

Set `baseURL` in `hugo.yaml` to the confirmed public website URL before publishing. It currently uses `/` for local development. Netlify preview builds use the deployment URL. No public domain or source repository URL has been assumed.

## Add documentation

English content lives in `content/en/`. The `docs/project/` and `docs/history/` sections are intentionally placeholders. Add dated Markdown pages under `docs/project/` as work proceeds, with a title, date, description and source photographs or references. Record observations separately from proposed work and completed work.

## Photographs

Original supplied images remain in `static/start/`, excluded from the published static mount. Optimized JPEGs (maximum 1,600 pixels) and thumbnails (maximum 640 pixels) are in `static/images/skrei/`. These were created using macOS `sips`, with JPEG quality 78 and 75 respectively. Do not overwrite original photographs. Add confirmed dates, component names and photographer credits when available.

## Theme and dependencies

Docsy is pinned to v0.18.1 in `go.mod`. To refresh the theme’s npm dependency manifest after a deliberate theme update, run `hugo mod npm pack`, then `npm install`. Commit the resulting lockfile along with dependency changes.

The inherited Apache-2.0 license is retained for the starter code. Confirm publication permissions and credits for photographs and contributed documents before adding licensing statements for those materials.
