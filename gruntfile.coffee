module.exports = (grunt) ->

  # Config
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    # Coffee -> JS
    coffee:
      compile:
        options:
          bare: true
          sourceMap: true
          sourceMapDir: 'build/'
        files:
          'build/app.js': ['src/coffee/app.coffee', 'src/coffee/pages/*.coffee', 'src/coffee/run.coffee']


    # HTML 2 JS
    html2js:
      options:
        htmlmin:
          collapseBooleanAttributes: true
          collapseWhitespace: true
          removeAttributeQuotes: true
          removeComments: true
          removeEmptyAttributes: true
          removeScriptTypeAttributes: true
          removeStyleLinkTypeAttributes: true
        rename: (name) ->
          return name.replace 'html/', '/pages/'
      main:
        src: ['src/html/*.html']
        dest: 'build/templates.js'

    # JS Concat
    concat:
      options:
        separator: ";\n"
      dist:
        src: ['src/libs/jquery-1.10.2.min.js', 'src/libs/angular.min.js', 'src/libs/angular-*.js', 'src/libs/*.js', 'build/templates.js', 'build/app.js']
        dest: 'build/concat.js'

    # JS Minifier
    uglify:
      postCompile:
        options:
          mangle: true
          sourceMap: true
          drop_console: true
          banner: '/*! <%= pkg.name %> minified - v<%= pkg.version %> - ' +
          '<%= grunt.template.today("yyyy-mm-dd") %> */'
        files:
          'dist/js/app.min.js': ['build/concat.js']

    # CSS Minifier
    cssmin:
      compress:
        options:
          banner: '/* <%= pkg.name %> <%= grunt.template.today("dd-mm-yyyy") %> */'
        files:
          'dist/css/style.min.css': ['src/css/*.css']

    'gh-pages':
      options:
        base: 'dist'
      src: ['**']

  # These plugins provide necessary tasks
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-html2js'
  grunt.loadNpmTasks 'grunt-uncss'
  grunt.loadNpmTasks 'grunt-gh-pages'

  # Default task
  grunt.registerTask 'default', ['coffee', 'html2js', 'concat', 'uglify', 'cssmin']