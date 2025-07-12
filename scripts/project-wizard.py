#!/usr/bin/env python3
"""
Project Initialization Wizard
Guides users through customizing their project skeleton
"""

import os
import json
import textwrap
from datetime import datetime
from pathlib import Path

class ProjectWizard:
    def __init__(self):
        self.project_root = Path.cwd()
        self.responses = {}
        
    def colored_text(self, text, color):
        """Add color to terminal output"""
        colors = {
            'blue': '\033[94m',
            'green': '\033[92m',
            'yellow': '\033[93m',
            'red': '\033[91m',
            'bold': '\033[1m',
            'end': '\033[0m'
        }
        return f"{colors.get(color, '')}{text}{colors['end']}"
    
    def print_header(self, title):
        """Print a formatted header"""
        print("\n" + "="*50)
        print(self.colored_text(title.center(50), 'bold'))
        print("="*50 + "\n")
        
    def ask_question(self, question, default=None, choices=None, multiline=False):
        """Ask user a question with optional default and choices"""
        prompt = self.colored_text(f"→ {question}", 'blue')
        
        if choices:
            print(prompt)
            for i, choice in enumerate(choices, 1):
                print(f"  {i}. {choice}")
            while True:
                answer = input(f"Enter choice (1-{len(choices)}): ").strip()
                try:
                    idx = int(answer) - 1
                    if 0 <= idx < len(choices):
                        return choices[idx]
                except ValueError:
                    pass
                print(self.colored_text("Invalid choice. Try again.", 'red'))
        
        elif multiline:
            print(prompt)
            print(self.colored_text("(Press Enter twice to finish)", 'yellow'))
            lines = []
            while True:
                line = input()
                if line == "" and lines and lines[-1] == "":
                    break
                lines.append(line)
            return "\n".join(lines[:-1])  # Remove last empty line
        
        else:
            if default:
                prompt += f" [{default}]"
            answer = input(f"{prompt}: ").strip()
            return answer if answer else default
    
    def collect_basic_info(self):
        """Collect basic project information"""
        self.print_header("Basic Project Information")
        
        self.responses['project_name'] = self.ask_question(
            "Project name", 
            default=self.project_root.name
        )
        
        self.responses['project_description'] = self.ask_question(
            "Brief project description (1-2 sentences)"
        )
        
        self.responses['project_type'] = self.ask_question(
            "What type of project is this?",
            choices=[
                "SaaS (Software as a Service)",
                "Marketing Website", 
                "E-commerce Site",
                "Dashboard/Analytics Tool",
                "API Service",
                "Other"
            ]
        )
        
    def collect_design_preferences(self):
        """Collect design and visual preferences"""
        self.print_header("Design Preferences")
        
        self.responses['design_style'] = self.ask_question(
            "Visual style preference",
            choices=[
                "Corporate/Professional (like Severance)",
                "Modern/Minimal",
                "Playful/Creative",
                "Technical/Developer-focused",
                "Custom (I'll describe)"
            ]
        )
        
        if self.responses['design_style'] == "Custom (I'll describe)":
            self.responses['custom_design'] = self.ask_question(
                "Describe your visual style",
                multiline=True
            )
        
        self.responses['primary_color'] = self.ask_question(
            "Primary brand color",
            default="#007bff (blue)"
        )
        
        self.responses['font_preference'] = self.ask_question(
            "Font preference",
            default="System fonts (modern default)"
        )
        
    def collect_features(self):
        """Collect feature requirements"""
        self.print_header("Core Features")
        
        print("What features does your MVP need? (y/n for each)")
        
        features = [
            ("user_auth", "User authentication (login/signup)"),
            ("dashboard", "Dashboard with data visualization"),
            ("forms", "Forms for data collection"),
            ("payments", "Payment processing"),
            ("api", "API endpoints"),
            ("admin", "Admin panel"),
            ("email", "Email notifications"),
            ("file_upload", "File uploads")
        ]
        
        self.responses['features'] = {}
        for key, description in features:
            answer = self.ask_question(f"{description}?", default="n")
            self.responses['features'][key] = answer.lower().startswith('y')
    
    def collect_business_info(self):
        """Collect business/goal information"""
        self.print_header("Business Goals")
        
        self.responses['target_audience'] = self.ask_question(
            "Who is your target audience?",
            multiline=True
        )
        
        self.responses['main_goal'] = self.ask_question(
            "What's the main goal?",
            choices=[
                "Get funding/investment",
                "Launch to customers ASAP",
                "Build portfolio piece",
                "Internal tool",
                "Learning project"
            ]
        )
        
        self.responses['timeline'] = self.ask_question(
            "Target launch date",
            default="6 weeks from now"
        )
        
    def write_requirements(self):
        """Update REQUIREMENTS.md with collected info"""
        requirements_path = self.project_root / "docs" / "REQUIREMENTS.md"
        
        content = f"""# Project Requirements

## Overview
{self.responses['project_description']}

## Project Type
{self.responses['project_type']}

## Target Audience
{self.responses['target_audience']}

## Main Goal
{self.responses['main_goal']}

## Timeline
Target Launch: {self.responses['timeline']}

## Core Features

### Phase 1 - MVP
"""
        
        # Add selected features
        feature_names = {
            'user_auth': 'User Authentication System',
            'dashboard': 'Data Dashboard',
            'forms': 'Data Collection Forms',
            'payments': 'Payment Processing',
            'api': 'API Endpoints',
            'admin': 'Admin Panel',
            'email': 'Email Notifications',
            'file_upload': 'File Upload System'
        }
        
        for key, enabled in self.responses['features'].items():
            if enabled:
                content += f"- [ ] {feature_names[key]}\n"
        
        content += f"""
### Phase 2 - Enhancement
- [ ] [Features to add after MVP]

## Design Requirements

### Visual Style
{self.responses['design_style']}

### Brand Colors
- Primary: {self.responses['primary_color']}
- Secondary: [To be determined]

### Typography
{self.responses['font_preference']}

## Success Metrics
- [ ] [How will you measure success?]

## Questions to Resolve
- [ ] [Any open questions?]
"""
        
        requirements_path.write_text(content)
        print(self.colored_text(f"✓ Updated {requirements_path}", 'green'))
        
    def write_claude_context(self):
        """Update CLAUDE.md with project context"""
        claude_path = self.project_root / "CLAUDE.md"
        current_content = claude_path.read_text()
        
        # Find and replace the project-specific notes section
        project_notes = f"""## Project-Specific Notes

### Project: {self.responses['project_name']}
{self.responses['project_description']}

### Design Direction
- Style: {self.responses['design_style']}
- Primary Color: {self.responses['primary_color']}
- Typography: {self.responses['font_preference']}

### Priority Features
"""
        
        for key, enabled in self.responses['features'].items():
            if enabled:
                project_notes += f"- {key.replace('_', ' ').title()}\n"
                
        project_notes += f"""
### Business Context
- Target Audience: {self.responses['target_audience']}
- Main Goal: {self.responses['main_goal']}
- Timeline: {self.responses['timeline']}

### Development Approach
Start with the marketing/landing page to establish visual design and demonstrate value proposition.
{'' if not self.responses['features']['user_auth'] else 'Then implement authentication before other features.'}
"""
        
        # Replace the last section
        import re
        updated_content = re.sub(
            r'## Project-Specific Notes.*$',
            project_notes,
            current_content,
            flags=re.DOTALL
        )
        
        claude_path.write_text(updated_content)
        print(self.colored_text(f"✓ Updated {claude_path}", 'green'))
        
    def generate_first_prompt(self):
        """Generate an optimal first prompt for Claude"""
        prompt = f"""Read CLAUDE.md and docs/REQUIREMENTS.md to understand the {self.responses['project_name']} project.

I need you to create a professional {'landing page' if 'Marketing' in self.responses['project_type'] else 'homepage'} with the following approach:

1. First, create a wireframe showing the layout and sections
2. Implement the HTML structure with semantic elements  
3. Apply the {self.responses['design_style'].lower()} visual style with:
   - Primary color: {self.responses['primary_color']}
   - Typography: {self.responses['font_preference']}

The page should immediately convey: {self.responses['project_description']}

Target audience: {self.responses['target_audience']}

{'Focus on making it look professional and funding-ready.' if 'funding' in self.responses['main_goal'].lower() else 'Focus on clear value proposition and user conversion.'}

Start with the wireframe layout so I can review before you implement the full design."""
        
        return prompt
        
    def save_wizard_data(self):
        """Save responses for future reference"""
        wizard_data_path = self.project_root / ".claude" / "wizard-responses.json"
        with open(wizard_data_path, 'w') as f:
            json.dump(self.responses, f, indent=2)
        
    def run(self):
        """Run the complete wizard"""
        self.print_header("🚀 Project Setup Wizard")
        
        print("This wizard will help you customize your project skeleton.")
        print("It takes about 2-3 minutes and you can always change things later.\n")
        
        try:
            # Collect all information
            self.collect_basic_info()
            self.collect_design_preferences()
            self.collect_features()
            self.collect_business_info()
            
            # Write to files
            print("\n" + self.colored_text("Updating project files...", 'yellow'))
            self.write_requirements()
            self.write_claude_context()
            self.save_wizard_data()
            
            # Generate first prompt
            self.print_header("✨ Setup Complete!")
            
            print("Your project has been customized!")
            print("\nNext steps:")
            print("1. Start Claude Code: " + self.colored_text("claude", 'bold'))
            print("2. Use this first prompt:\n")
            
            prompt = self.generate_first_prompt()
            print(self.colored_text("─" * 50, 'blue'))
            print(textwrap.fill(prompt, width=50))
            print(self.colored_text("─" * 50, 'blue'))
            
            # Save prompt to file for easy copying
            prompt_file = self.project_root / "first-prompt.txt"
            prompt_file.write_text(prompt)
            print(f"\n(Prompt also saved to {prompt_file})")
            
        except KeyboardInterrupt:
            print("\n\n" + self.colored_text("Wizard cancelled.", 'red'))
            return False
            
        return True

if __name__ == "__main__":
    wizard = ProjectWizard()
    wizard.run()