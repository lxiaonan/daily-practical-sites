# Daily Practical Sites

This repository is the control center for a daily automation that creates one practical website per day.

## What lives here

- `projects/`: one folder per published project using the `<project-slug>-dayN` format.
- `automation/scripts/`: reusable GitHub, capture, and ledger scripts.
- `automation/templates/`: reusable bilingual README, `agents.md`, and demo plan templates.
- `history/projects.json`: the deduplicated ledger of everything that has already been built.
- `history/quality-lessons.md`: the running log of real mistakes, regressions, and the rules added to prevent repeats.
- `automation/scripts/get-github-token.ps1`: retrieves the cached GitHub token from Git Credential Manager.
- `automation/scripts/create-github-repo.ps1`: creates a new repository under the authenticated GitHub account.
- `automation/scripts/update-repo-about.ps1`: updates the GitHub repository About description and homepage link, including the public Pages URL.
- `automation/scripts/capture-preview.mjs`: generates a screenshot for a project preview.
- `automation/scripts/capture-demo.mjs`: runs a step-based Playwright demo flow and captures frames.
- `automation/scripts/make-gif.py`: turns captured frames into an animated GIF.

## Structure

```text
daily-practical-sites/
├─ projects/
│  └─ freelance-rate-calculator-cn-day1/
├─ automation/
│  ├─ scripts/
│  └─ templates/
├─ history/
├─ README.md
├─ package.json
└─ package-lock.json
```

## Workflow

1. Research the web for a useful site idea on the same day the project is built.
2. Check `history/projects.json` to avoid repeating a topic.
3. Build the site in its own standalone local repository.
4. Generate a screenshot and a short demo GIF.
5. Create the matching GitHub repository.
6. Push the project and deploy it with GitHub Pages when applicable.
7. Put the GitHub Pages URL into the repository About homepage field so visitors can open the project directly.
8. Record the result in `history/projects.json`.
9. If a meaningful mistake, regression, or quality failure happened during the build, append it to `history/quality-lessons.md` with the concrete prevention rule.

## Conventions

- One day, one primary shipped project. If a same-day remake is needed, the stronger rebuild becomes the recommended entry and earlier attempts can remain archived as superseded work.
- Every project gets its own GitHub repository.
- Every project folder and repository should follow the `<project-slug>-dayN` naming format.
- Projects must not feel too simple. Default to product-level depth rather than a tiny one-screen utility.
- Every standalone project must include a bilingual `README.md` with clear Chinese and English sections.
- Every standalone project must include a detailed bilingual beginner guide, preferably at `docs/BEGINNER-GUIDE.md`, with step-by-step instructions for non-technical users.
- Every standalone project must include a visible in-product language toggle so users can switch between Chinese and English directly in the UI.
- Every standalone project must include an `agents.md` file describing the project context, structure, and collaboration notes for future agents.
- Every standalone project must include `docs/screenshot.png` and `docs/demo.gif`.
- Every standalone project should reference its screenshot and GIF directly inside `README.md`.
- Every standalone project should include rich interaction, with multiple meaningful controls, state changes, and at least one multi-step workflow.
- The visual design should be intentional and polished, not plain. Aim for attractive layouts, stronger styling, and a slightly bold or cool product feel.
- Layouts must remain stable with large datasets, long file paths, long unbroken strings, and many cards. Use wrapping, truncation, internal scrolling, and bounded panel heights instead of letting the whole page explode vertically or horizontally.
- Tools that analyze files, logs, code, or records should ignore common generated-noise directories and outputs by default when that improves signal, such as `node_modules`, `dist`, `build`, and similar folders.
- Do not fake core capabilities. If a project claims AI help, search, scraping, file processing, or backend intelligence, that capability must actually run in the shipped build.
- If the ideal implementation depends on unavailable APIs, model keys, paid services, or fragile infrastructure, build a working fallback first, such as deterministic local processing, real web search, import-based workflows, or another honest substitute.
- Never ship a page whose main promise is not actually usable on the published site.
- README must clearly state what is truly implemented, what fallback is used, and what optional upgrades could be added later.
- Significant mistakes discovered during development must be written into `history/quality-lessons.md` together with the concrete rule or safeguard added to prevent a repeat.
- Long daily runs must be staged. Prefer explicit phase checkpoints such as research, build, asset generation, publish, and index update instead of one opaque blocking sequence.
- Projects should stay diverse across topic, audience, and implementation style rather than repeating the same type of calculator or dashboard.
- Same-day inspiration research is mandatory for every project. Do not pre-book, pre-reserve, or pull from a queued backlog of ideas.
- Inspiration research must start from current real-world demand signals, with `https://linux.do/` and `https://juejin.cn/` treated as default required sources unless they are temporarily unavailable.
- Each new project should be traceable to fresh community needs, complaints, requests, or repeated workflows discovered that day across the web.
- Frontend can use Vue 3, React, or vanilla JavaScript depending on fit.
- Future frontend projects should use `three.js` when it adds meaningful interaction or visualization, such as 3D previews, spatial comparison, file structure maps, data objects, or interactive explainers. Do not use it as empty decoration.
- Backend can use Python or Java when a backend meaningfully improves the product.
- Every project must include at least one clearly stated innovation or differentiator in its README.
- New projects should default to product-level complexity rather than single-page toy tools.
- Avoid bare calculators, simple converters, and thin landing-page-style demos unless they are only one part of a broader workflow.
- Prefer projects with at least 3 meaningful user interactions or modules, such as data entry, history, comparison, export, persistence, AI assistance, collaboration, visualization, or workflow automation.
- Prefer multi-step experiences that solve a real task end to end, not just one isolated calculation.
- Prefer interfaces with stronger visual personality, layered composition, and interaction feedback instead of plain form-plus-result layouts.
- Do not default to pages made from many repeated cards. A card grid is allowed only when the product is inherently a gallery, catalog, kanban board, or comparison set. Otherwise, design from the user's task flow first.
- Before implementation, use a Trellis-style product decomposition: define the concrete user job, success outcome, input/output objects, state transitions, primary path, error path, and why the chosen information architecture fits. Then choose UI structure such as document editor, canvas, timeline, wizard, command palette, split pane, inspector, native utility, or 3D scene.
- Each new project must explicitly state the non-card layout strategy before coding. If the planned layout is still “hero plus many cards,” stop and redesign unless the domain truly requires cards.
- Before writing frontend code, run an explicit design pass: define audience, moodboard keywords, design tokens, layout strategy, component variants, interaction states, and accessibility checks.
- Do not reuse the same daily-project dashboard shell repeatedly. Rotate visual languages and information architecture so new projects do not look obviously AI-generated.
- Use CSS variables or Tailwind tokens for color, spacing, radius, shadows, and motion. Avoid ad hoc hardcoded styling.
- Follow an 8px spacing rhythm, consistent type scale, focus-visible states, responsive breakpoints, and WCAG AA contrast as baseline frontend quality requirements.
- At least every few days, rotate into a fuller stack combination such as `React + Python`, `Vue 3 + Java`, or another more substantial architecture.
- This repository only stores automation assets and the public index.

## Latest Projects

- 2026-05-18: [pdf-page-surgery-kit-day17](https://github.com/lxiaonan/pdf-page-surgery-kit-day17)
  GitHub Pages: [https://lxiaonan.github.io/pdf-page-surgery-kit-day17/](https://lxiaonan.github.io/pdf-page-surgery-kit-day17/)
- 2026-05-17: [image-shrink-zip-lab-day16](https://github.com/lxiaonan/image-shrink-zip-lab-day16)
  GitHub Pages: [https://lxiaonan.github.io/image-shrink-zip-lab-day16/](https://lxiaonan.github.io/image-shrink-zip-lab-day16/)
- 2026-05-16: [ai-frontend-design-guard-studio-day15](https://github.com/lxiaonan/ai-frontend-design-guard-studio-day15)
  GitHub Pages: [https://lxiaonan.github.io/ai-frontend-design-guard-studio-day15/](https://lxiaonan.github.io/ai-frontend-design-guard-studio-day15/)
- 2026-05-11: [tab-audio-translator-day14](https://github.com/lxiaonan/tab-audio-translator-day14)
  GitHub Pages: [https://lxiaonan.github.io/tab-audio-translator-day14/](https://lxiaonan.github.io/tab-audio-translator-day14/)
- 2026-04-30: [screenshot-ocr-index-studio-day13](https://github.com/lxiaonan/screenshot-ocr-index-studio-day13)
  GitHub Pages: [https://lxiaonan.github.io/screenshot-ocr-index-studio-day13/](https://lxiaonan.github.io/screenshot-ocr-index-studio-day13/)
- 2026-04-29: [c-drive-safety-cleaner-day12](https://github.com/lxiaonan/c-drive-safety-cleaner-day12)
  GitHub Pages: [https://lxiaonan.github.io/c-drive-safety-cleaner-day12/](https://lxiaonan.github.io/c-drive-safety-cleaner-day12/)
- 2026-04-29: [download-cleanup-rename-studio-day11](https://github.com/lxiaonan/download-cleanup-rename-studio-day11)
  GitHub Pages: [https://lxiaonan.github.io/download-cleanup-rename-studio-day11/](https://lxiaonan.github.io/download-cleanup-rename-studio-day11/)
- 2026-04-27: [visual-bug-packet-studio-day10](https://github.com/lxiaonan/visual-bug-packet-studio-day10)
  GitHub Pages: [https://lxiaonan.github.io/visual-bug-packet-studio-day10/](https://lxiaonan.github.io/visual-bug-packet-studio-day10/)
- 2026-04-26: [knowledge-revival-studio-day9](https://github.com/lxiaonan/knowledge-revival-studio-day9)
  GitHub Pages: [https://lxiaonan.github.io/knowledge-revival-studio-day9/](https://lxiaonan.github.io/knowledge-revival-studio-day9/)
- 2026-04-25: [ai-stack-reset-board-day8](https://github.com/lxiaonan/ai-stack-reset-board-day8)
  GitHub Pages: [https://lxiaonan.github.io/ai-stack-reset-board-day8/](https://lxiaonan.github.io/ai-stack-reset-board-day8/)
- 2026-04-24: [disk-sweep-command-center-day7](https://github.com/lxiaonan/disk-sweep-command-center-day7)
  GitHub Pages: [https://lxiaonan.github.io/disk-sweep-command-center-day7/](https://lxiaonan.github.io/disk-sweep-command-center-day7/)
- 2026-04-23: [meeting-execution-board-day6](https://github.com/lxiaonan/meeting-execution-board-day6)
  GitHub Pages: [https://lxiaonan.github.io/meeting-execution-board-day6/](https://lxiaonan.github.io/meeting-execution-board-day6/)
- 2026-04-22: [repo-handoff-radar-day5](https://github.com/lxiaonan/repo-handoff-radar-day5)
  GitHub Pages: [https://lxiaonan.github.io/repo-handoff-radar-day5/](https://lxiaonan.github.io/repo-handoff-radar-day5/)
- 2026-04-22: [context-pack-studio-day4](https://github.com/lxiaonan/context-pack-studio-day4)
  Status: superseded by the stronger same-day rebuild
  GitHub Pages: [https://lxiaonan.github.io/context-pack-studio-day4/](https://lxiaonan.github.io/context-pack-studio-day4/)
- 2026-04-22: [apartment-hunt-studio-day3](https://github.com/lxiaonan/apartment-hunt-studio-day3)
  Status: superseded by the stronger same-day rebuild
  GitHub Pages: [https://lxiaonan.github.io/apartment-hunt-studio-day3/](https://lxiaonan.github.io/apartment-hunt-studio-day3/)
- 2026-04-21: [web-research-workbench-day2](https://github.com/lxiaonan/web-research-workbench-day2)
  GitHub Pages: [https://lxiaonan.github.io/web-research-workbench-day2/](https://lxiaonan.github.io/web-research-workbench-day2/)
- 2026-04-21: [freelance-rate-calculator-cn-day1](https://github.com/lxiaonan/freelance-rate-calculator-cn-day1)
  GitHub Pages: [https://lxiaonan.github.io/freelance-rate-calculator-cn-day1/](https://lxiaonan.github.io/freelance-rate-calculator-cn-day1/)

