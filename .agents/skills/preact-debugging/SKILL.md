---
name: preact-debugging
description: Debugging workflow for Preact rendering bugs, stale state, unnecessary re-renders, hook misuse, and Effect-related issues.
---

# Preact Debugging

## When to Use

- Troubleshooting incorrect UI, stale values, or race conditions
- Investigating unnecessary re-renders or state bugs
- Diagnosing hook dependency and Effect issues

## Setup and Tools

- Preact Devtools (or browser extension compatible with Preact)
- Browser Performance panel

## Workflow

1. Reproduce in the smallest possible component tree.
2. Confirm expected vs actual state transitions.
3. Inspect render frequency and identify unnecessary re-renders.
4. Check for needless state updates (setting equivalent values, duplicated derived state).
5. Audit hooks, especially `useEffect` dependencies.
6. Remove or rewrite non-essential Effects.
7. Verify fix with tests and user-facing flows.

## Common Preact Failure Modes

- Derived state stored redundantly, causing drift.
- Needlessly updating state, triggering avoidable re-renders.
- Parent re-renders cascading into children without need.
- Effect loops from unstable dependencies.
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

- Preact hooks: https://preactjs.com/guide/v10/hooks/
- Preact debugging docs: https://preactjs.com/guide/v10/differences-to-react
