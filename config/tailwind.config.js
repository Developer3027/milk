const defaultTheme = require('tailwindcss/defaultTheme')

const colors = require('tailwindcss/colors')

module.exports = {
  important: true,
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
        dosis: ["Dosis", "sans-serif"],
        fell: ["IM Fell English SC", "serif"],
        Inconsolata: ["Inconsolata", "monospace"],
        Prompt: ["'Prompt', sans-serif;"],
      },
      colors: {
        'terminal-green': '#15FF00',
        'terminal-window': '#141414',
        'input-background': '#1E1E1E',
        'input-border': '#BCA465',
        'rust-brown': '#4c3d31',
        'hermit-light-blue': '#57b0c3',
        "antique-20": "#dfdacb",
        "bright-yellow": "#faff00",
        "bright-purple": "#ad00ff",
        "bright-green": "#10c500",
        "drk-green": "#075500",
        "link-blue": "#0095d6",
        "st-lt-primary": "#B5E5FF",
        "st-primary": "#3E717E",
        "st-drk-primary": "#40677D",
        "st-lt-secondary": "#FFD7C2",
        "st-secondary": "#FFB389",
        "st-drk-secondary": "#FF9256",
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
