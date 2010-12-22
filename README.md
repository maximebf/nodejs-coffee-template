
# Template for projects using nodejs + coffeescript

Technologies used in this template:

+   [node.js](http://nodejs.org/)
+   [coffeescript](http://jashkenas.github.com/coffee-script/)
+   [express](http://expressjs.com/)
+   [eco](https://github.com/sstephenson/eco)
+   [less](http://lesscss.org/)

## Installing

The following *npm* packages are required:

+   *express*
+   *coffee-script*
+   *eco*
+   *less*

To install them run:

    make modules

To create the public dir:

    make public

## Structure

+   **server.coffee**: the file that configures and starts the server
+   **app/**: directory where all application related files are stored
    +   **assets/**: assets files (css + js), will automatically will published to public/
        +   **css/**: less css files, must use the .less extension
        +   **js/**: coffeescript files, must use the .coffee extension
    +   **views/**: views file (see express documentation)
    +   **actions.coffee**: your url handlers
+   **public/**: the publicly available directory

# Starting the server

    coffee server.coffee [--port=8080]

# The *actions.coffee* file

The file is pretty straightforward:

    exports.actions = (app, argv, options) ->

        app.get '/', (req, res) -> 
            res.render 'index'
            
        # add more actions here

As you can see, you can add more actions following the express documentation below the existing one.
