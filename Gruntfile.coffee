module.exports = (grunt) ->
  SRC_DIR    = 'src'
  DEST_DIR   = 'lib'
  TEST_DIR   = 'test'
  REPORT_DIR = 'test-reports'

  # Project configuration.
  grunt.initConfig
    clean: [DEST_DIR, REPORT_DIR]

    coffee:
      compileEachMap:
        options:
          sourceMap: false
        files: [
          expand: true
          flatten: false
          cwd: SRC_DIR
          src: ['**/*.coffee']
          dest: DEST_DIR
          ext: '.js'
        ]

    mochaTest:
      testMocha:
        src: [ "#{TEST_DIR}/*.coffee"]
        options:
          reporter: 'mocha-multi'

      testNotMocha:
        src: [ "#{TEST_DIR}/*.coffee"]
        options:
          reporter: 'spec'

    shell:
      createReportsDir:
        command: "mkdir -p #{REPORT_DIR}"
        options:
          stdout: true
          stderr: true

      runWatch:
        command: [
          "node #{DEST_DIR}/index.js"
          ].join '&&'
        options:
          stdout: true
          stderr: true
          failOnError: true

  # These plugins provide necessary tasks.
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-mocha-test'
  grunt.loadNpmTasks 'grunt-shell'

  grunt.loadNpmTasks 'grunt-coffeelint'

  grunt.registerTask 'testMocha', ->
    process.env.multi = "xunit=#{REPORT_DIR}/xunit.xml json=#{REPORT_DIR}/report.json"
    grunt.task.run [ 'shell:createReportsDir', 'mochaTest:testMocha' ]

  # Default task.
  #grunt.registerTask "default", ["jshint", "nodeunit"]
  grunt.registerTask 'compile', ['clean', 'coffee']
  grunt.registerTask 'default', ['compile']
  grunt.registerTask 'dev', ['compile', 'shell:runWatch' ]
  grunt.registerTask 'dev-with-mochamulti', ['compile', 'testMocha', 'shell:runWatch' ]
  grunt.registerTask 'dev-without-mochamulti', ['compile', 'mochaTest:testNotMocha', 'shell:runWatch' ]