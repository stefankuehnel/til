# Today I Learned (TIL)

[![CI](../../../actions/workflows/ci.yaml/badge.svg?label=CI&logo=forgejo&logoColor=white&style=flat-square)](../../../actions?workflow=ci.yaml)

A collection of concise write-ups on small things I learn day to day across a variety of languages and technologies.

## Get Started

To get started with the project, follow these steps:

1. **Clone the repository:**

   ```bash
   git clone https://codeberg.org/stefankuehnel/til.git
   cd til
   ```

2. **Initialize project:**

   ```bash
   task init --interactive
   ```

3. **Run the development server:**

   ```bash
   task dev
   ```

4. **Open your browser:**

   Navigate to `http://localhost:1111` to see the site in action.

## Usage

This is a static site built with [Zola](https://getzola.org/documentation/). To add new content:

### Adding a new TIL entry

1. **Create a new TIL entry:**
   - Add a new Markdown file to the `content/` directory.
   - Follow the existing naming convention and format.

2. **Build the site:**
   - Run `task build` to generate the static files.

3. **Deploy the site:**
   - Run `task deploy` to publish to your FTP server.

### Adding a new TIL category

1. **Create a new category:**
   - Add a new directory under `content/` for the category.
   - Add an `_index.md` file with the appropriate front matter.

2. **Build the site:**
   - Run `task build` to generate the static files.

3. **Deploy the site:**
   - Run `task deploy` to publish to your FTP server.

## Development

This project uses [Task](https://taskfile.dev) as a task runner.

### Available Tasks

```bash
# Run default tasks (build)
task

# Initialize project
task init

# Run development server
task dev

# Build the project
task build

# Deploy the project
task deploy

# Format code
task format

# Clean project artifacts
task clean
```

## Documentation

Below you will find a list of documentation for tools used in this project.

- **Zola**: A Static Site Generator - [Docs](https://getzola.org/documentation/)
- **Nix**: Nix Package Manager - [Docs](https://wiki.nixos.org/wiki/Nix)
- **Nix Flakes**: An Experimental Feature for Managing Dependencies of Nix Projects - [Docs](https://wiki.nixos.org/wiki/Flakes)
- **Task**: A Task Runner / Build Tool written in Go - [Docs](https://taskfile.dev/)
- **Forgejo Actions**: Automation and Execution of Software Development Workflows - [Docs](https://forgejo.org/docs/latest/user/actions/reference/)

## Found a Bug?

Thank you for your message! Please fill out a [bug report](../../../issues/new?assignees=&labels=&template=bug_report.md&title=).

## License

This project is licensed under the [GNU General Public License](https://www.gnu.org/licenses/gpl-3.0.txt).