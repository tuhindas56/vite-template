/* eslint-disable */
import { defineConfig } from 'vite'
import { createHtmlPlugin } from 'vite-plugin-html'

export default defineConfig(({}) => {
  return {
    base: '/repo-name/',
    plugins: [
      createHtmlPlugin({
        minify: true,
      }),
    ],
  }
})
