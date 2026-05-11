# Quality Lessons

## 2026-04-22

### Lesson 1: Do not ship a project whose main promise is hollow

- What happened:
  `context-pack-studio-day4` looked polished, but its core value proposition leaned too heavily on an implied AI-capability layer that was not truly connected. The published site was more of a structured editor than the practical product it claimed to be.
- Prevention rule:
  If a project claims AI help, search, scraping, backend processing, or other intelligence, that capability must actually run in the shipped build. If the ideal integration is unavailable, ship an honest working fallback first.

### Lesson 2: Large content must not break layout stability

- What happened:
  `repo-handoff-radar-day5` initially allowed long code lines, long file paths, and noisy imported folders such as `node_modules` to create oversized cards and extremely long pages.
- Prevention rule:
  Stress-test pages with long strings, many rows, and noisy real-world data. Use wrapping, truncation, bounded panel heights, and internal scrolling. Ignore common generated-noise directories by default when that improves usability.

### Lesson 3: Daily automation must not look frozen because one chain is too long

- What happened:
  The daily builder combined web research, implementation, asset generation, repository publishing, Pages deployment, and control-repo updates into one long sequence. When any single step stalled, the whole run looked like it was hanging.
- Prevention rule:
  Work in explicit phases with checkpoints: research and dedupe first, then local build, then assets, then publishing, then control-repo updates. Use bounded waits for deployment checks and prefer resumable progress over one giant blocking chain.

## 2026-04-25

### Lesson 4: Node-consumed automation JSON must be written without BOM

- What happened:
  The demo capture plan for `ai-stack-reset-board-day8` was first written through a PowerShell path that inserted a UTF-8 BOM. The Node-based capture script parsed it as invalid JSON and silently blocked the asset phase.
- Prevention rule:
  Any JSON file that will be consumed by Node scripts during automation must be written in BOM-free UTF-8. Prefer explicit no-BOM writes instead of relying on shell defaults.

### Lesson 5: Frontend scaffolding commands should use a relative project folder from the parent directory

- What happened:
  `create-vite` was initially invoked with an absolute Windows path, which turned the path into a mangled folder name and created the scaffold in the wrong location.
- Prevention rule:
  When scaffolding a new frontend app, switch to the parent workspace directory first and pass only the relative project folder name to the generator.

## 2026-04-29

### Lesson 6: Local preview servers should be started with a directly executable command

- What happened:
  `download-cleanup-rename-studio-day11` first attempted to start Vite through a nested PowerShell command, but the server did not bind to the expected port, causing the screenshot capture step to get `ERR_CONNECTION_REFUSED`.
- Prevention rule:
  For Windows daily builds, start Vite preview/dev servers with `Start-Process -FilePath "npm.cmd"` and explicit `--host` plus `--port`, then probe the URL before running capture scripts.

### Lesson 7: Demo capture plans must match the automation script schema exactly

- What happened:
  The first demo plan used `"click": "#selector"`, while `capture-demo.mjs` expects `"click": { "selector": "#selector" }`, so Playwright failed before generating the GIF.
- Prevention rule:
  Validate demo plan JSON against the capture script contract before running the demo phase. For `capture-demo.mjs`, use object-shaped `click`, `fill`, `select`, `type`, `press`, and `hover` steps.

## 2026-04-30

### Lesson 8: Do not reuse the same AI-looking dashboard layout

- What happened:
  Multiple daily projects converged on the same visual formula: large top hero, metric cards, left filter sidebar, right content cards, heavy borders, grid background, and similar typography. Even when the functions worked, the repeated layout made the sites feel obviously AI-generated and visually tiring.
- Prevention rule:
  Before writing frontend code, define a concrete design direction, target user, layout strategy, component system, spacing scale, typography, color tokens, motion, and responsive behavior. Do not reuse the prior dashboard shell by default. Rotate visual languages across projects, such as editorial workspace, compact desktop utility, split-pane native app, command palette workflow, bento grid, timeline canvas, kanban board, document editor, or gallery-first layout.

### Lesson 9: Frontend work needs an explicit design pipeline

- What happened:
  The build process prioritized features first and visual polish second, so design choices became repetitive and generic.
- Prevention rule:
  Each new frontend project must include a short design pass before implementation: brand keywords, moodboard keywords, design tokens, layout strategy, component variants, interaction states, and accessibility checks. Use CSS variables or Tailwind tokens instead of ad hoc colors, keep an 8px spacing system, define focus-visible states, and verify mobile/desktop screenshots before publishing.

### Lesson 10: OCR search must tolerate fragmented CJK text

- What happened:
  `screenshot-ocr-index-studio-day13` could store OCR text such as `路 径 分 析`, but searching for `分析` returned no result because the matcher only used plain substring matching.
- Prevention rule:
  Any OCR, PDF, screenshot, or imported-text search must normalize text before matching. Use Unicode normalization, punctuation folding, whitespace compaction, and at least one real CJK OCR-style regression case before publishing.

## 2026-05-11

### Lesson 11: Backend helper scripts must be runtime-started, not only syntax-checked

- What happened:
  `tab-audio-translator-day14` initially used Python's removed `cgi` module for multipart parsing. `py_compile` passed on some assumptions would not be enough; the bridge failed at runtime on the current Python version before `/health` could respond.
- Prevention rule:
  For any backend or bridge service, run the server once and verify at least one real health endpoint before asset generation or publishing. Avoid deprecated or removed standard-library modules, and prefer small explicit parsers or maintained dependencies.

### Lesson 12: Media/AI bridges need a real sample round-trip

- What happened:
  `tab-audio-translator-day14` originally exposed an ASR command hook, but the real value only became clear after installing whisper.cpp, generating a WebM test clip, and verifying `/translate-chunk` returned recognized text.
- Prevention rule:
  For audio, OCR, video, or AI bridge features, test one realistic input file through the same endpoint the product uses. Document the exact local engine path and keep large models, binaries, and generated media out of Git.
