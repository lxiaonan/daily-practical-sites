# Daily Practical Sites

This repository is the control center for a daily automation that creates one practical website per day.

## What lives here

- `projects/`: one folder per published project using the `<project-slug>-dayN` format.
- `automation/scripts/`: reusable GitHub, capture, and ledger scripts.
- `automation/templates/`: reusable bilingual README, `agents.md`, and demo plan templates.
- `history/projects.json`: the deduplicated ledger of everything that has already been built.
- `automation/scripts/get-github-token.ps1`: retrieves the cached GitHub token from Git Credential Manager.
- `automation/scripts/create-github-repo.ps1`: creates a new repository under the authenticated GitHub account.
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

1. Research the web for a useful site idea.
2. Check `history/projects.json` to avoid repeating a topic.
3. Build the site in its own standalone local repository.
4. Generate a screenshot and a short demo GIF.
5. Create the matching GitHub repository.
6. Push the project and deploy it with GitHub Pages when applicable.
7. Record the result in `history/projects.json`.

## Conventions

- One day, one project.
- Every project gets its own GitHub repository.
- Every project folder and repository should follow the `<project-slug>-dayN` naming format.
- Every standalone project must include a bilingual `README.md` with clear Chinese and English sections.
- Every standalone project must include a visible in-product language toggle so users can switch between Chinese and English directly in the UI.
- Every standalone project must include an `agents.md` file describing the project context, structure, and collaboration notes for future agents.
- Every standalone project must include `docs/screenshot.png` and `docs/demo.gif`.
- Every standalone project should reference its screenshot and GIF directly inside `README.md`.
- Projects should stay diverse across topic, audience, and implementation style rather than repeating the same type of calculator or dashboard.
- Frontend can use Vue 3, React, or vanilla JavaScript depending on fit.
- Backend can use Python or Java when a backend meaningfully improves the product.
- Every project must include at least one clearly stated innovation or differentiator in its README.
- New projects should default to product-level complexity rather than single-page toy tools.
- Avoid bare calculators, simple converters, and thin landing-page-style demos unless they are only one part of a broader workflow.
- Prefer projects with at least 3 meaningful user interactions or modules, such as data entry, history, comparison, export, persistence, AI assistance, collaboration, visualization, or workflow automation.
- Prefer multi-step experiences that solve a real task end to end, not just one isolated calculation.
- At least every few days, rotate into a fuller stack combination such as `React + Python`, `Vue 3 + Java`, or another more substantial architecture.
- This repository only stores automation assets and the public index.

## Latest Projects

- 2026-04-22: [apartment-hunt-studio-day3](https://github.com/lxiaonan/apartment-hunt-studio-day3)
  GitHub Pages: [https://lxiaonan.github.io/apartment-hunt-studio-day3/](https://lxiaonan.github.io/apartment-hunt-studio-day3/)
- 2026-04-21: [web-research-workbench-day2](https://github.com/lxiaonan/web-research-workbench-day2)
  GitHub Pages: [https://lxiaonan.github.io/web-research-workbench-day2/](https://lxiaonan.github.io/web-research-workbench-day2/)
- 2026-04-21: [freelance-rate-calculator-cn-day1](https://github.com/lxiaonan/freelance-rate-calculator-cn-day1)
  GitHub Pages: [https://lxiaonan.github.io/freelance-rate-calculator-cn-day1/](https://lxiaonan.github.io/freelance-rate-calculator-cn-day1/)
