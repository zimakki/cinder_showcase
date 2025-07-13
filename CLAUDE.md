# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is the Cinder Showcase project - a comprehensive demonstration application for the Cinder library, which provides intelligent data table and card components for Ash Framework resources in Phoenix LiveView applications.

## Development Commands

### Setup and Installation
- `mix setup` - Complete project setup (dependencies, database, assets, seeds)
- `mix deps.get` - Install Elixir dependencies
- `mix ash.setup` - Run Ash-specific setup tasks

### Database
- `mix ecto.create` - Create the development database
- `mix ecto.migrate` - Run database migrations
- `mix ecto.reset` - Drop, recreate, and migrate database
- `mix run priv/repo/seeds.exs` - Seed the database

### Development
- `mix phx.server` - Start Phoenix server on http://localhost:4000
- `iex -S mix phx.server` - Start server with interactive Elixir shell

### Testing
- `mix test` - Run all tests
- `mix test path/to/test.exs` - Run specific test file
- `mix test path/to/test.exs:42` - Run specific test at line 42

### Assets
- `mix assets.setup` - Install Tailwind CSS and ESBuild
- `mix assets.build` - Build CSS and JavaScript assets
- `mix assets.deploy` - Create minified production assets

## Architecture

### Tech Stack
- **Phoenix LiveView** 1.8.0-rc.3 - Web framework
- **Ash Framework** 3.0+ - Domain modeling and API layer
- **PostgreSQL** - Database (via ash_postgres)
- **Tailwind CSS** 4.0.9 - Styling
- **ESBuild** - JavaScript bundling

### Project Structure
- `lib/cinder_showcase/` - Business logic and Ash resources
- `lib/cinder_showcase_web/` - Web layer (LiveViews, components, router)
- `lib/cinder_showcase_web/live/` - LiveView modules for each showcase page
- `priv/repo/` - Database migrations and seed data
- `assets/` - Frontend assets (CSS, JavaScript)

### Key Implementation Areas

Based on the PRD, the following need to be implemented:

1. **Ash Resources** (in `lib/cinder_showcase/resources/`):
   - User (with embedded profile)
   - Department
   - Post
   - Comment
   - Project
   - Assignment

2. **LiveView Pages** (in `lib/cinder_showcase_web/live/`):
   - Home page with feature overview
   - Table examples showcasing Cinder.Table
   - Card examples showcasing Cinder.Cards
   - Theme gallery with 8+ built-in themes
   - Advanced features (relationships, filtering, etc.)

3. **Theme System**:
   - 8 built-in themes: default, modern, retro, futuristic, dark, daisy_ui, flowbite, compact, pastel
   - Theme switching functionality
   - Custom theme examples

### Database Configuration
- **Development**: PostgreSQL on localhost
- **Production**: Fly.io managed PostgreSQL
- **Credentials**: See `config/dev.exs` for local development

### Important Patterns

1. **Cinder Integration**: The project showcases the Cinder library (feature/card-layouts-issue-9 branch)
2. **URL State Management**: Table/card states should be bookmarkable
3. **Real-time Updates**: Use Phoenix PubSub for live data synchronization
4. **Sample Data**: Minimum 1000+ records needed for performance testing