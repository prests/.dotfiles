---
name: react-authoring
description: Formatting and authoring standards for React components, hooks, and JSX/TSX to keep code readable, simple, and maintainable.
---

# React Authoring

## When to Use

- Writing or editing React components and hooks
- Standardizing JSX/TSX structure and naming
- Improving readability and maintainability

## Authoring Standards

- One component, one responsibility.
- Keep render logic straightforward; extract small helpers when needed.
- Prefer explicit props over broad “options” objects.
- Add type defintions for props.
- Keep hooks at top-level, no conditional calls.
- Use semantic HTML first; add ARIA only when needed.
- Use custom hooks for shared react logic.

## Simplicity & Testability Rules

- Prefer controlled inputs and predictable props.
- Avoid hidden side effects in render paths.
- Keep business logic outside JSX when it improves clarity.
- Pass dependencies in via props for easier mocking/testing.
- Custom react hooks must be easily testable with proper dependency injection.

## Hook Guidance

- Default to no Effect until proven necessary.
- Avoid `useLayoutEffect` in normal UI authoring.
- Prefer:
  - derived values in render
  - event-driven updates
  - memoization only for measured performance issues

## Output

- Produce concise, readable React code aligned to project patterns.
- Keep component APIs narrow and intention-revealing.

## References

- React docs (Writing Markup with JSX): https://react.dev/learn/writing-markup-with-jsx
- Keeping Components Pure: https://react.dev/learn/keeping-components-pure
- Conditional Rendering: https://react.dev/learn/conditional-rendering
- Rendering Lists: https://react.dev/learn/rendering-lists
