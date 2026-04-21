# Daily Practical Sites

This repository is the control center for a daily automation that creates one practical website per day.

## What lives here

- `history/projects.json`: the deduplicated ledger of everything that has already been built.
- `scripts/get-github-token.ps1`: retrieves the cached GitHub token from Git Credential Manager.
- `scripts/create-github-repo.ps1`: creates a new repository under the authenticated GitHub account.

## Workflow

1. Research the web for a useful site idea.
2. Check `history/projects.json` to avoid repeating a topic.
3. Build the site in its own standalone local repository.
4. Create the matching GitHub repository.
5. Push the project and deploy it with GitHub Pages when applicable.
6. Record the result in `history/projects.json`.

## Conventions

- One day, one project.
- Every project gets its own GitHub repository.
- Every standalone project must include a bilingual `README.md` with clear Chinese and English sections.
- Every standalone project must include an `agents.md` file describing the project context, structure, and collaboration notes for future agents.
- This repository only stores automation assets and the public index.

## Latest Project

- 2026-04-21: [freelance-rate-calculator-cn](https://github.com/lxiaonan/freelance-rate-calculator-cn)
  GitHub Pages: [https://lxiaonan.github.io/freelance-rate-calculator-cn/](https://lxiaonan.github.io/freelance-rate-calculator-cn/)
