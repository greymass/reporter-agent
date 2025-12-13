import { defineConfig } from 'astro/config';
import tailwindcss from '@tailwindcss/vite';
import sitemap from 'astro-sitemap';

export default defineConfig({
  site: 'https://reporter.greymass.io',
  integrations: [sitemap()],
  experimental: {
    contentLayer: true,
  },
  vite: {
    plugins: [tailwindcss()],
  },
});
