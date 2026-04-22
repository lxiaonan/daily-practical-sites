# Project Standard

## Baseline

- Build a small but real product, not a one-screen toy.
- The project should feel useful enough that someone could actually bookmark it and come back.
- The interaction model should go beyond a single calculation or form submit.
- The product should not feel too simple. Add enough depth that it feels like a real workflow tool, not a throwaway page.
- Research project inspiration on the same day the build starts. Do not pre-book, pre-reserve, or reuse an idea queue.
- Start inspiration research from current community demand signals on `https://linux.do/` and `https://juejin.cn/`, then expand to other current web sources if needed.
- Be able to explain which same-day demand signal led to the project choice.

## Minimum Complexity

- Include at least 3 meaningful modules or flows.
- At least 1 flow should have multiple steps or state transitions.
- Include enough interaction density that users can do more than type once and read one result.
- Include at least 1 of the following:
  - local persistence
  - file import or export
  - structured history
  - comparison mode
  - AI-assisted feature
  - data visualization
  - shareable output
  - backend-powered processing

## Preferred Stack Direction

- Rotate between `React`, `Vue 3`, and strong vanilla builds on the frontend.
- Use `Python` or `Java` when backend logic materially improves the product.
- Avoid repeating the same architecture too often.

## Anti-Patterns

- Do not ship another simple calculator as the main idea.
- Do not ship a thin CRUD shell without a clearly useful workflow.
- Do not ship a pretty landing page pretending to be a product.
- Do not imply AI, search, scraping, automation, or intelligence that is not actually connected and usable.
- Do not make the main value proposition depend on a missing API key, missing backend, or future integration.

## Quality Bar

- Include bilingual documentation.
- Include a visible Chinese and English language toggle inside the product UI itself.
- Include `agents.md`.
- Include a screenshot and a demo GIF.
- State the innovation clearly in the README.
- Record the inspiration sources in the README so the project has a clear “why now” trail.
- Push the visual quality beyond a plain utility page. Use deliberate layout, color, typography, spacing, and motion so the product feels polished and a bit cool.
- If the ideal version needs models or external services, ship an honest working fallback in the published build first.
- README must explicitly document the real implementation path and any fallback behavior so users know the product is genuinely usable.
- Stress-test the layout with long content, many rows, long paths, and dense results. Panels should contain overflow gracefully instead of stretching the entire page into an unreadable wall.
- If the product analyzes repositories, files, logs, or other noisy sources, ignore common generated directories and machine output by default whenever that improves usability.
