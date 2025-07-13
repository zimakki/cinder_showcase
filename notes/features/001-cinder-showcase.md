# Feature: Cinder Showcase Application

## Summary

A comprehensive demonstration application that showcases all features and capabilities of the Cinder library - intelligent data table and card components for Ash Framework resources in Phoenix LiveView applications.

## Requirements

- [ ] Integrate Cinder library (investigate feature/card-layouts-issue-9 branch)
- [ ] Create 6 Ash resources: User, Department, Post, Comment, Project, Assignment
- [ ] Implement table examples with Cinder.Table component
- [ ] Implement card examples with Cinder.Cards component (if available)
- [ ] Display all 8 built-in themes with live switching
- [ ] Demonstrate advanced filtering (6 filter types)
- [ ] Show sorting and pagination (offset and keyset)
- [ ] URL state management for bookmarkable states
- [ ] Real-time updates with Phoenix PubSub
- [ ] Sample data generation (1000+ records minimum)
- [ ] Responsive design for mobile/tablet/desktop
- [ ] Interactive code examples with syntax highlighting
- [ ] Deploy to Fly.io with PostgreSQL
- [ ] Performance requirements: <2s load, <500ms table rendering

## Research Summary

### Existing Usage Rules Checked

- Ash Framework patterns: Use actions for all CRUD operations, follow domain structure
- Phoenix LiveView patterns: Mount/handle_params pattern, real-time updates with PubSub
- No existing Cinder usage rules found in codebase (new integration)

### Documentation Reviewed

- **Cinder Library**: v0.4.0 stable on Hex.pm, intelligent data tables for Ash resources
- **Available Components**: Cinder.Table confirmed, Cinder.Cards unclear (may be in feature branch)
- **Built-in Themes**: 8 themes confirmed (default, modern, retro, futuristic, dark, daisy_ui, flowbite, compact)
- **Installation**: Can use igniter.install or manual dependency addition

### Existing Patterns Found

- Basic Phoenix/Ash structure: `lib/cinder_showcase/application.ex:1` - Application setup
- Repository pattern: `lib/cinder_showcase/repo.ex:1` - Ecto/Ash repo
- LiveView configuration: `lib/cinder_showcase_web/endpoint.ex:1` - Socket configuration
- No existing Ash resources or LiveView modules yet

### Technical Approach

**Phase 1: Foundation Setup**

1. Add Cinder dependency (investigate feature branch requirement)
2. Create Ash domain and all 6 resources with proper relationships
3. Generate database migrations for all resources
4. Create comprehensive seed data (1000+ records)

**Phase 2: Core Components**

1. Build basic LiveView pages for each showcase section
2. Implement table examples using Cinder.Table
3. Research and implement card layouts (Cinder.Cards or alternative)
4. Add navigation structure and routing

**Phase 3: Advanced Features**

1. Implement all 8 theme switching capabilities
2. Add advanced filtering, sorting, pagination examples
3. URL state management and bookmarking
4. Real-time updates with PubSub

**Phase 4: Polish & Deploy**

1. Interactive code examples with copy functionality
2. Performance optimization
3. Responsive design implementation
4. Fly.io deployment configuration

## Risks & Mitigations

| Risk                                            | Impact | Mitigation                                                                   |
| ----------------------------------------------- | ------ | ---------------------------------------------------------------------------- |
| feature/card-layouts-issue-9 branch unavailable | High   | Contact stakeholders, use stable version + custom card implementation        |
| Cinder.Cards component doesn't exist yet        | High   | Build card layouts using Cinder.Table + custom styling or Phoenix components |
| Performance with 1000+ records                  | Medium | Implement proper pagination, database indexing, query optimization           |
| Complex theme switching implementation          | Medium | Start with basic theme switching, enhance iteratively                        |
| Fly.io deployment complexity                    | Low    | Use standard Phoenix/Ash deployment patterns                                 |

## Implementation Checklist

- [ ] Add Cinder dependency to mix.exs (resolve branch requirement)
- [ ] Create Ash domain configuration
- [ ] Generate User resource with embedded profile
- [ ] Generate Department resource with calculations
- [ ] Generate Post resource with relationships
- [ ] Generate Comment resource
- [ ] Generate Project resource
- [ ] Generate Assignment resource
- [ ] Create database migrations for all resources
- [ ] Implement comprehensive seed data
- [ ] Create LiveView router configuration
- [ ] Build home page LiveView with hero section
- [ ] Build table examples LiveView
- [ ] Build card examples LiveView (or alternative)
- [ ] Build theme gallery LiveView
- [ ] Build advanced features LiveView
- [ ] Implement theme switching system
- [ ] Add URL state management
- [ ] Add real-time updates with PubSub
- [ ] Create interactive code examples
- [ ] Implement responsive design
- [ ] Configure Fly.io deployment
- [ ] Test all performance requirements
- [ ] Verify accessibility compliance

## Questions for Zi

1. **Cinder Branch Access**: The PRD mentions using the "feature/card-layouts-issue-9" branch. Do you have access to this branch, or should I use the stable version from Hex.pm?
   use the stable branch for now.

2. **Cinder.Cards Component**: I couldn't find documentation for Cinder.Cards in the stable release. Is this component:

   - Available in the feature branch?
   - Should be implemented as custom card layouts using Cinder.Table?
   - A different component entirely?
     this is on another branch. so lets just start with the table first.

3. **Sample Data Volume**: The PRD requires 1000+ records. Should this be:

   - Generated during seeds for development?
   - Created dynamically for performance testing?
   - A mix of both?

for now lets just seed the database.

4. **Deployment Timeline**: Should I prioritize getting a basic version deployed early, or complete all features before deployment?

complete all features first.

5. **Theme Implementation**: Should the 8 themes be:

   - CSS-only implementations?
   - Cinder's built-in theme system?
   - Custom theme switching mechanism?

   Cinder built in theme system for now.
