# Language: Shared Vocabulary for Module Design

Precise terms for discussing modules and their design. Use these consistently — don't substitute synonyms.

## Core terms

| Term | Definition |
|------|-----------|
| **Module** | Anything with an interface and an implementation. Scale-agnostic: function, class, package, system tier. |
| **Interface** | Everything a caller must know to use the module: types, invariants, ordering constraints, error modes, required configuration, performance characteristics. Not just the type signature. |
| **Implementation** | The code behind the interface. |
| **Depth** | Leverage at the interface — how much behaviour sits behind how small an interface. **Deep** = high leverage. **Shallow** = interface nearly as complex as the implementation. |
| **Seam** | Where an interface lives. A place you can alter behaviour without editing in that place. (Borrowed from Michael Feathers.) |
| **Adapter** | A concrete thing that satisfies an interface at a seam. Describes function, not internal substance. |
| **Leverage** | What callers get from depth: a lot of capability for a little knowledge. |
| **Locality** | What maintainers get from depth: changes, bugs, and knowledge concentrated in one place. |

## Principles

1. **Depth belongs to interfaces, not implementations.** A module is deep because its interface is simple relative to the behaviour it provides — not because the implementation is large.

2. **Internal seams can structure implementation.** A deep module can have internal seams (private, used by its own tests) that don't appear in its external interface.

3. **Deletion test.** Imagine deleting the module. If complexity vanishes, it was a pass-through (shallow). If complexity reappears across N callers, it was earning its keep (deep).

4. **The interface is the test surface.** Callers and tests traverse the same boundary. If you can't meaningfully test through the interface alone, the module is shaped wrong.

5. **One adapter = hypothetical seam. Two adapters = real seam.** Don't introduce a port unless at least two adapters are justified. A single-adapter seam is just indirection.
