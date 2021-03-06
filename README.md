![Feather CMS](https://github.com/FeatherCMS/feather/blob/main/Assets/GitHub-Lead.png?raw=true)

# Feather CMS 🪶

Feather is a modern Swift-based content management system powered by Vapor 4.

Click to join chat on [Discord](https://discord.gg/wMSkxCUXAD).


## Requirements 

To use Feather it is recommended to install Swift 5.3 or greater. 

If you need help installing Swift, then you should follow the instructions on [swift.org](https://swift.org/download/#releases). 


## Installation

- Clone or download the source files.

```bash
git clone https://github.com/FeatherCMS/feather.git
```

- Setup the `.env.development` file using the `make env` command or config the following values by hand:

```bash
# the base url of your web server
BASE_URL="http://localhost:8080"

# the base path (absolute) of the working directory
BASE_PATH="/path/to/feather/" 
```

- Run the `make run` command from the project directory (aka. working directory).


### Using Xcode

- ⚠️ Warning: DO NOT USE the `swift package generate-xcodeproj` command.  
- Make sure that you open the project by double clicking the `Package.swift` file.
- ⚠️ Set the [custom working directory](https://theswiftdev.com/beginners-guide-to-server-side-swift-using-vapor-4/) for the `Feather` scheme to the root of the project directory.
- If needed setup a [post-action script](https://theswiftdev.com/10-short-advices-that-will-make-you-a-better-vapor-developer-right-away/) to automatically shut-down previous server instances.
- Build and run the project as usual and enjoy your Feather powered site.


## Configuration

### Using nginx as a reverse proxy

Setup [nginx](https://docs.vapor.codes/4.0/deploy/nginx/) as a reverse proxy server.

If you prefer nginx as a static file server for your public files, you can disable the file middleware inside the `configure.swift` file.

Please note that nginx is the preferred way of hosting Feather-based apps.


### Database drivers

By default Feather uses the SQLite driver, but it is possible to use PostgreSQL, MySQL (MariaDB) or even MongoDB as your database through the [Fluent](https://docs.vapor.codes/4.0/fluent/overview/) framework.

You should follow the instructions using the official Vapor docs to setup the right driver, but please note that the preferred drivers are PosgreSQL and SQLite for really small projects and development purposes. 


### File storage drivers

The [Liquid framework](https://github.com/binarybirds/liquid/) is an abstract file storage library that works with a local file storage driver, but it is also possible to use Amazon S3 as a cloud-based solution.

You can replace the default local driver with the [S3 driver](https://github.com/BinaryBirds/liquid-aws-s3-driver), which is powered by the [Soto for AWS](https://github.com/soto-project/soto) SDK.


### Core Feather Modules

Feather is a modular CMS system, this means that you can add new modules as Swift Package dependencies and build custom ones using the [Feather Core](https://github.com/FeatherCMS/feather-core) framework. 

Feather core gives you just a few standard modules that you can also disable (e.g you only need an API, without web frontend or admin interface), but it is recommended to keep them around.

- [System](https://github.com/FeatherCMS/system-module) - System functionalities, variables, run modes (install) and (later on) module management.
- [User](https://github.com/FeatherCMS/user-module) - User authentication and role & permission based access control system.
- [Api](https://github.com/FeatherCMS/api-module) - The API module is responsible for hooking up the public and private API endpoints.
- [Admin](https://github.com/FeatherCMS/admin-module) - This module contains standard admin related interface elements and tools.
- [Frontend](https://github.com/FeatherCMS/frontend-module) - Provides the frontend layout including web page and menu management.

Every other module can be completely removed (just alter the SPM dependency & configuration file), feel free to build your own configuration for your needs. 


## Using Feather CMS

### Admin credentials

You can log in to the admin interface using the `root@feathercms.com` & `FeatherCMS` account. 
For security reasons, please change the default email & password using the admin user menu ASAP.


### Other Feather modules

Under the official [GitHub](https://github.com/FeatherCMS/) organization you'll find the following modules: 

- [Redirect](https://github.com/FeatherCMS/redirect-module/) - This module is responsible for dynamic URL redirects.
- [Blog](https://github.com/FeatherCMS/blog-module/) - This module is responsible for providing a simple blog platform.
- [Markdown](https://github.com/FeatherCMS/markdown-module/) - This module is responsible for displaying markdown via a content filter.
- [Swifty](https://github.com/FeatherCMS/swifty-module/) - This module is responsible for Swift related syntax highlights using a content filter.
- [Sponsor](https://github.com/FeatherCMS/sponsor-module/) - This module is responsible for displaying a sponsorship box.
- [Analytics](https://github.com/FeatherCMS/analytics-module/) -  This module is reponsible for providing basic analytics for Feather.

Feel free to build & share your own modules to extend the functionality of the core system.

## Contributions and support

Feather is an open source software and your contributions are more than welcome.

If you wish to make a change, please open a [Pull Request](https://github.com/FeatherCMS/feather/pulls).

Please don't hesitate to send your feedbacks, thoughts and ideas about Feather.


## Known issues

### Bcrypt segfault (running from cli using Swift 5.2 & macOS)

When running the app using the command line under macOS Catalina & Swift 5.2 the install process fails with a `segmentation fault` error.
Some users were able to install the system, but the login method caused the exact same error message, these issues are related to a Swift bug.

Please check this [issue](https://bugs.swift.org/browse/SR-12424) for more details. 


### Debugging Feather

If you see a `Segmentation fault: 11` error or something similar, you can start the server through the `lldb` debugger to find out the reason. 

```bash
lldb ./.build/debug/Run
process launch serve

# print backtrace
bt
# look up a symbol
image lookup -a 0x1000 
```

Start the debugger and launch the serve command. Then try to repeat the steps that caused the crash.
You can print out the backtrace using the `bt` command, this can help you to identify the problem.


## Credits

- [Vapor](https://vapor.codes) - underlying framework
- [Feather icons](https://feathericons.com) - feather icons


### License

[WTFPL](LICENSE)

