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

## 2026-05-17

### Lesson 13: Control-repo automation scripts must be called from the control repo

- What happened:
  `image-shrink-zip-lab-day16` pushed successfully, but the first attempt to enable Pages and update repository About failed because `automation/scripts/*.ps1` was invoked from the standalone project directory instead of `daily-practical-sites`.
- Prevention rule:
  When running control-repo helper scripts such as `enable-pages.ps1`, `update-repo-about.ps1`, `create-github-repo.ps1`, and asset capture scripts, set the working directory to `C:\Users\luoyn\Desktop\aiproject\daily-practical-sites` or use absolute script paths. Do not assume those scripts exist inside the standalone project folder.

## 2026-05-18

### Lesson 14: Repeated card grids make projects feel low-value

- What happened:
  Multiple daily projects leaned on the same composition pattern: hero area followed by many rounded cards. Even when the tools worked, the UI felt generic, low-effort, and visually noisy because the layout was chosen from a component habit rather than the user's real task flow.
- Prevention rule:
  Before coding, run a Trellis-style product decomposition: user job, success outcome, input/output objects, states, primary path, error path, and information architecture. Do not default to card grids. Use cards only when the domain is inherently a gallery, catalog, kanban board, or comparison set. Prefer task-shaped layouts such as document editor, command palette, timeline, canvas, split pane, inspector, wizard, native utility, or meaningful three.js scene.

### Lesson 15: Completion is not usefulness

- What happened:
  `pdf-page-surgery-kit-day17` shipped with page-range input and a polished 3D-style preview, but it missed the must-have user gesture for an ordinary PDF cleanup tool: visual thumbnails with direct select, drag, delete, rotate, reorder, preview, and export. The project could be completed and published while still failing the real "who would use this today" test.
- Prevention rule:
  Before implementation, identify the one core user action that would make the product unacceptable if missing, then build and test that first. Do not use UI polish, reports, 3D visuals, dashboards, or explanations to compensate for a missing core capability. A project is not done until a non-technical user can complete the main workflow end to end in the shipped build.

## 2026-05-19

### Lesson 16: Control-repo scripts need an enforced working-directory wrapper

- What happened:
  During `server-migration-command-deck-day18`, the project push succeeded, but the first Pages enablement command was accidentally invoked from the standalone project folder. This repeated the same class of mistake already captured in Lesson 13 and produced a script-not-found error before being corrected from the control repo.
- Prevention rule:
  For every daily publish phase, run control helper scripts only from `C:\Users\luoyn\Desktop\aiproject\daily-practical-sites`, or call them by absolute path. Before invoking `automation/scripts/*.ps1`, explicitly check the current working directory and stop if it is not the control repo.

### Lesson 17: Vite project pages need an explicit GitHub Pages base path

- What happened:
  `server-migration-command-deck-day18` deployed successfully and returned HTTP 200, but the page could not actually open because Vite emitted asset URLs like `/assets/index.js`. On a GitHub Pages project site, those assets must be under `/server-migration-command-deck-day18/assets/...`.
- Prevention rule:
  Every Vite project deployed to a repository Pages URL must include `vite.config.ts` with `base: '/<repo-name>/'` before the first publish. Deployment verification must check that the rendered page loads its JS/CSS assets, not just that the HTML URL returns 200.
