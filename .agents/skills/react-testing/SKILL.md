---
name: react-testing
description: Testing strategy for React components emphasizing behavior, accessibility, and maintainable tests with minimal mocking.
---

# React Testing

## When to Use

- Adding or updating tests for React UI
- Designing testable component boundaries
- Preventing regressions in behavior and accessibility

## Testing Priorities

- Test user-visible behavior, not implementation details.
- Prefer Testing Library queries by role/label/text.
- Keep tests deterministic and focused on one behavior.
- Cover loading, success, empty, and error states.

## Testability Design Rules

- Keep components small and side-effect-light.
- Inject dependencies (data loaders/actions) through props or adapters.
- Minimize Effects to reduce async/flaky tests.
- Avoid `useLayoutEffect`-dependent behavior in test-critical paths.

## Recommended Stack

- Unit/integration: `@testing-library/react` + `@testing-library/user-event`.
- Assertions: `@testing-library/jest-dom`.
- E2E: Playwright or Cypress.
- Accessibility: axe (`jest-axe` / `axe-core`) plus manual keyboard checks.

## Output

- Behavior-first tests that are resilient to refactors.
- Clear coverage for state variants and accessibility basics.

## References

- Testing Library guiding principles: https://testing-library.com/docs/guiding-principles
- React docs (Testing): https://react.dev/learn/testing
- jest-dom: https://github.com/testing-library/jest-dom
- Playwright testing: https://playwright.dev/docs/test-intro
