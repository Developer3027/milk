const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        mPlusCode: ['M PLUS 1 Code', 'monospace'],
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
    },
    colors: {
      'terminal-green': { '100': '#15FF00' },
      'terminal-window': { '100': '#141414' },
      'input-background': { '100': '#1E1E1E' },
      'input-border': { '100': '#BCA465' },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
