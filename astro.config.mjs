import { defineConfig } from 'astro/config';
import tailwindcss from '@tailwindcss/vite';

export default defineConfig({
  site: 'https://p-y-t-h-e-c.github.io',
  base: 'portfolio',
  vite: {
    plugins: [tailwindcss()]
  }
});