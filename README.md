# 2016 Elm Workshop

Order form toy project, for a perfectly normal Pet Shop.

You can see the finished project we will be building here: [**DEMO**](http://fresheyeball.github.io/lambdaconf-2016-elm-workshop/)

<img src="http://i.imgur.com/Osup29r.png" height="300" />

- [Click here to view live presentation](https://slides.com/fresheyeball/elm-workshop/live)
- If the workshop has ended you can review the slides [here](https://slides.com/fresheyeball/elm-workshop/)

## In this project you will find

A `src/complete` directory and a `src/kit` directory.

- In the `compete` folder you will find the source code for the complete project.
- In the `kit` folder you will find the exercise files for this workshop.

We will be working together to implement the logic in the `complete` folder, using the exercise files found in the `kit` folder.

**PLEASE DO NOT** go right off and read the source code for the completed project. The code in `complete` is intended to serve as a resource in case you get stuck, or want to compare after the fact, not as a cheat sheet.


## Getting setup

(if you have docker on a linux host skip to the end)


### Install Elm

First you are going to need **Elm** installed locally. You can get the installer from [elm-lang.org](http://elm-lang.org/install), or below (mirrored):

- Mac -- [installer](http://install.elm-lang.org/Elm-Platform-0.17.pkg)
- Windows -- [installer](http://install.elm-lang.org/Elm-Platform-0.17.exe)
- Anywhere -- npm installer (below), [build from source](https://github.com/elm-lang/elm-platform)

Or just use **npm**
```
npm install -g elm@0.17.0
```


### Editor setup

You can use any editor you like, however there is reasonably good Elm support for the following editors.

- Atom
  - `apm install language-elm linter elm-linter-make`
- Emacs
  - [elm-mode](https://github.com/jcollard/elm-mode)
- Vim
  - [elm-vim](https://github.com/ElmCast/elm-vim)
- Lightable
  - [elm-light](https://github.com/rundis/elm-light)
- Sublime Text
  - [Elm.tmLanguage](https://github.com/deadfoxygrandpa/Elm.tmLanguage)
- Visual Studio Code
  - [vscode-elm](https://github.com/sbrink/vscode-elm)


### Running the project

```
git clone https://github.com/Fresheyeball/lambdaconf-2016-elm-workshop.git
cd lambdaconf-2016-elm-workshop
elm reactor
```

Elm comes with a server and compilation assistant called **reactor**. After running `elm reactor` you should be able to visit [localhost:8000/src/kit/Main.elm](http://localhost:8000/src/kit/Main.elm) in your browser to see the output of your code.

#### CAUTION

We will be working the the latest version of the Elm compiler **0.17.x**, which came out this month. If you have issues or run into weirdness, usually `rm -rf elm-stuff` will clear it up.

### Docker

If you have docker on a Linux host, there is a prepped image to run this project. Running this script will launch the **Atom** editor with **Elm** packages installed and a browser window with the **Reactor**. If the browser window fails to open just visit [localhost:8000/src/kit/Main.elm](http://localhost:8000/src/kit/Main.elm)

```
./docker-dev.sh
```

when you are done its recommended you run `xhost -` as this script opens up xorg to serve atom from inside the container.

# [Elm Resources](https://github.com/Fresheyeball/lambdaconf-2016-elm-workshop/blob/master/Resources.md)
# [Lets GO!](https://github.com/Fresheyeball/lambdaconf-2016-elm-workshop/blob/master/Tasks.md)
