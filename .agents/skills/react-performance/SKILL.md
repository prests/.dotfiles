---
name: react-performance
description: React performance optimization guidance focused on measurement-first improvements, render efficiency, and avoiding premature complexity.
---

# React Performance

## When to Use

- Investigating slow interactions or excessive re-renders
- Optimizing large lists, expensive renders, or data-heavy screens
- Reviewing memoization and client-side performance tradeoffs

## Principles

- Measure before optimizing.
- Prefer architectural fixes over blanket memoization.
- Keep state close to where it is used.
- Avoid Effects that trigger avoidable re-render cascades.

## Setup and Tools

Use the following tools when evaluating application performance:

- **Chrome DevTools Performance CLI**: (main-thread, layout/paint, long tasks)
- **Google Lighthouse CLI**: (perf audits + regressions)

## Optimization Workflow

1. Measure with React DevTools Profiler and browser Performance panel.
2. Identify hot paths (expensive renders, repeated mounts, heavy computations).
3. Apply minimal targeted fixes.
4. Re-measure to confirm impact.

## High-Impact Patterns

- Virtualize long lists (`react-window`, `react-virtualized`, TanStack Virtual).
- Split components to reduce re-render surface area.
- Use `memo`, `useMemo`, `useCallback` only when profiling proves value.
- Use transitions/deferred values for non-urgent UI updates.
- Prefer framework/server data loading to client Effect fetch waterfalls.

## Effect Guidance

- Remove Effects used for pure derivations.
- Keep synchronization Effects narrow and stable.
- Avoid `useLayoutEffect` unless unavoidable for layout correctness.

## Output

- Profiling-backed recommendations with expected impact.
- Simpler, measurable improvements over speculative tuning.

## References

- React docs (Render and Commit): https://react.dev/learn/render-and-commit
- React docs (Profiler): https://react.dev/learn/react-developer-tools
- React docs (useMemo): https://react.dev/reference/react/useMemo
- React docs (useCallback): https://react.dev/reference/react/useCallback
- Web.dev (Virtualize large lists with react-window): https://web.dev/articles/virtualize-long-lists-react-window
