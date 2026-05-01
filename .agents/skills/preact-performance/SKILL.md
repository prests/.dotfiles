---
name: preact-performance
description: Preact performance optimization guidance focused on measurement-first improvements, render efficiency, and avoiding premature complexity.
---

# Preact Performance

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

- Browser Performance panel (main thread, layout/paint, long tasks)
- Lighthouse CLI (perf audits + regressions)
- Preact Devtools for component-level inspection

## Optimization Workflow

1. Measure with profiler/performance tooling.
2. Identify hot paths (expensive renders, repeated mounts, heavy computations).
3. Apply minimal targeted fixes.
4. Re-measure to confirm impact.

## High-Impact Patterns

- Virtualize long lists (`react-window`, TanStack Virtual, or equivalent).
- Split components to reduce re-render surface area.
- Use `memo`, `useMemo`, `useCallback` only when profiling proves value.
- Prefer async boundary/data-loading patterns over client Effect fetch waterfalls.

## Effect Guidance

- Remove Effects used for pure derivations.
- Keep synchronization Effects narrow and stable.
- Avoid `useLayoutEffect` unless unavoidable for layout correctness.

## Output

- Profiling-backed recommendations with expected impact.
- Simpler, measurable improvements over speculative tuning.

## References

- Preact docs: https://preactjs.com/
- Lighthouse docs: https://developer.chrome.com/docs/lighthouse
- Web.dev rendering performance: https://web.dev/rendering-performance/
