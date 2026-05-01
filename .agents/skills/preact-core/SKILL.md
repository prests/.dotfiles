---
name: preact-core
description: Core Preact architecture and state modeling guidance for simple, composable, testable components with minimal Effects.
---

# Preact Core

## When to Use

- Designing or refactoring Preact component architecture
- Choosing state ownership and data flow patterns
- Replacing unnecessary `useEffect` / `useLayoutEffect`
- Improving component simplicity and testability

## Core Principles

- Keep components pure: same props/state in, same UI out.
- Prefer composition over prop-heavy “config components.”
- Keep state as local as possible, lift only when needed.
- Derive values during render instead of storing duplicate state.
- Prefer event handlers and data-layer APIs over Effects.

## Effect Minimization Rules

- Treat `useEffect` as an escape hatch for external systems only.
- Avoid `useLayoutEffect` unless layout measurement must happen before paint.
- Never use Effects for deriving render data, handling user events, or resetting keyed state.
- If an Effect is required, keep dependencies complete and cleanup explicit.

## State & Data Flow

- UI state: `useState` / `useReducer`.
- Server state: use framework loaders or query libraries, not ad-hoc fetch Effects in leaf UI.
- Shared state: lift to nearest common parent before introducing Context/store.
- Context/store: use for low-churn global concerns.

## Output

- Recommend the simplest architecture with clear ownership boundaries.
- Flag and replace unnecessary Effects.
- Provide a component split that improves readability and testability.

## References

- Preact docs: https://preactjs.com/guide/v10/getting-started
- Preact Hooks: https://preactjs.com/guide/v10/hooks/
- Preact Signals: https://preactjs.com/guide/v10/signals
