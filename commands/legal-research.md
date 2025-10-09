# Legal Research - South African Law

You are tasked with conducting comprehensive legal research focused on South African law. You will spawn parallel sub-agents to analyze legal questions, review contracts, assess risks, and draft legal documents.

## Initial Setup:

When this command is invoked, respond with:
```
I'm ready to conduct legal research on South African law. Please provide your legal question, contract for review, or describe the legal matter you need assistance with.
```

Then wait for the user's legal research query.

## Steps to follow after receiving the research query:

1. **Read any directly mentioned files first:**
   - If the user mentions specific files (contracts, agreements, pleadings, briefs), read them FULLY first
   - **IMPORTANT**: Use the Read tool WITHOUT limit/offset parameters to read entire files
   - **CRITICAL**: Read these files yourself in the main context before spawning any sub-tasks
   - This ensures you have full context before decomposing the research

2. **Analyze and decompose the legal research question:**
   - Identify the type of legal task:
     - Deep research on legal questions based on facts
     - Critical review of contracts (whole or specific clauses)
     - Drafting and rewording of clauses for specific purposes
     - Risk analysis and logical review of legal strategies
     - Technical review and drafting of legal pleadings
     - Technical checks (cross-referencing clauses, identifying gaps in contracts)
   - Break down the query into composable research areas
   - Consider applicable South African statutes, case law, and legal principles
   - Create a research plan using TodoWrite to track all subtasks
   - Identify specific legal issues, relevant legislation, and precedents to investigate

3. **Spawn parallel sub-agent tasks for comprehensive legal research:**
   - Create multiple Task agents to research different aspects concurrently
   - Use specialized agents intelligently:

   **For legal research:**
   - Use the **web-search-researcher** agent to find South African case law, statutes, and legal commentary
   - Instruct agents to focus specifically on South African law and jurisdiction
   - Request agents to return LINKS to case law, legislation, and authoritative sources

   **For codebase research (if relevant documents exist locally):**
   - Use the **codebase-locator** agent to find WHERE legal documents and templates live
   - Use the **codebase-analyzer** agent to understand HOW specific legal documents are structured
   - Use the **codebase-pattern-finder** agent if you need examples of similar legal documents

   **For local legal document analysis:**
   - Use the **thoughts-locator** agent to discover existing legal research and documents
   - Use the **thoughts-analyzer** agent to extract key insights from relevant legal documents

   The key is to use these agents intelligently:
   - Start with locator agents to find what exists
   - Then use analyzer agents on the most promising findings
   - Run multiple agents in parallel when they're searching for different things
   - Each agent knows its job - just tell it what you're looking for
   - For web research, be specific about South African law focus

4. **Wait for all sub-agents to complete and synthesize findings:**
   - IMPORTANT: Wait for ALL sub-agent tasks to complete before proceeding
   - Compile all sub-agent results (web research, local documents, and case law)
   - Prioritize authoritative legal sources (statutes, case law, legal commentary)
   - Cross-reference findings across different sources
   - Include specific citations to statutes, regulations, and case law
   - For contracts: identify all clauses, gaps, conflicts, and risks
   - For legal strategies: analyze strengths, weaknesses, and alternatives
   - Answer the user's specific questions with concrete legal authority

5. **Generate legal research document:**
   - Structure the document appropriately based on the type of legal task:

   **For legal research questions:**
   ```markdown
   # Legal Research: [Topic/Question]

   **Date**: [Current date and time]
   **Research Type**: Legal Question Analysis

   ## Legal Question
   [Original user query with facts]

   ## Summary
   [High-level legal answer with key conclusions]

   ## Applicable Law

   ### Statutes and Regulations
   - [Act name and section] - [Relevance]
   - Link: [URL to legislation]

   ### Case Law
   - [Case name and citation] - [Key principle]
   - Link: [URL to judgment]

   ### Legal Principles
   [Relevant common law principles and doctrines]

   ## Detailed Analysis

   ### [Legal Issue 1]
   - Legal position under South African law
   - Relevant authority and citations
   - Application to the facts
   - Risk assessment

   ### [Legal Issue 2]
   ...

   ## Conclusion
   [Direct answer to the legal question with supporting authority]

   ## Recommended Actions
   [Practical steps or legal strategies]

   ## Sources and References
   - [Citation 1 with link]
   - [Citation 2 with link]
   ...

   ## Open Questions
   [Any areas requiring further investigation or clarification]
   ```

   **For contract reviews:**
   ```markdown
   # Contract Review: [Contract Name/Type]

   **Date**: [Current date and time]
   **Research Type**: Contract Review

   ## Overview
   [Brief description of the contract and its purpose]

   ## Executive Summary
   [High-level assessment: key risks, gaps, and recommendations]

   ## Clause-by-Clause Analysis

   ### [Clause Name/Number]
   - **Current Wording**: [Quote the clause]
   - **Legal Assessment**: [Analysis under SA law]
   - **Risks Identified**: [Specific risks]
   - **Recommendation**: [Keep as is / Amend / Remove / Add]
   - **Suggested Rewording** (if applicable): [Proposed new text]
   - **Rationale**: [Legal basis for the change]

   [Repeat for each clause]

   ## Cross-Referencing Analysis
   [How clauses interact, conflicts, or dependencies between clauses]

   ## Gap Analysis
   [Missing provisions that should be included]
   - **Gap 1**: [Description]
     - **Risk**: [What could go wrong]
     - **Suggested Clause**: [Proposed text]

   ## Risk Summary
   ### High Risk Issues
   - [Issue with explanation]

   ### Medium Risk Issues
   - [Issue with explanation]

   ### Low Risk Issues
   - [Issue with explanation]

   ## Compliance Check
   [Compliance with relevant South African legislation]
   - Consumer Protection Act
   - POPIA (Protection of Personal Information Act)
   - [Other relevant legislation]

   ## Recommended Revisions
   [Prioritized list of changes to make]

   ## Legal References
   [Relevant case law, statutes, and commentary]
   ```

   **For legal pleadings:**
   ```markdown
   # Legal Pleading: [Type - e.g., Notice of Motion, Particulars of Claim]

   **Date**: [Current date and time]
   **Research Type**: Legal Pleading Review/Drafting

   ## Matter Overview
   [Brief description of the legal matter and relief sought]

   ## Technical Compliance Check
   - Uniform Rules of Court compliance
   - Jurisdictional requirements
   - Standing and capacity
   - Proper parties cited
   - Required documentation attached

   ## Legal Grounds Analysis

   ### [Cause of Action 1]
   - **Legal Basis**: [Statute/common law]
   - **Elements Required**: [List]
   - **Facts Supporting**: [Mapping to pleading]
   - **Legal Authority**: [Case law and citations]

   [Repeat for each cause of action]

   ## Drafting Assessment
   - Clarity and precision
   - Material facts sufficiency
   - Legal conclusions properly drawn
   - Prayer for relief appropriateness

   ## Suggested Pleading / Revisions
   [Draft pleading or specific revisions with legal basis]

   ## Anticipated Defenses and Responses
   [How opponent might respond and counter-strategies]

   ## Legal References
   [Relevant case law, rules, and statutes]

   ## Recommendations
   [Practical advice for proceeding with the pleading]
   ```

6. **Present findings:**
   - Present a concise summary of findings to the user
   - Include key legal citations for authority
   - Highlight critical risks or recommendations
   - Ask if they have follow-up questions or need clarification

7. **Handle follow-up questions:**
   - If the user has follow-up questions, append to the same research document
   - Add a new section: `## Follow-up Research [timestamp]`
   - Spawn new sub-agents as needed for additional investigation
   - Continue updating the document

## Important notes:
- Always use parallel Task agents to maximize efficiency
- Focus specifically on **South African law** - statutes, case law, and legal principles
- For contracts: conduct thorough cross-referencing of all clauses against each other
- For contracts: actively identify gaps and missing provisions
- For risk analysis: categorize risks by severity and likelihood
- Include citations to authoritative legal sources (cases, statutes, regulations)
- Provide links to legislation and judgments where available
- Be thorough in technical legal analysis
- Consider practical commercial and legal implications
- When drafting or revising clauses, explain the legal rationale
- Always consider compliance with relevant South African legislation
- Research documents should be self-contained with all necessary context
- Each sub-agent prompt should be specific and focused on read-only operations for research
- **File reading**: Always read mentioned files FULLY (no limit/offset) before spawning sub-tasks
- **Critical ordering**: Follow the numbered steps exactly
  - ALWAYS read mentioned files first before spawning sub-tasks (step 1)
  - ALWAYS wait for all sub-agents to complete before synthesizing (step 4)
- When searching for case law, prioritize South African Supreme Court of Appeal and Constitutional Court decisions
- For statutory interpretation, apply South African principles of interpretation

---

$ARGUMENTS
