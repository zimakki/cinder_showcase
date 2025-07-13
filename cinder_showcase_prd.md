# Cinder Showcase Project - Product Requirements Document

## Project Overview

The Cinder Showcase is a comprehensive demonstration application that highlights all features and capabilities of the Cinder library - a powerful, intelligent data table component for Ash Framework resources in Phoenix LiveView applications. This project will serve as both a feature gallery and a practical reference implementation for developers.

## Project Goals

### Primary Objectives

- **Feature Demonstration**: Showcase all Cinder components, layouts, and capabilities
- **Theme Gallery**: Display all 8 built-in themes plus custom theme examples
- **Developer Reference**: Provide practical code examples and implementation patterns
- **Interactive Experience**: Allow users to explore features hands-on
- **Documentation Hub**: Serve as living documentation with real examples

### Success Metrics

- Complete coverage of all Cinder features and components
- Demonstration of all 8 built-in themes
- Interactive examples for every major use case
- Deployable to Fly.io for public access
- Clean, maintainable codebase that serves as a reference

## Technical Stack

- **Framework**: Phoenix LiveView 1.0+
- **Backend**: Ash Framework 3.0+
- **Language**: Elixir 1.17+
- **Component Library**: Cinder (feature/card-layouts-issue-9 branch)
- **Styling**: Tailwind CSS
- **Deployment**: Fly.io
- **Version Control**: GitHub

## Feature Requirements

### Core Cinder Components

#### 1. Table Component (`Cinder.Table`)

- **Basic Tables**: Simple resource-based tables
- **Advanced Filtering**: All 6 filter types with live examples
- **Sorting**: Interactive column sorting with visual indicators
- **Pagination**: Both offset and keyset pagination examples
- **Row Actions**: Click handlers, navigation, modals
- **Action Columns**: Custom action buttons and links
- **URL State Management**: Bookmarkable table states
- **Real-time Updates**: Live data synchronization

#### 2. Card Component (`Cinder.Cards`)

- **Basic Card Layouts**: Alternative to table view
- **Sorting**: Interactive column sorting with visual indicators
- **Pagination**: Both offset and keyset pagination examples
- **Row Actions**: Click handlers, navigation, modals
- **Card Filtering**: Same filtering capabilities as tables
- **Card Sorting**: Sort cards by various fields
- **Custom Card Templates**: Different card designs
- **Responsive Layouts**: Grid-based card arrangements
- **URL State Management**: Bookmarkable table states
- **Real-time Updates**: Live data synchronization

#### 3. Advanced Features

- **Relationship Support**: Dot notation examples (`user.department.name`)
- **Embedded Resources**: Double underscore notation (`user__profile__bio`)
- **Calculations & Aggregates**: Computed field examples
- **Complex Queries**: Custom Ash.Query examples
- **Authorization**: Actor-based filtering demonstrations

### Theme Showcase

#### Built-in Themes (8 total)

1. **default** - Clean, minimal design
2. **modern** - Contemporary styling with smooth transitions
3. **retro** - Vintage-inspired design elements
4. **futuristic** - Sci-fi aesthetic with bold colors
5. **dark** - Dark mode optimized theme
6. **daisy_ui** - DaisyUI framework integration
7. **flowbite** - Flowbite design system theme
8. **compact** - Space-efficient layout
9. **pastel** - Soft, pastel color palette

#### Custom Theme Examples

- **Theme Switcher**: Live theme switching interface
- **Custom DSL Demo**: Examples of theme customization
- **Theme Development Guide**: Step-by-step theme creation

### Sample Data & Ash Resources

#### Core Resources

1. **Users Resource**

   - Attributes: name, email, role, department_id, created_at, active
   - Relationships: belongs_to department, has_many posts
   - Embedded: profile (bio, avatar, country, preferences)

2. **Departments Resource**

   - Attributes: name, description, budget, location
   - Relationships: has_many users
   - Calculations: user_count, average_salary

3. **Posts Resource**

   - Attributes: title, content, status, published_at, view_count
   - Relationships: belongs_to user, has_many comments
   - Aggregates: comment_count, avg_rating

4. **Comments Resource**

   - Attributes: content, rating, created_at
   - Relationships: belongs_to post, belongs_to user

5. **Projects Resource**

   - Attributes: name, description, status, priority, deadline
   - Relationships: has_many assignments
   - Complex filters: by status, priority, overdue

6. **Assignments Resource**
   - Attributes: role, hours_allocated, start_date, end_date
   - Relationships: belongs_to user, belongs_to project

#### Sample Data Requirements

- **Volume**: Minimum 1000+ records across all resources
- **Relationships**: Realistic data relationships
- **Variety**: Diverse data types for filter/sort testing
- **Embedded Data**: Rich embedded resource examples

### User Interface Structure

#### Navigation

- **Header**: Cinder logo, navigation menu, theme selector
- **Sidebar**: Feature categories and quick navigation
- **Breadcrumbs**: Clear navigation path
- **Footer**: Links to documentation, GitHub, and credits

#### Page Structure

1. **Homepage**

   - Hero section with Cinder overview
   - Feature highlights with animations
   - Quick start examples
   - Theme preview gallery

2. **Table Examples**

   - Basic table implementations
   - Advanced filtering demonstrations
   - Sorting and pagination examples
   - URL state management

3. **Card Examples**

   - Various card layouts
   - Filtering and sorting in card view
   - Custom card templates
   - Responsive design examples

4. **Theme Gallery**

   - Live theme switching
   - Side-by-side theme comparisons
   - Custom theme examples
   - Theme development tools

5. **Advanced Features**

   - Complex relationship queries
   - Embedded resource handling
   - Real-time updates
   - Authorization examples

6. **Code Examples**
   - Syntax-highlighted code blocks
   - Copy-to-clipboard functionality
   - Live code preview
   - Download example files

### Interactive Features

#### Live Demo Capabilities

- **Real-time Filtering**: Immediate results as users type
- **Theme Switching**: Instant theme changes without page reload
- **Data Manipulation**: Add, edit, delete records in live demos
- **Responsive Preview**: Mobile/tablet/desktop view toggle
- **Code Playground**: Editable code examples with live preview

#### User Controls

- **Data Reset**: Restore demo data to original state
- **Performance Monitor**: Show query performance metrics
- **Feature Toggles**: Enable/disable specific features
- **Export Options**: Export filtered data or configurations

## Technical Implementation

### Project Structure

```
cinder_showcase/
├── assets/
│   ├── css/
│   │   ├── app.css
│   │   └── themes/
│   ├── js/
│   │   └── app.js
│   └── vendor/
├── config/
├── lib/
│   ├── cinder_showcase/
│   │   ├── resources/
│   │   │   ├── user.ex
│   │   │   ├── department.ex
│   │   │   ├── post.ex
│   │   │   └── ...
│   │   ├── repo.ex
│   │   └── data_layer.ex
│   └── cinder_showcase_web/
│       ├── components/
│       ├── live/
│       │   ├── home_live.ex
│       │   ├── table_examples_live.ex
│       │   ├── card_examples_live.ex
│       │   ├── theme_gallery_live.ex
│       │   └── ...
│       ├── router.ex
│       └── endpoint.ex
├── priv/
│   ├── repo/
│   │   ├── migrations/
│   │   └── seeds.exs
│   └── static/
└── test/
```

### Data Layer Setup

- **Database**: PostgreSQL on Fly.io for production and development
- **Migrations**: Automated schema creation with Fly.io deploy hooks
- **Seeds**: Rich sample data generation on deployment
- **Data API**: Ash actions for all CRUD operations
- **Database URL**: Fly.io managed PostgreSQL connection

### LiveView Architecture

- **Mount Pattern**: Consistent state initialization
- **URL Synchronization**: Bookmarkable table states
- **Real-time Updates**: PubSub for live data changes
- **Error Handling**: Graceful degradation and error recovery

### Deployment Strategy

- **Fly.io Platform**: Full Phoenix application deployment
- **Database**: PostgreSQL on Fly.io
- **Environment Config**: Production-ready Fly.io configuration
- **CI/CD Pipeline**: GitHub Actions with Fly.io deployment
- **SSL/Domain**: Custom domain with automatic SSL

## Content Strategy

### Code Examples

- **Beginner Level**: Simple, copy-paste ready examples
- **Intermediate Level**: Real-world use cases
- **Advanced Level**: Complex scenarios and optimizations
- **Best Practices**: Recommended patterns and anti-patterns

### Documentation Integration

- **Inline Comments**: Detailed code explanations
- **Feature Explanations**: Context for each demonstration
- **Performance Notes**: Optimization tips and considerations
- **Troubleshooting**: Common issues and solutions

### SEO & Accessibility

- **Semantic HTML**: Proper heading structure and landmarks
- **ARIA Labels**: Screen reader support
- **Keyboard Navigation**: Full keyboard accessibility
- **Meta Tags**: Optimized for search and social sharing

## Success Criteria

### Functional Requirements

- [ ] All Cinder components demonstrated with working examples
- [ ] All 8 built-in themes displayed and switchable
- [ ] Interactive filtering, sorting, and pagination
- [ ] Real-time data updates and synchronization
- [ ] Mobile-responsive design across all examples
- [ ] Copy-paste ready code examples
- [ ] Error-free deployment to Fly.io with auto-scaling

### Performance Requirements

- [ ] Initial page load < 2 seconds
- [ ] Table rendering with 1000+ rows < 500ms
- [ ] Theme switching < 100ms
- [ ] Filter response time < 200ms
- [ ] Mobile performance score > 90

### Quality Requirements

- [ ] Zero accessibility violations (WCAG 2.1 AA)
- [ ] Cross-browser compatibility (Chrome, Firefox, Safari, Edge)
- [ ] Clean, maintainable codebase
- [ ] Comprehensive test coverage > 80%
- [ ] Documentation completeness score > 95%

## Future Enhancements

### Phase 2 Features

- **Interactive Tutorial**: Step-by-step guided tours
- **Custom Theme Builder**: Visual theme creation tool
- **Performance Benchmarks**: Comparative performance testing
- **API Playground**: Interactive Ash query builder
- **Community Examples**: User-submitted examples and themes

### Integration Opportunities

- **Ash Extensions**: Showcase complementary Ash packages
- **Phoenix Components**: Integration with Phoenix.Component
- **Third-party Tools**: Chart libraries, export tools
- **Analytics**: Usage tracking and optimization insights

## Timeline & Milestones

### Phase 1: Foundation (Weeks 1-2)

- Project setup and configuration
- Basic Ash resources and sample data
- Core navigation and layout structure

### Phase 2: Core Features (Weeks 3-4)

- Table component examples
- Card component examples
- Basic filtering and sorting

### Phase 3: Advanced Features (Weeks 5-6)

- All theme implementations
- Advanced filtering and relationships
- URL state management

### Phase 4: Polish & Deploy (Weeks 7-8)

- Code examples and documentation
- Performance optimization
- Deployment and testing

## Risk Assessment

### Technical Risks

- **Complexity**: Managing multiple themes and features
- **Performance**: Large datasets affecting user experience
- **Database**: PostgreSQL performance with large sample datasets
- **Scaling**: Fly.io resource management under load
- **Deployment**: Fly.io configuration and environment setup

### Mitigation Strategies

- **Modular Architecture**: Clean separation of concerns
- **Performance Testing**: Regular benchmarking and optimization
- **Database Optimization**: Proper indexing and query optimization
- **Fly.io Monitoring**: Resource usage tracking and auto-scaling
- **Deployment Automation**: Robust CI/CD pipeline with rollback capabilities

## Conclusion

The Cinder Showcase project will serve as the definitive demonstration of Cinder's capabilities, providing developers with practical examples, comprehensive theme options, and real-world implementation patterns. By focusing on interactive demonstrations and clean, copyable code examples, this project will accelerate Cinder adoption and showcase the power of the Ash Framework ecosystem.

The combination of comprehensive feature coverage, theme variety, and practical examples will make this showcase an invaluable resource for the Phoenix LiveView and Ash Framework communities.
