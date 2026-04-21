# Daily Practical Sites

This repository is the control center for a daily automation that creates one practical website per day.

## What lives here

- `history/projects.json`: the deduplicated ledger of everything that has already been built.
- `scripts/get-github-token.ps1`: retrieves the cached GitHub token from Git Credential Manager.
- `scripts/create-github-repo.ps1`: creates a new repository under the authenticated GitHub account.
- `scripts/capture-preview.mjs`: generates a screenshot for a project preview.
- `scripts/capture-demo.mjs`: runs a step-based Playwright demo flow and captures frames.
- `scripts/make-gif.py`: turns captured frames into an animated GIF.

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
- Every standalone project must include an `agents.md` file describing the project context, structure, and collaboration notes for future agents.
- Every standalone project must include `docs/screenshot.png` and `docs/demo.gif`.
- Every standalone project should reference its screenshot and GIF directly inside `README.md`.
- Projects should stay diverse across topic, audience, and implementation style rather than repeating the same type of calculator or dashboard.
- Frontend can use Vue 3, React, or vanilla JavaScript depending on fit.
- Backend can use Python or Java when a backend meaningfully improves the product.
- Every project must include at least one clearly stated innovation or differentiator in its README.
- This repository only stores automation assets and the public index.

## Latest Project

- 2026-04-21: [freelance-rate-calculator-cn-day1](https://github.com/lxiaonan/freelance-rate-calculator-cn-day1)
  GitHub Pages: [https://lxiaonan.github.io/freelance-rate-calculator-cn-day1/](https://lxiaonan.github.io/freelance-rate-calculator-cn-day1/)
