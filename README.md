# claude

## Commands

### Research
Research the codebase and idea by spawning parallel agents to analyze code, thoughts, and patterns resulting in a research file on /thoughts/research/...

`/research [prompt]`

Examples:
- `/research creating a new web app that does ...`
- `/research what is causing this bug`
- `/research adding the feaure documented here ./feature.md`

### Plan
Create detailed implementation plans through interactive iteration with structured phases and success criteria from a research file.

`/plan [research-file]`

Examples:
- `/plan thoughts/research/2025-01-08-06-ENG-1478-parent-child-tracking.md`


### Implement
Execute approved plans with automated verification and progress tracking.

`/implement [plan-file]`

Example:
- `/implement thoughts/shared/plans/2025-01-08-06-ENG-1478-parent-child-tracking.md`

## Usage Flow

1. **Research** - `/research [prompt]`
   - Research generates a document in `thoughts/shared/research/`
   - Iterate on research, ask follow-up questions, provide feedback

2. **Clear context** - `/clear`

3. **Plan** - `/plan [research-file]`
   - Create implementation plan based on research or ticket
   - Iterate on plan, ask questions, give suggestions
   - Plan is saved to `thoughts/shared/plans/`

4. **Clear context** - `/clear`

5. **Implement** - `/implement [plan-file]`
   - Execute plan phase by phase
   - Each phase includes automated and manual verification
   - Clear context between phases if needed
