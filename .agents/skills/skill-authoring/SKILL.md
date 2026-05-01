---
name: skill-authoring
description: Creates and updates Pi agent skills with valid frontmatter, clear trigger descriptions, reusable structure, and project-safe instructions. Use when adding new skills to this dotfiles repo.
---

# Skill Authoring

Use this skill when asked to create or modify skills in this repository.

## Goals

- Produce valid Agent Skills structure and frontmatter.
- Keep instructions concise, actionable, and safe for local dotfiles workflows.
- Make future skills consistent and easy to maintain.

## Repository Conventions

- Place project skills in `.agents/skills/<skill-name>/SKILL.md`.
- Place global skills in `~/.agents/skills/<skill-name>/SKILL.md`.
- `name` must exactly match `<skill-name>`.
- Use lowercase letters, numbers, and hyphens only.
- Prefer helper docs in `references/` for long details.
- Prefer scripts in `scripts/` only when truly needed.

## Required SKILL.md Template

```markdown
---
name: <skill-name>
description: <specific capability + when to use it>
---

# <Human Title>

## When to Use

- <trigger 1>
- <trigger 2>

## Inputs to Request

- <required info>

## Steps

1. <step>
2. <step>
3. <step>

## Output

- <what to return>

## Safety / Constraints

- <important guardrails>
```

## Authoring Checklist

Before finalizing a new or updated skill:

1. Validate frontmatter (`name`, `description` present).
2. Confirm directory name matches `name` exactly.
3. Ensure description is specific enough to trigger correctly.
4. Resolve unknowns by asking clarifying questions instead of guessing.
5. Confirm safety/constraints, required references, and expected outputs.
6. Remove vague guidance and repository-unsafe actions.
7. Verify all file paths are relative to the skill directory.
8. If commands are included, keep them minimal and deterministic.

## Skill Creation Workflow

When creating a new skill:

1. Ask whether the skill should be global or project-level.
2. Ask clarifying questions for any unknowns before writing files.
3. Propose 2-4 candidate skill names.
4. Draft a precise description focused on triggers.
5. Confirm required sections with the user: inputs, steps, output, safety/constraints, references, and tool limitations.
6. Create `~/.agents/skills/<name>/SKILL.md` for global skills, or `.agents/skills/<name>/SKILL.md` for project skills.
7. Add optional `references/` docs if instructions are long.
8. Summarize created files and recommended follow-up tests.

## Clarifying Questions to Ask

When details are missing, ask targeted questions such as:

- What actions must this skill avoid?
- Are there destructive commands that require explicit confirmation?
- What references or source docs should the skill follow?
- What inputs are required vs optional?
- What output format should the skill return?
- Should any tools be disallowed or preferred?
- Are there environment assumptions or dependencies?

## References

- Agent Skills spec: https://agentskills.io/specification
- Pi skills docs: https://pi.dev/docs/latest/skills
