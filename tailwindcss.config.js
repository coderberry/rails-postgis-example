module.exports = {
  theme: {},
  variants: {},
  variants: {
    borderWidth: ['responsive', 'first', 'hover', 'focus'],
  },
  plugins: [],
  purge: [
    "./app/views/**/*.html.erb",
    "./app/helpers/**/*rb",
    "./frontend/controllers/**/*.js",
  ],
}

