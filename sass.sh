#!/usr/bin/bash
echo "Removing TailwindCSS and relevant packages and files.."
npm remove tailwindcss @tailwindcss/forms prettier-plugin-tailwindcss
rm src/style.css src/ts/main.ts tailwind.config.js
clear
echo "Installing Sass.."
npm i -D sass @fullhuman/postcss-purgecss
clear
echo "Creating src/scss folder.."
mkdir src/scss
echo "Adding basic CSS Reset and base styles.."
echo "*, *::before, *::after {box-sizing: border-box;}* {margin: 0;}body {line-height: 1.5;-webkit-font-smoothing: antialiased;min-height: 100vh;}img, picture, video, canvas, svg {display: block;max-width: 100%;}input, button, textarea, select {font: inherit;}p, h1, h2, h3, h4, h5, h6 {overflow-wrap: break-word;}#root, #__next {isolation: isolate;}" > src/scss/_base.scss
echo "@use 'base';" > src/scss/main.scss
echo "Adding import for main.scss to main.ts.."
echo "import '../scss/main.scss'" > src/ts/main.ts
echo "Updating postcss configuration.."
rm postcss.config.js
echo "const purgecss = require('@fullhuman/postcss-purgecss'); module.exports = ({ env }) => ({plugins: env === 'production' ? [require('autoprefixer'), purgecss({ content: ['./index.html', './src/**/*.ts'] }),] : [],})" > postcss.config.cjs
echo "Updating prettier configuration.."
sed '5d' .prettierrc > temp
rm .prettierrc
cat temp > .prettierrc && rm temp
echo "Updating vite configuration..."
current=`pwd`
name=`basename "$current"`
sed "s/repo-name/$name/" vite.config.ts > temp
rm vite.config.ts
cat temp > vite.config.ts && rm temp
echo "Finishing up.."
npx prettier .prettierrc --write
npx prettier postcss.config.cjs --write
npx prettier vite.config.ts --write
clear
echo "Project setup successful!"
rm sass.sh
rm removeTailwind.sh
