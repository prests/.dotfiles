---
name: react-debugging
description: Debugging workflow for React rendering bugs, stale state, unnecessary re-renders, hook misuse, and Effect-related issues.
---

# React Debugging

## When to Use

- Troubleshooting incorrect UI, stale values, or race conditions
- Investigating unnecessary re-renders or state bugs
- Diagnosing hook dependency and Effect issues

## Setup and Tools

Use the following tools when debugging react related issues:

- **React DevTools**: (Components + Profiler)

## Workflow

1. Reproduce in the smallest possible component tree.
2. Confirm expected vs actual state transitions.
3. Inspect render frequency with React DevTools Profiler.
4. Check for unnecessary re-renders in components and children.
5. Check for needless state updates (setting equivalent values, duplicated derived state).
6. Audit hooks, especially `useEffect` and dependency arrays.
7. Remove or rewrite non-essential Effects.
8. Verify fix with tests and user-facing flows.

## Common React Failure Modes

- Derived state stored redundantly, causing drift.
- Needlessly updating state, triggering avoidable re-renders.
- Parent re-renders cascading into children without need.
- Effect loops from unstable dependencies.
- Event logic incorrectly moved into Effects.
- Stale closures from missing dependencies.
- Key misuse causing remount/reset bugs.

## Effect Triage

- Ask first: “Can this be done during render or in an event handler?”
- If yes, remove the Effect.
- If no, isolate external sync work and add deterministic cleanup.
- Escalate to `useLayoutEffect` only for unavoidable pre-paint measurement.

## Output

- Root cause summary (not just symptom fix).
- Minimal fix with simpler data flow and fewer Effects.
- Regression checks to prevent recurrence.

## References

- React docs (Lifecycle of Reactive Effects): https://react.dev/learn/lifecycle-of-reactive-effects
- Removing Effect Dependencies: https://react.dev/learn/removing-effect-dependencies
- React DevTools Profiler: https://react.dev/learn/react-developer-tools
