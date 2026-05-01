---
name: react-core
description: Core React architecture and state modeling guidance for simple, composable, testable components with minimal Effects.
---

# React Core

## When to Use

- Designing or refactoring React component architecture
- Choosing state ownership and data flow patterns
- Replacing unnecessary `useEffect` / `useLayoutEffect`
- Improving component simplicity and testability

## Core Principles

- Keep components pure: same props/state in, same UI out.
- Prefer composition over prop-heavy “config components.”
- Keep state as local as possible, lift only when needed.
- Derive values during render instead of storing duplicate state.
- Prefer event handlers and framework data APIs over Effects.

## Effect Minimization Rules

- Treat `useEffect` as an escape hatch for external systems only (network sync, subscriptions, imperative browser APIs).
- Avoid `useLayoutEffect` unless layout measurement must happen before paint.
- Never use Effects for:
  - deriving render data
  - handling user events
  - resetting state that can be keyed
- If an Effect is required, keep dependencies complete and cleanup explicit.

## State & Data Flow

- UI state: `useState` (or `useReducer` for complex transitions).
- Server state: use framework loaders or query libraries instead of ad-hoc Effects.
- Shared state: lift to nearest common parent before introducing Context.
- Context: use for low-churn global concerns (theme, auth/session shape, locale).

## Output

- Recommend the simplest architecture with clear ownership boundaries.
- Flag and replace unnecessary Effects.
- Provide a component split that improves readability and testability.

## References

- React docs: https://react.dev/learn
- You Might Not Need an Effect: https://react.dev/learn/you-might-not-need-an-effect
- Synchronizing with Effects: https://react.dev/learn/synchronizing-with-effects
- Managing State: https://react.dev/learn/managing-state
