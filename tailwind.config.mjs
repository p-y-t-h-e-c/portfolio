/** @type {import('tailwindcss').Config} */
export default {
  content: ['./src/**/*.{astro,html,js,ts}'],
  theme: {
    extend: {
      colors: {
        surface: {
          DEFAULT: '#161618',
          raised: '#1e1e21',
          overlay: '#252528',
        },
        primary:   '#eeecea',
        secondary: '#b0aeac',
        muted:     '#737270',
        accent:    '#6ec6a8',
        border: {
          subtle: 'rgba(255,255,255,0.10)',
          DEFAULT: 'rgba(255,255,255,0.20)',
        },
      },
      fontFamily: {
        sans: ['IBM Plex Sans', 'sans-serif'],
        mono: ['IBM Plex Mono', 'monospace'],
      },
    },
  },
  plugins: [],
};