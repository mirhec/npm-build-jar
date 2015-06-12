# Build jar
This is an extension you can use to create a JAR archive. This is useful if you want to use npm as your [build tool](http://blog.keithcirkel.co.uk/how-to-use-npm-as-a-build-tool/), e.g. to build your Java applications.

## General usage
You can create the following config parameters if you want to. If you don't specify a main class, it will be packed as a non executable jar file. The `name` parameter is the only required parameter. The script will create a jar file named `[name]-[version].jar`. The version is expected to be set as git tag.

```
"config": {
    "main_class": "com.your.mainclass",
    "bin": "bin",
    "name": "Product Name"
}
```

Then the only thing you have to do is creating a scripts part in your `package.json` in order to copy all the resource files to your bin/classes directory:

```
"devDependencies": {
    "build-jar": "^1.0.0"
},
"scripts": {
    "build:jar": "build-jar"
  }
```

Now you can run the build command using a simple `npm run build:jar`.
