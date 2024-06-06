# vite-template

`Project name` built as part of <a href="">The Odin Project curriculum</a>

## Setup

- Install dependencies: `npm i`
- Start server: `npm run dev`
- Build: `npm run build`

### Note

- To remove TailwindCSS and use Sass:

  1. Run `npm remove tailwindcss @tailwindcss/forms autoprefixer postcss prettier-plugin-tailwindcss && rm src/style.css src/main.ts tailwind.config.js postcss.config.js && npm i -D sass && touch src/styles.scss && echo import "'./styles.scss'" > src/main.ts`
  2. Update **.prettierrc**:

     ```
     - "plugins": ["prettier-plugin-tailwindcss"]
     ```

- Allow read and write permissions for GitHub Actions to work!