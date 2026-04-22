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
