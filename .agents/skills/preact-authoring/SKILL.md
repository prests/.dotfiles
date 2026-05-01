---
name: preact-authoring
description: Formatting and authoring standards for Preact components, hooks, and JSX/TSX to keep code readable, simple, and maintainable.
---

# Preact Authoring

## When to Use

- Writing or editing Preact components and hooks
- Standardizing JSX/TSX structure and naming
- Improving readability and maintainability

## Authoring Standards

- One component, one responsibility.
- Keep render logic straightforward; extract helpers when needed.
- Prefer explicit props over broad “options” objects.
- Add type definitions for props.
- Keep hooks top-level, no conditional calls.
- Use semantic HTML first; add ARIA only when needed.
- Use custom hooks for shared logic.

## Simplicity & Testability Rules

- Prefer controlled inputs and predictable props.
- Avoid hidden side effects in render paths.
- Keep business logic outside JSX when it improves clarity.
- Pass dependencies via props/adapters for easier mocking.

## Hook Guidance

- Default to no Effect until proven necessary.
- Avoid `useLayoutEffect` in normal UI authoring.
- Prefer derived values in render and event-driven updates.
- Use memoization only for measured performance issues.

## Output

- Produce concise, readable Preact code aligned to project patterns.
- Keep component APIs narrow and intention-revealing.

## References

- Preact guide: https://preactjs.com/guide/v10/components/
- Preact hooks: https://preactjs.com/guide/v10/hooks/
- Accessibility (WAI-ARIA): https://www.w3.org/WAI/standards-guidelines/aria/
