# Joy's Beautiful Apple-themed Blog

A beautiful, modern static blog built with [YOCaml](https://github.com/xhtmlboi/yocaml) - an OCaml static site generator. This blog features Apple-inspired design with smooth animations, Lottie graphics, and a delightful user experience.

![Blog Preview](https://img.shields.io/badge/OCaml-5.3.0-orange) ![YOCaml](https://img.shields.io/badge/YOCaml-2.5.0-blue) ![License](https://img.shields.io/badge/license-MIT-green)

## ✨ Features

- 🎨 **Apple-inspired Design** - Clean, modern UI with glassmorphism effects
- ✨ **Lottie Animations** - Smooth, engaging animations throughout
- 📱 **Fully Responsive** - Beautiful on all devices
- 🚀 **Lightning Fast** - Static site generation for optimal performance
- 📝 **Markdown Support** - Write content in Markdown with YAML frontmatter
- 🏷️ **Tag System** - Organize articles with tags
- 📰 **RSS Feed** - ATOM feed for syndication
- 🎯 **SEO Optimized** - Semantic HTML and meta tags
- 🌈 **Smooth Scrolling** - Delightful navigation experience

## 📁 Project Structure

```
last_blog/
├── _build/                 # Dune build artifacts (generated)
├── _opam/                  # Local opam switch
├── _www/                   # Generated site output (generated)
│   ├── .cache             # YOCaml cache
│   ├── articles/          # Generated article HTML files
│   ├── images/            # Copied images
│   ├── style.css          # Concatenated CSS
│   ├── atom.xml           # RSS/ATOM feed
│   ├── index.html         # Homepage
│   ├── about.html         # About page
│   └── contact.html       # Contact page
├── assets/
│   ├── css/
│   │   ├── reset.css      # CSS reset
│   │   └── style.css      # Main stylesheet
│   ├── images/
│   │   └── icons.svg      # Icon assets
│   └── templates/
│       ├── layout.html    # Base layout template
│       ├── page.html      # Page template
│       ├── article.html   # Article template
│       └── index.html     # Homepage template
├── bin/
│   ├── dune               # Executable configuration
│   └── joy_blog.ml        # Main generator code
├── content/
│   ├── articles/          # Article markdown files
│   │   └── my-first-article.md
│   ├── pages/             # Page markdown files
│   │   ├── about.md
│   │   └── contact.md
│   └── index.md           # Homepage content
├── dune-project           # Dune project configuration
├── joy_blog.opam          # OPAM package file (generated)
└── README.md              # This file
```

## 🚀 Quick Start

### Prerequisites

- **OCaml** 5.3.0 or higher
- **opam** 2.0 or higher
- **dune** 3.0 or higher

### Installation

1. **Clone the repository:**

```bash
git clone https://github.com/yourusername/joy-blog.git
cd joy-blog
```

2. **Create a local opam switch:**

```bash
opam switch create . 5.3.0 --deps-only
eval $(opam env)
```

3. **Install dependencies:**

```bash
dune build
opam install . --deps-only
```

4. **Build the blog:**

```bash
dune build
```

5. **Run the development server:**

```bash
dune exec joy_blog server
```

6. **Visit your blog:**
   Open your browser and navigate to `http://localhost:8000`

## 📝 Creating Content

### Writing Articles

Create a new markdown file in `content/articles/`:

```markdown
---
title: My Awesome Article
description: A brief description of the article
date: 2025-11-03
tags: [ocaml, functional-programming, yocaml]
---

# My Awesome Article

Your content here in **Markdown** format!
```

**Required frontmatter fields:**

- `title` - Article title
- `date` - Publication date (YYYY-MM-DD format)

**Optional frontmatter fields:**

- `description` - Brief article summary
- `tags` - Array of tags

### Writing Pages

Create a new markdown file in `content/pages/`:

```markdown
---
page_title: My Page
description: Page description
tags: [page, info]
---

# Page Content

Your page content here!
```

**Optional frontmatter fields:**

- `page_title` - Page title
- `description` - Page description
- `tags` - Array of tags

### Homepage

Edit `content/index.md` to customize your homepage content.

## 🎨 Customization

### Modify Design

Edit `assets/css/style.css` to customize:

- Colors (CSS variables in `:root`)
- Spacing
- Border radius
- Shadows
- Animations

### Update Templates

Templates are in `assets/templates/`:

- `layout.html` - Base layout with navigation and footer
- `page.html` - Template for regular pages
- `article.html` - Template for blog articles
- `index.html` - Homepage template with article list

Templates use [Jingoo](https://github.com/tategakibunko/jingoo) templating language (similar to Jinja2).

### Change Site Information

Edit `bin/joy_blog.ml` and update the `Feed` module:

```ocaml
module Feed = struct
  let path = "atom.xml"
  let title = "Your Blog Title"
  let site_url = "https://yourusername.github.io"
  let feed_description = "Your blog description"

  let owner =
    Yocaml_syndication.Person.make
      ~uri:site_url
      ~email:"your@email.com"
      "Your Name"
  ...
end
```

## 🚀 Deployment

### GitHub Pages

1. **Create a GitHub repository** for your blog

2. **Create `.github/workflows/deploy.yml`:**

```yaml
name: Deploy Blog

on:
  push:
    branches:
      - main

jobs:
  deploy:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v3

      - name: Setup OCaml
        uses: ocaml/setup-ocaml@v2
        with:
          ocaml-compiler: 5.3.0

      - name: Install dependencies
        run: |
          opam install . --deps-only

      - name: Build site
        run: |
          eval $(opam env)
          dune build
          dune exec joy_blog

      - name: Deploy to GitHub Pages
        uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./_www
          enable_jekyll: false
```

3. **Enable GitHub Pages** in your repository settings:

   - Go to Settings → Pages
   - Source: Deploy from a branch
   - Branch: `gh-pages` / `root`

4. **Push to GitHub:**

```bash
git add .
git commit -m "Initial commit"
git push origin main
```

Your blog will be automatically deployed to `https://yourusername.github.io`!

### Custom Domain

1. Add a `CNAME` file to your `content/` directory with your domain
2. Update `site_url` in `bin/joy_blog.ml`
3. Configure your DNS to point to GitHub Pages

## 🛠️ Development Commands

```bash
# Build the project
dune build

# Run development server (auto-rebuilds on changes)
dune exec joy_blog server

# Build for production
dune exec joy_blog

# Clean build artifacts
dune clean

# Install dependencies
opam install . --deps-only

# Update dependencies
opam update && opam upgrade
```

## 📚 Technology Stack

- **[YOCaml](https://github.com/xhtmlboi/yocaml)** - Static site generator
- **[OCaml](https://ocaml.org/)** - Programming language
- **[Dune](https://dune.build/)** - Build system
- **[Jingoo](https://github.com/tategakibunko/jingoo)** - Template engine
- **[Cmarkit](https://github.com/dbuenzli/cmarkit)** - Markdown parser
- **[Lottie](https://lottiefiles.com/)** - Animations

## 🤝 Contributing

Contributions are welcome! Feel free to:

- Report bugs
- Suggest features
- Submit pull requests

## 📄 License

MIT License - feel free to use this project for your own blog!

## 👤 Author

**Joy Aruku**

- GitHub: [@joyaruku](https://github.com/joyaruku)
- Website: [https://yourusername.github.io](https://yourusername.github.io)

## 🙏 Acknowledgments

- [YOCaml](https://yocaml.github.io/) team for the excellent static site generator
- [OCaml](https://ocaml.org/) community
- Apple for design inspiration
- [LottieFiles](https://lottiefiles.com/) for beautiful animations

---

Built with ❤️ using OCaml and YOCaml
