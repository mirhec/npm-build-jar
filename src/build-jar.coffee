fs = require 'fs'
colors = require 'colors'
path = require 'path'
exec = require('child_process').spawnSync
env = process.env

module.exports = buildJar = () ->
    bin = env.npm_package_config_bindir ? 'bin'
    main_class = env.npm_package_config_main_class
    name = env.npm_package_config_name
    json = JSON.parse fs.readFileSync('package.json', 'utf8')
    version = json.version

    if not name?
        console.log 'You must provide a name for your jar file!'.red
        return

    if not main_class?
        ret = exec 'jar', ['cf', path.join(bin, name + '-' + version + '.jar'), '-C', path.join(bin, 'classes'), '.'],
            stdio: [0, 0, fs.openSync 'build-jar.log', 'w']
    else
        ret = exec 'jar', ['cfe', path.join(bin, name + '-' + version + '.jar'), main_class, '-C', path.join(bin, 'classes'), '.'],
            stdio: [0, 0, fs.openSync 'build-jar.log', 'w']

    if ret.status == 0
        console.log 'build:jar :: ' + 'Ok'.green + '.'
    else
        console.log 'build:jar :: ' + 'Errors!'.red + ' (Logfile: build-jar.log)'
