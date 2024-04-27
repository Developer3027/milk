const defaultTheme = require('tailwindcss/defaultTheme')

const colors = require('tailwindcss/colors')

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
      colors: {
        'terminal-green': '#15FF00',
        'terminal-window': '#141414',
        'input-background': '#1E1E1E',
        'input-border': '#BCA465',
        'rust-brown': '#4c3d31',
        'hermit-light-blue': '#57b0c3',
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
